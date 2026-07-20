import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import axiosClient from "../../api/axiosClient";
import { FiArrowRight, FiArrowLeft, FiSearch, FiCheckCircle, FiUploadCloud, FiFileText, FiLoader} from "react-icons/fi";
import SearchMultiSelect from "../../components/admin/search";
import { alertWarning, alertError, alertSuccess } from "../../utils/SwalAlert";
import { fileUrl } from "../../utils/FileUrl";

const initMedicine = {
  medicineCode: "",
  brandName: "",
  origin: "",
  status: "đang cung cấp",
  price: "",
  registrationNumber: "",
  unit: "Viên",
};

const init_usage = {
  dosageForm: "",
  packaging: "",
  uses: "",
  contraindications: "",
  sideEffects: "",
  dosageAdministration: "",
  storageCondition: "",
  warning: "",
};

const inputClass =
  "w-full py-3 px-4 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 text-sm focus:outline-none focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-500/20 transition-all";
const labelClass = "block text-sm font-bold text-slate-700 mb-2";

const UpdateMedicine = () => {
  const { id } = useParams();
  const navigate = useNavigate();

  const [step, setStep] = useState(1);
  const [initLoading, setInitLoading] = useState(true);

  const [basicForm, setBasicForm] = useState(initMedicine);
  const [ocrForm, setOcrForm] = useState(init_usage);

  const [medicineImageFile, setMedicineImageFile] = useState(null);
  const [medicinePreview, setMedicinePreview] = useState(null);
  const [existingImageUrl, setExistingImageUrl] = useState(null);

  const [documentFile, setDocumentFile] = useState(null);
  const [documentPreview, setDocumentPreview] = useState(null);
  const [existingDocumentUrl, setExistingDocumentUrl] = useState(null);

  const [loading, setLoading] = useState(false);
  const [ocrLoading, setOcrLoading] = useState(false);

  const [selectedGroups, setSelectedGroups] = useState([]);
  const [selectedIngredients, setSelectedIngredients] = useState([]);
  const [documentPath, setDocumentPath] = useState(null);

  useEffect(() => {
    let active = true;
    setInitLoading(true);

    axiosClient
      .get(`/medicines/medicine-detail/${id}`)
      .then((res) => {
        if (!active) return;
        const medicine = res.data.data;

        setBasicForm({
          medicineCode: medicine.medicineCode || "",
          brandName: medicine.brandName || "",
          origin: medicine.origin || "",
          status: medicine.status || "đang cung cấp",
          price: medicine.price != null ? String(medicine.price) : "",
          registrationNumber: medicine.registrationNumber || "",
          unit: medicine.unit || "Viên",
        });

        setOcrForm({
          dosageForm: medicine.usageInstruction?.dosageForm || "",
          packaging: medicine.usageInstruction?.packaging || "",
          uses: medicine.usageInstruction?.uses || "",
          contraindications: medicine.usageInstruction?.contraindications || "",
          sideEffects: medicine.usageInstruction?.sideEffects || "",
          dosageAdministration:
            medicine.usageInstruction?.dosageAdministration || "",
          storageCondition: medicine.usageInstruction?.storageCondition || "",
          warning: medicine.usageInstruction?.warning || "",
        });

        setSelectedGroups(medicine.medicineGroupInfo || []);
        setSelectedIngredients(
          (medicine.ingredientDetailInfo || []).map((d) => ({
            ingredientId: d.ingredientInfo?.ingredientId,
            ingredientName: d.ingredientInfo?.ingredientName,
            strength: d.strength || "",
          })),
        );

        setExistingImageUrl(fileUrl(medicine.imageUrl) || null);
        setExistingDocumentUrl(fileUrl(medicine.usageInstruction?.document) || null);
      })
      .catch((err) => {
        alertError(err || "Không thể tải thông tin thuốc, vui lòng thử lại!");
      })
      .finally(() => {
        if (active) setInitLoading(false);
      });

    return () => {
      active = false;
    };
  }, [id]);

  const handleBasicChange = (e) => {
    setBasicForm((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handlePriceChange = (e) => {
    const raw = e.target.value;
    if (raw === "" || /^\d+$/.test(raw)) {
      setBasicForm((prev) => ({ ...prev, price: raw }));
    }
  };

  const handleOcrChange = (e) => {
    setOcrForm((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleMedicineImageChange = (e) => {
    const file = e.target.files[0];
    if (!file) return;
    setMedicineImageFile(file);
    setMedicinePreview(URL.createObjectURL(file));
  };

  const handleDocumentChange = (e) => {
    const file = e.target.files[0];
    if (!file) return;
    setDocumentFile(file);
    setDocumentPreview(URL.createObjectURL(file));
  };

  const handleOCR = async () => {
    if (!documentFile) return alertWarning("Vui lòng chọn ảnh tờ hướng dẫn!");
    setOcrLoading(true);
    try {
      const formData = new FormData();
      formData.append("image", documentFile);

      const res = await axiosClient.post("/ocr/medicine", formData, {
        headers: { "Content-Type": "multipart/form-data" },
      });
      setDocumentPath(res.data.documentPath);

      setOcrForm({
        dosageForm: res.data.dosage_form || "",
        packaging: res.data.packaging || "",
        uses: res.data.uses || "",
        contraindications: res.data.contraindications || "",
        sideEffects: res.data.side_effects || "",
        dosageAdministration: res.data.dosage_administration || "",
        storageCondition: res.data.storage_condition || "",
        warning: res.data.warning || "",
      });
    } catch (error) {
      console.error("OCR lỗi:", error.response?.data || error.message);
      alertError("OCR thất bại, vui lòng thử lại!");
    } finally {
      setOcrLoading(false);
    }
  };

  const handleSubmit = async () => {
    if (selectedGroups.length === 0)
      return alertWarning("Vui lòng chọn ít nhất 1 nhóm thuốc!");
    if (selectedIngredients.length === 0)
      return alertWarning("Vui lòng chọn ít nhất 1 hoạt chất!");
    if (selectedIngredients.some((i) => !i.strength?.trim())) {
      return alertWarning("Vui lòng nhập hàm lượng cho tất cả hoạt chất đã chọn!");
    }

    const groupIds = selectedGroups.map((g) => g.groupId);
    const ingredients = selectedIngredients.map((i) => ({
      ingredientId: Number(i.ingredientId),
      strength: i.strength.trim(),
    }));

    setLoading(true);
    try {
      const formData = new FormData();

      Object.entries({ ...basicForm, price: Number(basicForm.price) }).forEach(
        ([key, value]) => formData.append(key, value),
      );

      formData.append("groupIds", JSON.stringify(groupIds));
      formData.append("ingredients", JSON.stringify(ingredients));
      formData.append("usageData", JSON.stringify(ocrForm));

      if (medicineImageFile) formData.append("medicine", medicineImageFile);

      if (documentPath) {
        formData.append("documentPath", documentPath);
      } else if (documentFile) {
        formData.append("document", documentFile);
      }

      await axiosClient.put(`/medicines/${id}`, formData, {
        headers: { "Content-Type": "multipart/form-data" },
      });

      alertSuccess("Cập nhật thuốc thành công!");
      navigate("/admin/medicine-management"); 
    } catch (error) {
      console.error("Cập nhật thuốc lỗi:", error.response?.data);
      alertError( error || "Cập nhật thất bại!");
    } finally {
      setLoading(false);
    }
  };

  if (initLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-50 flex items-center justify-center gap-2 text-slate-400">
        <FiLoader className="h-5 w-5 animate-spin" />
        <span className="text-sm font-medium">Đang tải thông tin thuốc…</span>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-50 py-12 px-4 font-sans">
      <div className="max-w-4xl mx-auto bg-white rounded-3xl shadow-xl overflow-hidden border border-white/50">
        {/* Header & Stepper */}
        <div className="bg-slate-900 text-white p-8">
          <h2 className="text-3xl font-extrabold mb-6 tracking-tight">
            {" "}
            Cập Nhật Thuốc{" "}
          </h2>
          <div className="flex items-center gap-4 text-sm font-medium">
            <div
              className={`flex items-center gap-2 ${step === 1 ? "text-blue-400" : "text-emerald-400"}`}
            >
              <div className="w-8 h-8 rounded-full border-2 flex items-center justify-center border-current">
                1
              </div>
              <span>Thông tin thuốc</span>
            </div>
            <div className="w-12 h-px bg-slate-700"></div>
            <div
              className={`flex items-center gap-2 ${step === 2 ? "text-blue-400" : "text-slate-500"}`}
            >
              <div className="w-8 h-8 rounded-full border-2 flex items-center justify-center border-current">
                2
              </div>
              <span>Quét OCR & Hướng dẫn sử dụng</span>
            </div>
          </div>
        </div>

        <div className="p-8 md:p-10">
          {step === 1 && (
            <div className="animate-fade-in">
              <div className="flex items-center gap-3 mb-6 text-blue-600">
                <h3 className="text-xl font-bold text-slate-800">
                  Thông tin thuốc
                </h3>
              </div>

              <div className="mb-6">
                <label className={labelClass}>Ảnh hiển thị thuốc</label>
                <div className="bg-slate-50 border-2 border-dashed border-slate-200 rounded-2xl p-5 text-center">
                  <input
                    type="file"
                    accept="image/*"
                    onChange={handleMedicineImageChange}
                    className="hidden"
                    id="upload-medicine"
                  />
                  <label
                    htmlFor="upload-medicine"
                    className="cursor-pointer flex flex-col items-center gap-2"
                  >
                    {medicinePreview || existingImageUrl ? (
                      <img
                        src={medicinePreview || existingImageUrl}
                        alt="preview"
                        className="max-h-36 rounded-lg shadow border border-slate-200"
                      />
                    ) : (
                      <div className="w-12 h-12 bg-slate-100 text-slate-400 rounded-full flex items-center justify-center">
                        <FiUploadCloud className="w-6 h-6" />
                      </div>
                    )}
                    <span className="text-sm text-slate-500 font-medium">
                      {medicinePreview || existingImageUrl
                        ? "Nhấn để chọn ảnh khác"
                        : "upload ảnh hiển thị thuốc"}
                    </span>
                  </label>
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                <div>
                  <label className={labelClass}>Mã thuốc ATC</label>
                  <input
                    name="medicineCode"
                    value={basicForm.medicineCode}
                    onChange={handleBasicChange}
                    placeholder="VD: N02BE01"
                    className={inputClass}
                  />
                </div>
                <div>
                  <label className={labelClass}>Tên thuốc</label>
                  <input
                    name="brandName"
                    value={basicForm.brandName}
                    onChange={handleBasicChange}
                    placeholder="VD: Paracetamol 500mg (Acetaminophen)"
                    className={inputClass}
                  />
                </div>
                <div>
                  <label className={labelClass}>Xuất xứ</label>
                  <input
                    name="origin"
                    value={basicForm.origin}
                    onChange={handleBasicChange}
                    placeholder="VD: Việt Nam"
                    className={inputClass}
                  />
                </div>
                <div>
                  <label className={labelClass}>Trạng thái cung cấp</label>
                  <select
                    name="status"
                    value={basicForm.status}
                    onChange={handleBasicChange}
                    className={inputClass}
                  >
                    <option value="đang cung cấp">Đang cung cấp</option>
                    <option value="ngừng cung cấp">Ngừng cung cấp</option>
                    <option value="hết hàng">Hết hàng</option>
                  </select>
                </div>
                <div>
                  <label className={labelClass}>Giá bán (VNĐ)</label>
                  <input
                    name="price"
                    type="text"
                    inputMode="numeric"
                    value={basicForm.price}
                    onChange={handlePriceChange}
                    placeholder="VD: 500000"
                    className={inputClass}
                  />
                </div>
                <div>
                  <label className={labelClass}>Số đăng ký</label>
                  <input
                    name="registrationNumber"
                    value={basicForm.registrationNumber}
                    onChange={handleBasicChange}
                    placeholder="VD: VN-0512-22"
                    className={inputClass}
                  />
                </div>
                <div>
                  <label className={labelClass}>Đơn vị</label>
                  <select
                    name="unit"
                    value={basicForm.unit}
                    onChange={handleBasicChange}
                    className={inputClass}
                  >
                    {[
                      "Viên",
                      "Vỉ",
                      "Hộp",
                      "Chai",
                      "Lọ",
                      "Tuýp",
                      "Gói",
                      "Ống",
                      "Bình xịt",
                      "Miếng dán",
                    ].map((u) => (
                      <option key={u} value={u}>
                        {u}
                      </option>
                    ))}
                  </select>
                </div>
              </div>

              <SearchMultiSelect
                label="Nhóm thuốc"
                placeholder="Tìm và chọn nhóm thuốc..."
                apiUrl="/medicine-groups"
                idKey="groupId"
                nameKey="groupName"
                selected={selectedGroups}
                onChange={setSelectedGroups}
              />

              <SearchMultiSelect
                label="Hoạt chất & Hàm lượng"
                placeholder="Tìm và chọn hoạt chất..."
                apiUrl="/active-ingredients"
                idKey="ingredientId"
                nameKey="ingredientName"
                selected={selectedIngredients}
                onChange={setSelectedIngredients}
                renderExtra={(item, updateItem) => (
                  <input
                    type="text"
                    placeholder="VD: 500mg"
                    value={item.strength || ""}
                    onChange={(e) => updateItem({ strength: e.target.value })}
                    className="w-36 py-2 px-3 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-500/20"
                  />
                )}
              />

              <div className="flex justify-end pt-6 border-t border-slate-100">
                <button
                  onClick={() => setStep(2)}
                  className="flex items-center gap-2 px-8 py-3 font-bold btn-gradient"
                >
                  Tiếp theo <FiArrowRight />
                </button>
              </div>
            </div>
          )}

          {/* BƯỚC 2 */}
          {step === 2 && (
            <div className="animate-fade-in">
              <div className="flex items-center gap-3 mb-6 text-blue-600">
                <FiFileText className="w-6 h-6" />
                <h3 className="text-xl font-bold text-slate-800">
                  Trích xuất thông tin trong tờ hướng dẫn (OCR)
                </h3>
              </div>

              <div className="bg-blue-50/50 border-2 border-dashed border-blue-200 rounded-2xl p-6 text-center mb-8">
                <input
                  type="file"
                  accept="image/*"
                  onChange={handleDocumentChange}
                  className="hidden"
                  id="upload-document"
                />
                <label
                  htmlFor="upload-document"
                  className="cursor-pointer flex flex-col items-center justify-center gap-3"
                >
                  {documentPreview || existingDocumentUrl ? (
                    <img
                      src={documentPreview || existingDocumentUrl}
                      alt="preview"
                      className="max-h-48 rounded-lg shadow-md border border-slate-200"
                    />
                  ) : (
                    <div className="w-16 h-16 bg-slate-100 text-slate-400 rounded-full flex items-center justify-center">
                      <FiUploadCloud className="w-8 h-8" />
                    </div>
                  )}
                  <span className="text-slate-600 font-medium">
                    {documentPreview || existingDocumentUrl
                      ? "Nhấn để chọn ảnh khác"
                      : "upload ảnh tờ hướng dẫn sử dụng"}
                  </span>
                </label>

                <button
                  onClick={handleOCR}
                  disabled={ocrLoading || !documentFile}
                  className={`mt-4 flex items-center gap-2 mx-auto px-6 py-2.5 font-bold transition-all ${
                    ocrLoading || !documentFile ? "btn-cancel" : "btn-gradient"
                  }`}
                >
                  {ocrLoading ? (
                    <span className="flex items-center gap-2">
                      <span className="animate-spin w-4 h-4 border-2 border-gray-600 border-t-transparent rounded-full"></span>
                      Đang phân tích... đợi chút ...
                    </span>
                  ) : (
                    <>
                      <FiSearch /> Quét dữ liệu OCR
                    </>
                  )}
                </button>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                <div>
                  <label className={labelClass}>Dạng bào chế</label>
                  <input
                    name="dosageForm"
                    value={ocrForm.dosageForm}
                    onChange={handleOcrChange}
                    className={inputClass}
                  />
                </div>
                <div>
                  <label className={labelClass}>Quy cách đóng gói</label>
                  <input
                    name="packaging"
                    value={ocrForm.packaging}
                    onChange={handleOcrChange}
                    className={inputClass}
                  />
                </div>
                <div>
                  <label className={labelClass}>Cách Bảo quản</label>
                  <input
                    name="storageCondition"
                    value={ocrForm.storageCondition}
                    onChange={handleOcrChange}
                    className={inputClass}
                  />
                </div>
                {[
                  { name: "uses", label: "Công dụng" },
                  { name: "contraindications", label: "Chống chỉ định" },
                  { name: "sideEffects", label: "Tác dụng phụ" },
                  {
                    name: "dosageAdministration",
                    label: "Liều dùng & Cách dùng",
                  },
                  { name: "warning", label: "Cảnh báo - Thận trọng" },
                ].map(({ name, label }) => (
                  <div key={name} className="md:col-span-2">
                    <label className={labelClass}>{label}</label>
                    <textarea
                      name={name}
                      rows="3"
                      value={ocrForm[name]}
                      onChange={handleOcrChange}
                      className={inputClass}
                    />
                  </div>
                ))}
              </div>

              <div className="flex flex-col sm:flex-row justify-between gap-4 pt-6 border-t border-slate-100">
                <button
                  onClick={() => setStep(1)}
                  className="flex justify-center items-center gap-2 px-8 py-3 font-bold btn-cancel"
                >
                  <FiArrowLeft /> Quay lại trang trước
                </button>
                <button
                  onClick={handleSubmit}
                  disabled={loading}
                  className="flex justify-center items-center gap-2 px-8 py-3 font-bold btn-gradient"
                >
                  {loading ? (
                    <span className="flex items-center gap-2">
                      <span className="animate-spin w-4 h-4 border-2 border-white border-t-transparent rounded-full"></span>
                      Đang lưu...
                    </span>
                  ) : (
                    <>
                      <FiCheckCircle /> Xác nhận cập nhật
                    </>
                  )}
                </button>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};
export default UpdateMedicine;