import { useState, useEffect } from "react";
import axiosClient from "../../api/axiosClient";
import { FiArrowRight, FiArrowLeft, FiSearch, FiCheckCircle, FiUploadCloud, FiBox, FiFileText } from "react-icons/fi";

const INITIAL_BASIC = {
  medicineCode: "",
  brandName: "",
  origin: "",
  status: "đang cung cấp",
  price: "",
  registrationNumber: "",
  unit: "Viên",
};

const INITIAL_OCR = {
  dosageForm: "",
  packaging: "",
  uses: "",
  indications: "",
  contraindications: "",
  sideEffects: "",
  dosage: "",
  administration: "",
  storageCondition: "",
  warning: "",
};

const inputClass = "w-full py-3 px-4 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 text-sm focus:outline-none focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-500/20 transition-all";
const labelClass = "block text-sm font-bold text-slate-700 mb-2";

const AddMedicine = () => {
  const [step, setStep] = useState(1);
  const [basicForm, setBasicForm] = useState(INITIAL_BASIC);
  const [ocrForm, setOcrForm] = useState(INITIAL_OCR);

  // Tách riêng 2 ảnh
  const [medicineImageFile, setMedicineImageFile] = useState(null); // ảnh hiển thị thuốc
  const [medicinePreview, setMedicinePreview] = useState(null);
  const [documentFile, setDocumentFile] = useState(null); // ảnh tờ hướng dẫn OCR
  const [documentPreview, setDocumentPreview] = useState(null);

  const [loading, setLoading] = useState(false);
  const [ocrLoading, setOcrLoading] = useState(false);
  const [medicineGroups, setMedicineGroups] = useState([]);
  const [groupIds, setGroupIds] = useState([]);
  const [activeIngredients, setActiveIngredients] = useState([]);
  const [selectedIngredients, setSelectedIngredients] = useState({});
  const [documentPath, setDocumentPath] = useState(null);

  useEffect(() => {
    const fetchGroups = async () => {
      try {
        const res = await axiosClient.get("/medicine-groups");
        setMedicineGroups(res.data?.data || res.data || []);
      } catch (error) {
        console.error(
          "Lấy nhóm thuốc lỗi:",
          error.response?.data || error.message,
        );
      }
    };
    const fetchIngredients = async () => {
      try {
        const res = await axiosClient.get("/active-ingredients");
        setActiveIngredients(res.data?.data || res.data || []);
      } catch (error) {
        console.error(
          "Lấy hoạt chất lỗi:",
          error.response?.data || error.message,
        );
      }
    };
    fetchGroups();
    fetchIngredients();
  }, []);

  const toggleGroup = (groupId) => {
    setGroupIds((prev) =>
      prev.includes(groupId)
        ? prev.filter((id) => id !== groupId)
        : [...prev, groupId],
    );
  };

  const toggleIngredient = (ingredientId) => {
    setSelectedIngredients((prev) => {
      const next = { ...prev };
      if (ingredientId in next) delete next[ingredientId];
      else next[ingredientId] = "";
      return next;
    });
  };

  const handleStrengthChange = (ingredientId, value) => {
    setSelectedIngredients((prev) => ({ ...prev, [ingredientId]: value }));
  };

  const handleBasicChange = (e) => {
    setBasicForm((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleOcrChange = (e) => {
    setOcrForm((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  // Ảnh hiển thị thuốc
  const handleMedicineImageChange = (e) => {
    const file = e.target.files[0];
    if (!file) return;
    setMedicineImageFile(file);
    setMedicinePreview(URL.createObjectURL(file));
  };

  // Ảnh tờ hướng dẫn để OCR
  const handleDocumentChange = (e) => {
    const file = e.target.files[0];
    if (!file) return;
    setDocumentFile(file);
    setDocumentPreview(URL.createObjectURL(file));
  };

  // Gọi OCR riêng để xem trước kết quả, người dùng có thể sửa trước khi lưu
  const handleOCR = async () => {
    if (!documentFile) return alert("Vui lòng chọn ảnh tờ hướng dẫn!");
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
        indications: res.data.indications || "",
        contraindications: res.data.contraindications || "",
        sideEffects: res.data.side_effects || "",
        dosage: res.data.dosage || "",
        administration: res.data.administration || "",
        storageCondition: res.data.storage_condition || "",
        warning: res.data.warning || "",
      });
    } catch (error) {
      console.error("OCR lỗi:", error.response?.data || error.message);
      alert("OCR thất bại, vui lòng thử lại!");
    } finally {
      setOcrLoading(false);
    }
  };

  // Submit: gửi FormData vì có file
  const handleSubmit = async () => {
    if (groupIds.length === 0)
      return alert("Vui lòng chọn ít nhất 1 nhóm thuốc!");

    const ingredientIds = Object.keys(selectedIngredients);
    if (ingredientIds.length === 0)
      return alert("Vui lòng chọn ít nhất 1 hoạt chất!");
    if (ingredientIds.some((id) => !selectedIngredients[id].trim())) {
      return alert("Vui lòng nhập hàm lượng cho tất cả hoạt chất đã chọn!");
    }

    const ingredients = ingredientIds.map((id) => ({
      ingredientId: Number(id),
      strength: selectedIngredients[id].trim(),
    }));

    setLoading(true);
    try {
      const formData = new FormData();

      // Thông tin cơ bản
      Object.entries({ ...basicForm, price: Number(basicForm.price) }).forEach(
        ([key, value]) => formData.append(key, value),
      );

      // groupIds và ingredients phải stringify vì FormData không hỗ trợ array/object
      formData.append("groupIds", JSON.stringify(groupIds));
      formData.append("ingredients", JSON.stringify(ingredients));

      // usageData người dùng đã xem/sửa sau OCR
      formData.append("usageData", JSON.stringify(ocrForm));

      // Ảnh hiển thị thuốc
      if (medicineImageFile) {
        formData.append("medicine", medicineImageFile);
      }

      // Ảnh tờ hướng dẫn
      if (documentPath) {
        formData.append("documentPath", documentPath);
      }

      await axiosClient.post("/medicines", formData, {
        headers: { "Content-Type": "multipart/form-data" },
      });

      alert("Thêm thuốc thành công!");
      setStep(1);
      setBasicForm(INITIAL_BASIC);
      setOcrForm(INITIAL_OCR);
      setGroupIds([]);
      setSelectedIngredients({});
      setMedicineImageFile(null);
      setMedicinePreview(null);
      setDocumentFile(null);
      setDocumentPreview(null);
    } catch (error) {
      console.error("Lưu thuốc lỗi:", error.response?.data);
      alert(
        error.response?.data?.message ||
          error.response?.data?.error ||
          "Lưu thất bại!",
      );
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-50 py-12 px-4 font-sans">
      <div className="max-w-4xl mx-auto bg-white rounded-3xl shadow-xl overflow-hidden border border-white/50">
        {/* Header & Stepper */}
        <div className="bg-slate-900 text-white p-8">
          <h2 className="text-3xl font-extrabold mb-6 tracking-tight">
            Thêm Thuốc Mới
          </h2>
          <div className="flex items-center gap-4 text-sm font-medium">
            <div
              className={`flex items-center gap-2 ${step === 1 ? "text-blue-400" : "text-emerald-400"}`}
            >
              <div className="w-8 h-8 rounded-full border-2 flex items-center justify-center border-current">
                1
              </div>
              <span>Thông tin cơ bản</span>
            </div>
            <div className="w-12 h-px bg-slate-700"></div>
            <div
              className={`flex items-center gap-2 ${step === 2 ? "text-blue-400" : "text-slate-500"}`}
            >
              <div className="w-8 h-8 rounded-full border-2 flex items-center justify-center border-current">
                2
              </div>
              <span>Quét OCR & Chi tiết</span>
            </div>
          </div>
        </div>

        <div className="p-8 md:p-10">
          {/* BƯỚC 1 */}
          {step === 1 && (
            <div className="animate-fade-in">
              <div className="flex items-center gap-3 mb-6 text-blue-600">
                <FiBox className="w-6 h-6" />
                <h3 className="text-xl font-bold text-slate-800">
                  Thông tin cơ sở
                </h3>
              </div>

              {/* Upload ảnh thuốc */}
              <div className="mb-6">
                <label className={labelClass}>Ảnh thuốc</label>
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
                    {medicinePreview ? (
                      <img
                        src={medicinePreview}
                        alt="preview"
                        className="max-h-36 rounded-lg shadow border border-slate-200"
                      />
                    ) : (
                      <div className="w-12 h-12 bg-slate-100 text-slate-400 rounded-full flex items-center justify-center">
                        <FiUploadCloud className="w-6 h-6" />
                      </div>
                    )}
                    <span className="text-sm text-slate-500 font-medium">
                      {medicinePreview
                        ? "Nhấn để chọn ảnh khác"
                        : "Tải lên ảnh hiển thị thuốc"}
                    </span>
                  </label>
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                <div>
                  <label className={labelClass}>Mã thuốc</label>
                  <input
                    name="medicineCode"
                    value={basicForm.medicineCode}
                    onChange={handleBasicChange}
                    placeholder="VD: THUOC001"
                    className={inputClass}
                  />
                </div>
                <div>
                  <label className={labelClass}>Tên thuốc</label>
                  <input
                    name="brandName"
                    value={basicForm.brandName}
                    onChange={handleBasicChange}
                    placeholder="VD: Paracetamol 500mg"
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
                  <label className={labelClass}>Trạng thái</label>
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
                    type="number"
                    value={basicForm.price}
                    onChange={handleBasicChange}
                    placeholder="VD: 50000"
                    className={inputClass}
                  />
                </div>
                <div>
                  <label className={labelClass}>Số đăng ký</label>
                  <input
                    name="registrationNumber"
                    value={basicForm.registrationNumber}
                    onChange={handleBasicChange}
                    placeholder="VD: VD-12345-19"
                    className={inputClass}
                  />
                </div>
                <div>
                  <label className={labelClass}>Đơn vị tính</label>
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

              {/* Nhóm thuốc */}
              <div className="mb-8">
                <label className={labelClass}>Nhóm thuốc</label>
                {medicineGroups.length === 0 ? (
                  <p className="text-sm text-slate-400 italic">
                    Chưa có nhóm thuốc nào.
                  </p>
                ) : (
                  <div className="flex flex-wrap gap-3 p-4 bg-slate-50 border border-slate-200 rounded-xl">
                    {medicineGroups.map((group) => {
                      const checked = groupIds.includes(group.groupId);
                      return (
                        <label
                          key={group.groupId}
                          className={`flex items-center gap-2 px-4 py-2 rounded-full text-sm font-medium cursor-pointer border transition-all ${
                            checked
                              ? "bg-blue-600 text-white border-blue-600"
                              : "bg-white text-slate-600 border-slate-200 hover:border-blue-300"
                          }`}
                        >
                          <input
                            type="checkbox"
                            checked={checked}
                            onChange={() => toggleGroup(group.groupId)}
                            className="hidden"
                          />
                          {group.groupName}
                        </label>
                      );
                    })}
                  </div>
                )}
              </div>

              {/* Hoạt chất */}
              <div className="mb-8">
                <label className={labelClass}>Hoạt chất & Hàm lượng</label>
                {activeIngredients.length === 0 ? (
                  <p className="text-sm text-slate-400 italic">
                    Chưa có hoạt chất nào.
                  </p>
                ) : (
                  <div className="space-y-2">
                    {activeIngredients.map((ingredient) => {
                      const isSelected =
                        ingredient.ingredientId in selectedIngredients;
                      return (
                        <div
                          key={ingredient.ingredientId}
                          className={`flex items-center gap-3 p-3 rounded-xl border transition-all ${
                            isSelected
                              ? "bg-blue-50 border-blue-300"
                              : "bg-slate-50 border-slate-200"
                          }`}
                        >
                          <label className="flex items-center gap-2 flex-1 cursor-pointer">
                            <input
                              type="checkbox"
                              checked={isSelected}
                              onChange={() =>
                                toggleIngredient(ingredient.ingredientId)
                              }
                              className="w-4 h-4 accent-blue-600"
                            />
                            <span className="text-sm font-medium text-slate-700">
                              {ingredient.ingredientName}
                            </span>
                          </label>
                          {isSelected && (
                            <input
                              type="text"
                              placeholder="VD: 500mg"
                              value={
                                selectedIngredients[ingredient.ingredientId]
                              }
                              onChange={(e) =>
                                handleStrengthChange(
                                  ingredient.ingredientId,
                                  e.target.value,
                                )
                              }
                              className="w-36 py-2 px-3 bg-white border border-slate-200 rounded-lg text-sm focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-500/20"
                            />
                          )}
                        </div>
                      );
                    })}
                  </div>
                )}
              </div>

              <div className="flex justify-end pt-6 border-t border-slate-100">
                <button
                  onClick={() => setStep(2)}
                  className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-xl font-bold transition-all shadow-lg shadow-blue-600/20 hover:-translate-y-0.5"
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
                  Trích xuất tờ hướng dẫn (OCR)
                </h3>
              </div>

              {/* Upload ảnh tờ hướng dẫn */}
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
                  {documentPreview ? (
                    <img
                      src={documentPreview}
                      alt="preview"
                      className="max-h-48 rounded-lg shadow-md border border-slate-200"
                    />
                  ) : (
                    <div className="w-16 h-16 bg-blue-100 text-blue-500 rounded-full flex items-center justify-center">
                      <FiUploadCloud className="w-8 h-8" />
                    </div>
                  )}
                  <span className="text-slate-600 font-medium">
                    {documentPreview
                      ? "Nhấn để chọn ảnh khác"
                      : "Tải lên ảnh chụp tờ hướng dẫn sử dụng"}
                  </span>
                </label>

                <button
                  onClick={handleOCR}
                  disabled={ocrLoading || !documentFile}
                  className={`mt-4 flex items-center gap-2 mx-auto px-6 py-2.5 rounded-full font-bold transition-all ${
                    ocrLoading || !documentFile
                      ? "bg-slate-200 text-slate-400 cursor-not-allowed"
                      : "bg-emerald-500 hover:bg-emerald-600 text-white shadow-lg shadow-emerald-500/30"
                  }`}
                >
                  {ocrLoading ? (
                    <span className="flex items-center gap-2">
                      <span className="animate-spin w-4 h-4 border-2 border-white border-t-transparent rounded-full"></span>
                      Đang phân tích...
                    </span>
                  ) : (
                    <>
                      <FiSearch /> Quét dữ liệu OCR
                    </>
                  )}
                </button>
              </div>

              {/* Form OCR */}
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
                  <label className={labelClass}>Bảo quản</label>
                  <input
                    name="storageCondition"
                    value={ocrForm.storageCondition}
                    onChange={handleOcrChange}
                    className={inputClass}
                  />
                </div>
                {[
                  { name: "uses", label: "Công dụng" },
                  { name: "indications", label: "Chỉ định" },
                  { name: "contraindications", label: "Chống chỉ định" },
                  { name: "sideEffects", label: "Tác dụng phụ" },
                  { name: "dosage", label: "Liều dùng" },
                  { name: "administration", label: "Cách dùng" },
                  { name: "warning", label: "Cảnh báo" },
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
                  className="flex justify-center items-center gap-2 bg-slate-100 hover:bg-slate-200 text-slate-700 px-8 py-3 rounded-xl font-bold transition-all"
                >
                  <FiArrowLeft /> Quay lại
                </button>
                <button
                  onClick={handleSubmit}
                  disabled={loading}
                  className={`flex justify-center items-center gap-2 px-8 py-3 rounded-xl font-bold transition-all ${
                    loading
                      ? "bg-blue-400 text-white cursor-not-allowed"
                      : "bg-blue-600 hover:bg-blue-700 text-white shadow-lg shadow-blue-600/20 hover:-translate-y-0.5"
                  }`}
                >
                  {loading ? (
                    "Đang lưu trữ..."
                  ) : (
                    <>
                      <FiCheckCircle /> Xác nhận lưu thuốc
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

export default AddMedicine;
