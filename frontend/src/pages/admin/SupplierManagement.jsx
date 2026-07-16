import { useState, useEffect, useMemo, useRef } from "react";
import { Topbar } from "../../components/admin/topbar";
import { alertSuccess, alertError, alertWarning, alertConfirm } from "../../utils/SwalAlert";
import axiosClient from "../../api/axiosClient";
import { FaEnvelope, FaPhone, FaLocationDot, FaXmark, FaTruckField } from "react-icons/fa6";

function Field({
  label,
  name,
  value,
  onChange,
  type = "text",
  placeholder = "",
}) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">
        {label}
      </label>
      <input
        type={type}
        name={name}
        value={value}
        onChange={onChange}
        placeholder={placeholder}
        className="form-base"
      />
    </div>
  );
}

function Modal({ title, onClose, children }) {
  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm px-4"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-xl w-full max-w-lg flex flex-col max-h-[90vh]"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between shrink-0">
          <div className="w-5"></div>{" "}
          <h3 className="text-xl font-bold text-slate-800 text-center">
            {title}
          </h3>
          <button
            onClick={onClose}
            className="p-1 text-gray-400 hover:text-gray-600 transition"
          >
            <FaXmark className="h-5 w-5" />
          </button>
        </div>
        <div className="flex flex-col overflow-y-auto">{children}</div>
      </div>
    </div>
  );
}

const EMPTY_FORM = { supplierName: "", address: "", phoneNumber: "", email: "" };

export default function SupplierManagement() {
  const [suppliers, setSuppliers] = useState([]);

  const [initialLoading, setInitialLoading] = useState(true);
  const [searching, setSearching]           = useState(false);
  const [keyword, setKeyword]               = useState("");
  const debounceRef = useRef(null);
  const hasLoadedOnce = useRef(false);

  const [selectedId, setSelectedId] = useState(null);
  const selectedSupplier = useMemo(
    () => suppliers.find((s) => s.supplierId === selectedId) || null,
    [suppliers, selectedId]
  );

  const [showCreate, setShowCreate]     = useState(false);
  const [createForm, setCreateForm]     = useState(EMPTY_FORM);
  const [savingCreate, setSavingCreate] = useState(false);

  const [showEdit, setShowEdit]     = useState(false);
  const [editTarget, setEditTarget] = useState(null); 
  const [editForm, setEditForm]     = useState(EMPTY_FORM);
  const [savingEdit, setSavingEdit] = useState(false);

  const fetchSuppliers = async (search = "") => {
    try {
      if (!hasLoadedOnce.current) {
        setInitialLoading(true);
      } else {
        setSearching(true);
      }
      const res = await axiosClient.get("/suppliers", {
        params: search ? { search } : undefined,
      });
      setSuppliers(res.data.data);
    } catch {
      alertError("Không thể tải danh sách nhà cung cấp");
    } finally {
      hasLoadedOnce.current = true;
      setInitialLoading(false);
      setSearching(false);
    }
  };

  useEffect(() => { fetchSuppliers(); }, []);

  useEffect(() => () => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
  }, []);

  const handleSearch = (value) => {
    setKeyword(value);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      fetchSuppliers(value.trim());
    }, 400);
  };

  const toggleSelect = (supplier) => {
    setSelectedId((prev) => (prev === supplier.supplierId ? null : supplier.supplierId));
  };

  const openCreate = () => {
    setCreateForm(EMPTY_FORM);
    setShowCreate(true);
  };

  const openEditSelected = () => {
    const supplier = selectedSupplier;
    if (!supplier) return;
    setEditTarget(supplier);
    setEditForm({
      supplierName: supplier.supplierName || "",
      address:      supplier.address      || "",
      phoneNumber:  supplier.phoneNumber  || "",
      email:        supplier.email        || "",
    });
    setShowEdit(true);
  };

  const handleSubmitCreate = async (e) => {
    e.preventDefault();
    const { supplierName, address, phoneNumber, email } = createForm;
    if (!supplierName || !address || !phoneNumber || !email) {
      return alertWarning("Vui lòng nhập đầy đủ các trường bắt buộc (*)");
    }
    setSavingCreate(true);
    try {
      await axiosClient.post("/suppliers", { supplierName, address, phoneNumber, email });
      alertSuccess("Đã thêm nhà cung cấp mới thành công");
      setShowCreate(false);
      fetchSuppliers(keyword.trim());
    } catch (err) {
      alertError(err || "Thất bại .Không thể thêm nhà cung cấp -.-");
    } finally {
      setSavingCreate(false);
    }
  };

  const handleSubmitEdit = async (e) => {
    e.preventDefault();
    const { supplierName, address, phoneNumber, email } = editForm;
    if (!supplierName || !address || !phoneNumber || !email) {
      return alertWarning("Vui lòng nhập đầy đủ các trường bắt buộc (*)");
    }
    setSavingEdit(true);
    try {
      await axiosClient.put(`/suppliers/${editTarget.supplierId}`, editForm);
      alertSuccess("Thông tin nhà cung cấp đã được cập nhật thành công");
      setShowEdit(false);
      fetchSuppliers(keyword.trim());
    } catch (err) {
      alertError(err || "Thất bại .Không thể cập nhật");
    } finally {
      setSavingEdit(false);
    }
  };

  const handleDeleteSelected = async () => {
    const supplier = selectedSupplier;
    if (!supplier) return;
    const result = await alertConfirm(
      `Nhà cung cấp [${supplier.supplierName}] sẽ bị xóa vĩnh viễn!`,
      "Bạn có chắc chắn?",
      "btn-swal-danger",
    );
    if (result.isConfirmed) {
      try {
        await axiosClient.delete(`/suppliers/${supplier.supplierId}`);
        alertSuccess("Nhà cung cấp đã được xóa thành công");
        setSelectedId(null);
        fetchSuppliers(keyword.trim());
      } catch (err) {
        alertError( err || "Không thể xóa nhà cung cấp này");
      }
    }
  };

  if (initialLoading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600" />
        <span className="ml-2 text-teal-600 font-medium">Đang tải dữ liệu...</span>
      </div>
    );
  }

  return (
    <>
      <Topbar
        title="Quản lý nhà cung cấp"
        subtitle="Danh sách nhà cung cấp"
        hasSelection={!!selectedSupplier}
        onSearch={handleSearch}
        searchValue={keyword}
        searchPlaceholder="Tìm theo tên nhà cung cấp..."
        actions={{
          onCreate: openCreate,
          onEdit: openEditSelected,
          onDelete: handleDeleteSelected,
        }}
      />

      <div className="p-6 min-h-screen">
        <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-blue-600 border-b border-blue-800 text-white text-sm uppercase tracking-wider">
                  <th className="px-6 py-4 font-semibold">Nhà cung cấp</th>
                  <th className="px-6 py-4 font-semibold">Địa chỉ</th>
                  <th className="px-6 py-4 font-semibold">Liên hệ</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {suppliers.length === 0 ? (
                  <tr>
                    <td
                      colSpan="3"
                      className="px-6 py-12 text-center text-gray-400"
                    >
                      Không tìm thấy nhà cung cấp phù hợp!
                    </td>
                  </tr>
                ) : (
                  suppliers.map((s) => {
                    const isSelected = s.supplierId === selectedId;
                    return (
                      <tr
                        key={s.supplierId}
                        onClick={() => toggleSelect(s)}
                        className={`cursor-pointer transition-colors duration-200 select-none border-b border-gray-100
                          ${isSelected ? "bg-blue-100 ring-1 ring-inset ring-blue-50" : "hover:bg-gray-100"}`}
                      >
                        {/* Cột 1: Tên nhà cung cấp */}
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-3">
                            <div className="w-10 h-10 rounded-full bg-blue-50 border border-blue-100 flex items-center justify-center text-blue-600 shrink-0">
                              <FaTruckField />
                            </div>
                            <span className="font-medium text-black">
                              {s.supplierName}
                            </span>
                          </div>
                        </td>

                        {/* Cột 2: Địa chỉ */}
                        <td className="px-6 py-4 text-sm text-gray-600">
                          <div className="flex items-center gap-1.5">
                            <FaLocationDot className="text-gray-400 shrink-0" />
                            <span>{s.address}</span>
                          </div>
                        </td>

                        {/* Cột 3: Liên hệ */}
                        <td className="px-6 py-4 text-sm text-gray-600">
                          <div className="flex items-center gap-1.5 mb-1">
                            <FaEnvelope className="text-gray-400 shrink-0" />
                            <span>{s.email}</span>
                          </div>
                          <div className="flex items-center gap-1.5">
                            <FaPhone className="text-gray-400 shrink-0" />
                            <span>{s.phoneNumber}</span>
                          </div>
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>

          {suppliers.length > 0 && (
            <div className="px-6 py-3 border-t border-gray-100 text-sm text-gray-500 bg-gray-50 flex items-center gap-2">
              <span>
                Tổng:{" "}
                <span className="font-semibold text-gray-700">
                  {suppliers.length}
                </span>{" "}
                nhà cung cấp
              </span>
              {selectedSupplier && (
                <span className="text-blue-600">
                  Đang chọn:{" "}
                  <span className="font-semibold">
                    {selectedSupplier.supplierName}
                  </span>
                </span>
              )}
              {searching && (
                <span className="flex items-center gap-1.5 text-gray-400">
                  <span className="h-3 w-3 rounded-full border-2 border-gray-300 border-t-blue-500 animate-spin" />
                  Đang tìm kiếm...
                </span>
              )}
            </div>
          )}
        </div>
      </div>

      {/* ── Modal Thêm nhà cung cấp ── */}
      {showCreate && (
        <Modal
          title="THÊM NHÀ CUNG CẤP MỚI"
          onClose={() => setShowCreate(false)}
        >
          <form onSubmit={handleSubmitCreate} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <Field
                label="Tên nhà cung cấp (*)"
                name="supplierName"
                value={createForm.supplierName}
                placeholder="VD: Công ty TNHH Dược A"
                onChange={(e) =>
                  setCreateForm((p) => ({ ...p, supplierName: e.target.value }))
                }
              />
              <Field
                label="Địa chỉ (*)"
                name="address"
                value={createForm.address}
                placeholder="VD: khóm 5, phường 6, TP.Sóc Trăng"
                onChange={(e) =>
                  setCreateForm((p) => ({ ...p, address: e.target.value }))
                }
              />
              <div className="grid grid-cols-2 gap-4">
                <Field
                  label="Số điện thoại (*)"
                  name="phoneNumber"
                  value={createForm.phoneNumber}
                  placeholder="0908070605"
                  onChange={(e) =>
                    setCreateForm((p) => ({
                      ...p,
                      phoneNumber: e.target.value,
                    }))
                  }
                />
                <Field
                  label="Email (*)"
                  name="email"
                  type="email"
                  value={createForm.email}
                  placeholder="me@gmail.com"
                  onChange={(e) =>
                    setCreateForm((p) => ({ ...p, email: e.target.value }))
                  }
                />
              </div>
            </div>
            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50 flex justify-end gap-3">
              <button
                type="button"
                onClick={() => setShowCreate(false)}
                className="btn-cancel px-4 py-2 text-sm font-medium"
              >
                Hủy
              </button>
              <button
                type="submit"
                disabled={savingCreate}
                className="btn-gradient px-4 py-2 text-sm font-medium"
              >
                {savingCreate ? "Đang thêm..." : "Thêm nhà cung cấp"}
              </button>
            </div>
          </form>
        </Modal>
      )}

      {/* ── Modal Sửa nhà cung cấp ── */}
      {showEdit && editTarget && (
        <Modal title="CẬP NHẬT NHÀ CUNG CẤP" onClose={() => setShowEdit(false)}>
          <form onSubmit={handleSubmitEdit} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <Field
                label="Tên nhà cung cấp (*)"
                name="supplierName"
                value={editForm.supplierName}
                onChange={(e) =>
                  setEditForm((p) => ({ ...p, supplierName: e.target.value }))
                }
              />
              <Field
                label="Địa chỉ (*)"
                name="address"
                value={editForm.address}
                onChange={(e) =>
                  setEditForm((p) => ({ ...p, address: e.target.value }))
                }
              />
              <div className="grid grid-cols-2 gap-4">
                <Field
                  label="Số điện thoại (*)"
                  name="phoneNumber"
                  value={editForm.phoneNumber}
                  onChange={(e) =>
                    setEditForm((p) => ({ ...p, phoneNumber: e.target.value }))
                  }
                />
                <Field
                  label="Email (*)"
                  name="email"
                  type="email"
                  value={editForm.email}
                  onChange={(e) =>
                    setEditForm((p) => ({ ...p, email: e.target.value }))
                  }
                />
              </div>
            </div>
            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50 flex justify-end gap-3">
              <button
                type="button"
                onClick={() => setShowEdit(false)}
                className="btn-cancel px-4 py-2 text-sm font-medium"
              >
                Hủy
              </button>
              <button
                type="submit"
                disabled={savingEdit}
                className="btn-gradient px-4 py-2 text-sm font-medium"
              >
                {savingEdit ? "Đang lưu..." : "Lưu thay đổi"}
              </button>
            </div>
          </form>
        </Modal>
      )}
    </>
  );
}