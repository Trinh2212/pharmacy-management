import { useState, useEffect, useMemo, useRef } from "react";
import { Topbar } from "../../components/admin/topbar";
import axiosClient from "../../api/axiosClient";
import Swal from "sweetalert2";
import {
  FaEnvelope, FaPhone, FaVenusMars, FaCakeCandles, FaLocationDot,
  FaCalendarDays, FaCircleInfo, FaShieldHalved, FaUser, FaXmark,
  FaBan, FaCircleCheck, FaLock, FaLockOpen,
} from "react-icons/fa6";

const DEFAULT_AVATAR = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

// ── Shared sub-components ─────────────────────────────────────────────────────
function Field({ label, name, value, onChange, type = "text", placeholder = "" }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">{label}</label>
      <input
        type={type}
        name={name}
        value={value}
        onChange={onChange}
        placeholder={placeholder}
        className="w-full px-3 py-2 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-teal-500"
      />
    </div>
  );
}

function SelectField({ label, name, value, onChange, options }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">{label}</label>
      <select
        name={name}
        value={value}
        onChange={onChange}
        className="w-full px-3 py-2 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white"
      >
        {options.map((o) => <option key={o.value} value={o.value}>{o.label}</option>)}
      </select>
    </div>
  );
}

function Modal({ title, onClose, children }) {
  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm px-4 py-6"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-xl w-full max-w-lg flex flex-col"
        style={{ maxHeight: "calc(100vh - 48px)" }}
        onClick={(e) => e.stopPropagation()}
      >
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between shrink-0">
          <h3 className="text-xl font-bold text-teal-700">{title}</h3>
          <button onClick={onClose} className="p-1 text-gray-400 hover:text-gray-600 transition">
            <FaXmark className="h-5 w-5" />
          </button>
        </div>
        <div className="flex flex-col overflow-y-auto">
          {children}
        </div>
      </div>
    </div>
  );
}

const GENDER_OPTIONS = [
  { value: "nam",  label: "Nam" },
  { value: "nữ",   label: "Nữ" },
  { value: "khác", label: "Khác" },
];
const ROLE_OPTIONS = [
  { value: "employee", label: "Nhân viên" },
  { value: "admin",    label: "Quản trị viên" },
];

const EMPTY_CREATE = { fullName: "", phoneNumber: "", email: "", password: "", role: "employee" };
const EMPTY_EDIT   = { fullName: "", phoneNumber: "", email: "", password: "", gender: "nam", dob: "", address: "", hireDate: "", role: "employee" };

// ── Main component ────────────────────────────────────────────────────────────
export default function EmployeeManagement() {
  const [employees, setEmployees] = useState([]);
  // initialLoading: chỉ true ở lần tải đầu tiên — quyết định có hiện spinner toàn trang hay không.
  // searching: true khi đang gọi lại API do gõ search — KHÔNG che toàn trang, để input không bị mất focus/giá trị.
  const [initialLoading, setInitialLoading] = useState(true);
  const [searching, setSearching]           = useState(false);
  const [keyword, setKeyword]               = useState("");
  const debounceRef = useRef(null);
  const hasLoadedOnce = useRef(false);

  // Dòng đang được chọn (radio-style: chỉ 1 dòng tại 1 thời điểm)
  const [selectedId, setSelectedId] = useState(null);
  const selectedEmployee = useMemo(
    () => employees.find((e) => e.employeeId === selectedId) || null,
    [employees, selectedId]
  );

  const [detailEmployee, setDetailEmployee] = useState(null);

  // Modal create
  const [showCreate, setShowCreate] = useState(false);
  const [createForm, setCreateForm] = useState(EMPTY_CREATE);
  const [savingCreate, setSavingCreate] = useState(false);

  // Modal edit
  const [showEdit, setShowEdit]     = useState(false);
  const [editTarget, setEditTarget] = useState(null);
  const [editForm, setEditForm]     = useState(EMPTY_EDIT);
  const [savingEdit, setSavingEdit] = useState(false);

  // search: gửi thẳng cho backend qua query param, FE không tự lọc dữ liệu
  const fetchEmployees = async (search = "") => {
    try {
      if (!hasLoadedOnce.current) {
        setInitialLoading(true);
      } else {
        setSearching(true);
      }
      const res = await axiosClient.get("/admin/employees", {
        params: search ? { search } : undefined,
      });
      setEmployees(res.data.data);
    } catch {
      Swal.fire("Lỗi", "Không thể tải danh sách nhân viên", "error");
    } finally {
      hasLoadedOnce.current = true;
      setInitialLoading(false);
      setSearching(false);
    }
  };

  useEffect(() => { fetchEmployees(); }, []);

  // Dọn debounce timer khi unmount
  useEffect(() => () => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
  }, []);

  // Gõ tìm kiếm -> debounce 400ms rồi gọi lại API với keyword, không lọc ở FE.
  // setKeyword chạy ngay lập tức để ô input hiển thị đúng ký tự vừa gõ (controlled input),
  // chỉ việc GỌI API là được debounce.
  const handleSearch = (value) => {
    setKeyword(value);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      fetchEmployees(value.trim());
    }, 400);
  };

  // Click vào 1 dòng để chọn / bấm lại để bỏ chọn
  const toggleSelect = (employee) => {
    setSelectedId((prev) => (prev === employee.employeeId ? null : employee.employeeId));
  };

  // ── Open modals ─────────────────────────────────────────────────────────────
  const openCreate = () => {
    setCreateForm(EMPTY_CREATE);
    setShowCreate(true);
  };

  const openEditSelected = () => {
    const employee = selectedEmployee;
    if (!employee) return;
    setEditTarget(employee);
    setEditForm({
      fullName:    employee.fullName    || "",
      phoneNumber: employee.phoneNumber || "",
      email:       employee.email       || "",
      password:    "",
      gender:      employee.gender      || "nam",
      dob:         employee.dob         ? employee.dob.split("T")[0]      : "",
      address:     employee.address     || "",
      hireDate:    employee.hireDate    ? employee.hireDate.split("T")[0] : "",
      role:        employee.role        || "employee",
    });
    setShowEdit(true);
  };

  const openViewSelected = () => {
    if (!selectedEmployee) return;
    setDetailEmployee(selectedEmployee);
  };

  // ── Đổi vai trò (hành động riêng theo dòng, không qua Topbar) ───────────────
  const handleChangeRole = async (employee, newRole) => {
    const confirmed = await Swal.fire({
      title: "Xác nhận thay đổi vai trò?",
      text: `Chuyển ${employee.fullName} sang: ${newRole === "admin" ? "Quản trị viên" : "Nhân viên"}`,
      icon: "question",
      showCancelButton: true,
      confirmButtonColor: "#0d9488",
      confirmButtonText: "Xác nhận",
      cancelButtonText: "Hủy",
    });
    if (!confirmed.isConfirmed) { fetchEmployees(keyword.trim()); return; }
    try {
      await axiosClient.put(`/admin/employees/${employee.employeeId}`, { role: newRole });
      Swal.fire({ toast: true, position: "top-end", showConfirmButton: false, timer: 2000, icon: "success", title: `Đã cập nhật vai trò: ${newRole === "admin" ? "Admin" : "Nhân viên"}` });
      fetchEmployees(keyword.trim());
    } catch (err) {
      Swal.fire("Lỗi", err.response?.data?.message || "Cập nhật vai trò thất bại", "error");
      fetchEmployees(keyword.trim());
    }
  };

  // ── Khóa / Mở khóa (hành động riêng theo dòng, không qua Topbar) ────────────
  const handleToggleLock = async (employee) => {
    if (employee.role === "admin")
      return Swal.fire("Không được phép", "Không thể khóa tài khoản Admin!", "error");
    const action = employee.isLocked ? "Mở khóa" : "Khóa";
    const result = await Swal.fire({
      title: `Xác nhận ${action}?`,
      text: `Bạn có chắc muốn ${action.toLowerCase()} tài khoản của ${employee.fullName}?`,
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: employee.isLocked ? "#0d9488" : "#ef4444",
      confirmButtonText: "Xác nhận",
      cancelButtonText: "Hủy",
    });
    if (result.isConfirmed) {
      try {
        await axiosClient.patch(`/admin/employees/lock/${employee.employeeId}`);
        Swal.fire({ icon: "success", title: "Thành công", text: `Đã ${action.toLowerCase()} tài khoản!`, timer: 1800, showConfirmButton: false });
        fetchEmployees(keyword.trim());
      } catch (err) {
        Swal.fire("Lỗi", err.response?.data?.message || "Thao tác thất bại", "error");
      }
    }
  };

  // ── Submit create ───────────────────────────────────────────────────────────
  const handleSubmitCreate = async (e) => {
    e.preventDefault();
    const { fullName, phoneNumber, email, password, role } = createForm;
    if (!fullName || !phoneNumber || !email || !password) {
      return Swal.fire("Cảnh báo", "Vui lòng nhập đầy đủ các trường bắt buộc (*)", "warning");
    }
    if (password.length < 8) {
      return Swal.fire("Cảnh báo", "Mật khẩu phải có ít nhất 8 ký tự", "warning");
    }
    setSavingCreate(true);
    try {
      await axiosClient.post("/admin/employees", { fullName, phoneNumber, email, password, role });
      Swal.fire({ icon: "success", title: "Thành công", text: "Đã tạo tài khoản nhân viên mới!", timer: 1800, showConfirmButton: false });
      setShowCreate(false);
      fetchEmployees(keyword.trim());
    } catch (err) {
      Swal.fire("Lỗi", err.response?.data?.message || "Không thể tạo tài khoản", "error");
    } finally {
      setSavingCreate(false);
    }
  };

  // ── Submit edit ─────────────────────────────────────────────────────────────
  const handleSubmitEdit = async (e) => {
    e.preventDefault();
    const { fullName, phoneNumber, email, password } = editForm;
    if (!fullName || !phoneNumber || !email) {
      return Swal.fire("Cảnh báo", "Vui lòng nhập đầy đủ các trường bắt buộc (*)", "warning");
    }
    if (password && password.length < 8) {
      return Swal.fire("Cảnh báo", "Mật khẩu phải có ít nhất 8 ký tự", "warning");
    }
    const data = { ...editForm };
    if (!data.password) delete data.password;
    if (!data.dob)      data.dob = null;
    if (!data.hireDate) data.hireDate = null;

    setSavingEdit(true);
    try {
      await axiosClient.put(`/admin/employees/${editTarget.employeeId}`, data);
      Swal.fire({ icon: "success", title: "Đã lưu", text: "Thông tin nhân viên đã được cập nhật!", timer: 1800, showConfirmButton: false });
      setShowEdit(false);
      fetchEmployees(keyword.trim());
    } catch (err) {
      Swal.fire("Lỗi", err.response?.data?.message || "Không thể cập nhật", "error");
    } finally {
      setSavingEdit(false);
    }
  };

  // ── Delete (chỉ dòng đang chọn) ─────────────────────────────────────────────
  const handleDeleteSelected = async () => {
    const employee = selectedEmployee;
    if (!employee) return;
    if (employee.role === "admin")
      return Swal.fire("Không được phép", "Không được phép xóa Admin!", "error");
    const result = await Swal.fire({
      title: "Bạn có chắc chắn?",
      html: `Tài khoản <b>${employee.fullName}</b> sẽ bị xóa vĩnh viễn!`,
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#ef4444",
      cancelButtonColor: "#6b7280",
      confirmButtonText: "Vâng, xóa đi!",
      cancelButtonText: "Hủy",
    });
    if (result.isConfirmed) {
      try {
        await axiosClient.delete(`/admin/employees/${employee.employeeId}`);
        Swal.fire({ icon: "success", title: "Đã xóa!", text: "Tài khoản nhân viên đã được xóa.", timer: 1800, showConfirmButton: false });
        setSelectedId(null);
        fetchEmployees(keyword.trim());
      } catch (err) {
        Swal.fire("Lỗi", err.response?.data?.message || "Không thể xóa nhân viên này", "error");
      }
    }
  };

  // ── Loading lần đầu ───────────────────────────────────────────────────────
  if (initialLoading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-teal-600" />
        <span className="ml-2 text-teal-600 font-medium">Đang tải dữ liệu...</span>
      </div>
    );
  }

  // ── Render ──────────────────────────────────────────────────────────────────
  return (
    <>
      <Topbar
        title="Quản lý nhân viên"
        subtitle="Danh sách tài khoản nhân viên"
        hasSelection={!!selectedEmployee}
        onSearch={handleSearch}
        searchValue={keyword}
        searchPlaceholder="Tìm theo tên, mã NV, email, SĐT…"
        actions={{
          onCreate: openCreate,
          onView:   openViewSelected,
          onEdit:   openEditSelected,
          onDelete: handleDeleteSelected,
        }}
      />

      <div className="p-6 bg-gray-50 min-h-screen">
        <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-100 text-gray-600 text-sm uppercase tracking-wider">
                  <th className="px-6 py-4 font-semibold">Mã NV</th>
                  <th className="px-6 py-4 font-semibold">Họ tên</th>
                  <th className="px-6 py-4 font-semibold">Liên hệ</th>
                  <th className="px-6 py-4 font-semibold">Vai trò</th>
                  <th className="px-6 py-4 font-semibold">Trạng thái</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {employees.length === 0 ? (
                  <tr>
                    <td colSpan="5" className="px-6 py-12 text-center text-gray-400">
                      Không tìm thấy nhân viên phù hợp!
                    </td>
                  </tr>
                ) : (
                  employees.map((u) => {
                    const isSelected = u.employeeId === selectedId;
                    return (
                      <tr
                        key={u.employeeId}
                        onClick={() => toggleSelect(u)}
                        className={`cursor-pointer transition select-none
                          ${isSelected ? "bg-teal-50 ring-1 ring-inset ring-teal-300" : "hover:bg-gray-50"}
                          ${u.isLocked ? "bg-red-50/30" : ""}`}
                      >
                        {/* Cột 1: Avatar + Mã NV */}
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-3">
                            <img
                              src={u.avatarUrl ? u.avatarUrl.startsWith("/uploads") ? `http://localhost:5000${u.avatarUrl}` : u.avatarUrl : DEFAULT_AVATAR}
                              alt="avatar"
                              className="w-10 h-10 rounded-full object-cover border border-gray-200 shrink-0"
                            />
                            <span className="text-xs text-teal-600 font-semibold bg-teal-50 px-2 py-0.5 rounded border border-teal-100">
                              {u.employeeCode}
                            </span>
                          </div>
                        </td>

                        {/* Cột 2: Họ tên */}
                        <td className="px-6 py-4 font-medium text-gray-900">{u.fullName}</td>

                        {/* Cột 3: Liên hệ */}
                        <td className="px-6 py-4 text-sm text-gray-600">
                          <div className="flex items-center gap-1.5 mb-1">
                            <FaEnvelope className="text-gray-400 shrink-0" />
                            <span>{u.email}</span>
                          </div>
                          <div className="flex items-center gap-1.5">
                            <FaPhone className="text-gray-400 shrink-0" />
                            <span>{u.phoneNumber}</span>
                          </div>
                        </td>

                        {/* Cột 4: Vai trò — dropdown đổi vai trò trực tiếp, hành động riêng theo dòng */}
                        <td className="px-6 py-4" onClick={(e) => e.stopPropagation()}>
                          <select
                            value={u.role}
                            onChange={(e) => handleChangeRole(u, e.target.value)}
                            disabled={u.role === "admin"}
                            className={`text-sm rounded-full px-3 py-1 border font-medium focus:outline-none appearance-none cursor-pointer pr-8 bg-no-repeat
                              disabled:opacity-70 disabled:cursor-not-allowed
                              ${u.role === "admin" ? "bg-purple-100 text-purple-700 border-purple-200" : "bg-blue-100 text-blue-700 border-blue-200"}`}
                            style={{
                              backgroundImage: `url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e")`,
                              backgroundPosition: "right 0.2rem center",
                              backgroundSize: "1.5em 1.5em",
                            }}
                          >
                            <option value="employee">Nhân viên</option>
                            <option value="admin">Admin</option>
                          </select>
                        </td>

                        {/* Cột 5: Trạng thái — nút khóa/mở khóa trực tiếp, hành động riêng theo dòng */}
                        <td className="px-6 py-4" onClick={(e) => e.stopPropagation()}>
                          <button
                            onClick={() => handleToggleLock(u)}
                            disabled={u.role === "admin"}
                            title={u.isLocked ? "Mở khóa tài khoản" : "Khóa tài khoản"}
                            className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium border transition
                              disabled:opacity-60 disabled:cursor-not-allowed
                              ${u.isLocked
                                ? "bg-red-50 text-red-600 border-red-200 hover:bg-red-100"
                                : "bg-green-50 text-green-600 border-green-200 hover:bg-green-100"}`}
                          >
                            {u.isLocked ? <FaLockOpen /> : <FaLock />}
                            {u.isLocked ? "Đang bị khóa" : "Đang hoạt động"}
                          </button>
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>

          {employees.length > 0 && (
            <div className="px-6 py-3 border-t border-gray-100 text-sm text-gray-500 bg-gray-50 flex items-center gap-2">
              <span>
                Tổng: <span className="font-semibold text-gray-700">{employees.length}</span> nhân viên
              </span>
              {selectedEmployee && (
                <span className="text-teal-600">
                  · Đang chọn: <span className="font-semibold">{selectedEmployee.fullName}</span>
                </span>
              )}
              {searching && (
                <span className="flex items-center gap-1.5 text-gray-400">
                  <span className="h-3 w-3 rounded-full border-2 border-gray-300 border-t-teal-500 animate-spin" />
                  Đang tìm kiếm...
                </span>
              )}
            </div>
          )}
        </div>
      </div>

      {/* ── Modal Thêm nhân viên ── */}
      {showCreate && (
        <Modal title="THÊM TÀI KHOẢN MỚI" onClose={() => setShowCreate(false)}>
          <form onSubmit={handleSubmitCreate} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <div className="grid grid-cols-2 gap-4">
                <Field
                  label="Họ và tên (*)" name="fullName"
                  value={createForm.fullName} placeholder="VD: Nguyễn Văn A"
                  onChange={(e) => setCreateForm((p) => ({ ...p, fullName: e.target.value }))}
                />
                <Field
                  label="Số điện thoại (*)" name="phoneNumber"
                  value={createForm.phoneNumber} placeholder="0901234567"
                  onChange={(e) => setCreateForm((p) => ({ ...p, phoneNumber: e.target.value }))}
                />
              </div>
              <Field
                label="Email (*)" name="email" type="email"
                value={createForm.email} placeholder="email@nhathuoc.com"
                onChange={(e) => setCreateForm((p) => ({ ...p, email: e.target.value }))}
              />
              <Field
                label="Mật khẩu (*)" name="password" type="password"
                value={createForm.password} placeholder="Ít nhất 8 ký tự"
                onChange={(e) => setCreateForm((p) => ({ ...p, password: e.target.value }))}
              />
              <SelectField
                label="Vai trò" name="role"
                value={createForm.role} options={ROLE_OPTIONS}
                onChange={(e) => setCreateForm((p) => ({ ...p, role: e.target.value }))}
              />
            </div>
            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50 flex justify-end gap-3">
              <button type="button" onClick={() => setShowCreate(false)} className="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 text-sm font-medium transition">
                Hủy
              </button>
              <button type="submit" disabled={savingCreate} className="px-4 py-2 bg-teal-600 hover:bg-teal-700 text-white rounded-lg text-sm font-medium transition disabled:opacity-60">
                {savingCreate ? "Đang tạo..." : "Tạo tài khoản"}
              </button>
            </div>
          </form>
        </Modal>
      )}

      {/* ── Modal Sửa nhân viên ── */}
      {showEdit && editTarget && (
        <Modal title="CẬP NHẬT THÔNG TIN" onClose={() => setShowEdit(false)}>
          <form onSubmit={handleSubmitEdit} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <div className="grid grid-cols-2 gap-4">
                <Field
                  label="Họ và tên (*)" name="fullName"
                  value={editForm.fullName}
                  onChange={(e) => setEditForm((p) => ({ ...p, fullName: e.target.value }))}
                />
                <Field
                  label="Số điện thoại (*)" name="phoneNumber"
                  value={editForm.phoneNumber}
                  onChange={(e) => setEditForm((p) => ({ ...p, phoneNumber: e.target.value }))}
                />
              </div>
              <Field
                label="Email (*)" name="email" type="email"
                value={editForm.email}
                onChange={(e) => setEditForm((p) => ({ ...p, email: e.target.value }))}
              />
              <Field
                label="Mật khẩu mới" name="password" type="password"
                value={editForm.password} placeholder="Để trống nếu không đổi"
                onChange={(e) => setEditForm((p) => ({ ...p, password: e.target.value }))}
              />
              <div className="grid grid-cols-2 gap-4">
                <SelectField
                  label="Giới tính" name="gender"
                  value={editForm.gender} options={GENDER_OPTIONS}
                  onChange={(e) => setEditForm((p) => ({ ...p, gender: e.target.value }))}
                />
                <Field
                  label="Ngày sinh" name="dob" type="date"
                  value={editForm.dob}
                  onChange={(e) => setEditForm((p) => ({ ...p, dob: e.target.value }))}
                />
              </div>
              <Field
                label="Địa chỉ" name="address"
                value={editForm.address}
                onChange={(e) => setEditForm((p) => ({ ...p, address: e.target.value }))}
              />
              <div className="grid grid-cols-2 gap-4">
                <Field
                  label="Ngày vào làm" name="hireDate" type="date"
                  value={editForm.hireDate}
                  onChange={(e) => setEditForm((p) => ({ ...p, hireDate: e.target.value }))}
                />
                <SelectField
                  label="Vai trò" name="role"
                  value={editForm.role} options={ROLE_OPTIONS}
                  onChange={(e) => setEditForm((p) => ({ ...p, role: e.target.value }))}
                />
              </div>
            </div>
            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50 flex justify-end gap-3">
              <button type="button" onClick={() => setShowEdit(false)} className="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 text-sm font-medium transition">
                Hủy
              </button>
              <button type="submit" disabled={savingEdit} className="px-4 py-2 bg-teal-600 hover:bg-teal-700 text-white rounded-lg text-sm font-medium transition disabled:opacity-60">
                {savingEdit ? "Đang lưu..." : "Lưu thay đổi"}
              </button>
            </div>
          </form>
        </Modal>
      )}

      {/* ── Detail Modal ── */}
      {detailEmployee && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm"
          onClick={() => setDetailEmployee(null)}
        >
          <div
            className="bg-white rounded-2xl shadow-xl w-full max-w-md mx-4 overflow-hidden"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="bg-gradient-to-r from-teal-600 to-teal-500 px-6 py-5 flex items-center gap-4">
              <img
                src={detailEmployee.avatarUrl ? detailEmployee.avatarUrl.startsWith("/uploads") ? `http://localhost:5000${detailEmployee.avatarUrl}` : detailEmployee.avatarUrl : DEFAULT_AVATAR}
                alt="avatar"
                className="w-16 h-16 rounded-full object-cover border-2 border-white/60"
              />
              <div>
                <div className="text-white font-bold text-lg leading-tight">{detailEmployee.fullName}</div>
                <div className="text-teal-100 text-sm mt-0.5">{detailEmployee.employeeCode}</div>
                <span className={`inline-flex items-center gap-1 mt-1.5 px-2 py-0.5 rounded-full text-xs font-medium
                  ${detailEmployee.role === "admin" ? "bg-purple-100 text-purple-700" : "bg-blue-100 text-blue-700"}`}>
                  {detailEmployee.role === "admin" ? <FaShieldHalved /> : <FaUser />}
                  {detailEmployee.role === "admin" ? "Quản trị viên" : "Nhân viên"}
                </span>
              </div>
            </div>

            <div className="px-6 py-5 grid grid-cols-2 gap-x-6 gap-y-4 text-sm">
              {[
                { icon: <FaEnvelope />,     label: "Email",        value: detailEmployee.email },
                { icon: <FaPhone />,        label: "Điện thoại",   value: detailEmployee.phoneNumber },
                { icon: <FaVenusMars />,    label: "Giới tính",    value: detailEmployee.gender || "—" },
                { icon: <FaCakeCandles />,  label: "Ngày sinh",    value: detailEmployee.dob ? detailEmployee.dob.split("T")[0] : "—" },
                { icon: <FaLocationDot />,  label: "Địa chỉ",      value: detailEmployee.address || "—" },
                { icon: <FaCalendarDays />, label: "Ngày vào làm", value: detailEmployee.hireDate ? detailEmployee.hireDate.split("T")[0] : "—" },
              ].map(({ icon, label, value }) => (
                <div key={label}>
                  <div className="text-gray-400 text-xs mb-0.5 flex items-center gap-1.5">
                    <span className="shrink-0">{icon}</span> {label}
                  </div>
                  <div className="text-gray-800 font-medium truncate">{value}</div>
                </div>
              ))}
              <div className="col-span-2 pt-1 border-t border-gray-100">
                <div className="text-gray-400 text-xs mb-1 flex items-center gap-1.5">
                  <FaCircleInfo /> Trạng thái tài khoản
                </div>
                <span className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium border
                  ${detailEmployee.isLocked ? "bg-red-50 text-red-600 border-red-200" : "bg-green-50 text-green-600 border-green-200"}`}>
                  {detailEmployee.isLocked ? <FaBan /> : <FaCircleCheck />}
                  {detailEmployee.isLocked ? "Đang bị khóa" : "Đang hoạt động"}
                </span>
              </div>
            </div>

            <div className="px-6 py-4 border-t border-gray-100 flex justify-end gap-2">
              <button
                onClick={() => { setDetailEmployee(null); openEditSelected(); }}
                className="px-4 py-2 bg-teal-600 hover:bg-teal-700 text-white text-sm rounded-lg font-medium transition flex items-center gap-2"
              >
                Chỉnh sửa
              </button>
              <button
                onClick={() => setDetailEmployee(null)}
                className="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 text-sm rounded-lg font-medium transition"
              >
                Đóng
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}