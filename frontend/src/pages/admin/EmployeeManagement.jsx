import { useState, useEffect, useMemo, useRef } from "react";
import { Topbar } from "../../components/admin/topbar";
import axiosClient from "../../api/axiosClient";
import { alertSuccess, alertError, alertWarning, alertConfirm, alertToast} from "../../utils/SwalAlert";
import { FaEnvelope, FaPhone, FaVenusMars, FaCakeCandles, FaLocationDot, FaCalendarDays, FaCircleInfo, FaShieldHalved, FaUser, FaXmark,FaBan, FaCircleCheck, FaLock, FaLockOpen } from "react-icons/fa6";
import {fileUrl} from "../../utils/FileUrl";
import {formatDate} from "../../utils/Format"

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
        className="form-base"
      />
    </div>
  );
}
function SelectField({ label, name, value, onChange, options }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">
        {label}
      </label>
      <select
        name={name}
        value={value}
        onChange={onChange}
        className="form-base"
      >
        {options.map((o) => (
          <option key={o.value} value={o.value}>
            {o.label}
          </option>
        ))}
      </select>
    </div>
  );
}

function Modal({ title, onClose, children }) {
  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/50 backdrop-blur-sm px-4 animate-[fadeIn_0.15s_ease-out]"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-2xl ring-1 ring-black/5 w-full max-w-2xl flex flex-col max-h-[90vh] overflow-hidden animate-[scaleIn_0.15s_ease-out]"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="relative px-6 py-5 bg-gradient-to-r from-blue-600 to-blue-500 shrink-0">
          <h3 className="text-xl font-bold text-white text-center pr-8">{title}</h3>
          <button
            onClick={onClose}
            className="absolute right-4 top-1/2 -translate-y-1/2 p-1.5 rounded-full text-white/80 hover:text-white hover:bg-white/15 transition"
          >
            <FaXmark className="h-4 w-4" />
          </button>
        </div>
        <div className="flex flex-col overflow-y-auto">{children}</div>
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

export default function EmployeeManagement() {
  const [employees, setEmployees] = useState([]);
  const [initialLoading, setInitialLoading] = useState(true);
  const [searching, setSearching]           = useState(false);
  const [keyword, setKeyword]               = useState("");
  const debounceRef = useRef(null);
  const hasLoadedOnce = useRef(false);

  const [selectedId, setSelectedId] = useState(null);
  const selectedEmployee = useMemo(
    () => employees.find((e) => e.employeeId === selectedId) || null,
    [employees, selectedId]
  );

  const [detailEmployee, setDetailEmployee] = useState(null);

  const [showCreate, setShowCreate] = useState(false);
  const [createForm, setCreateForm] = useState(EMPTY_CREATE);
  const [savingCreate, setSavingCreate] = useState(false);

  const [showEdit, setShowEdit]     = useState(false);
  const [editTarget, setEditTarget] = useState(null);
  const [editForm, setEditForm]     = useState(EMPTY_EDIT);
  const [savingEdit, setSavingEdit] = useState(false);

  const fetchEmployees = async (search = "") => {
    try {
      if (!hasLoadedOnce.current) {
        setInitialLoading(true);
      } else {
        setSearching(true);
      }
      const res = await axiosClient.get("/employees/admin/management", {
        params: search ? { search } : undefined,
      });
      setEmployees(res.data.data);
    } catch {
      alertError("Không thể tải danh sách nhân viên rồi, có lẽ có sự cố -.-");
    } finally {
      hasLoadedOnce.current = true;
      setInitialLoading(false);
      setSearching(false);
    }
  };

  useEffect(() => { fetchEmployees(); }, []);

  useEffect(() => () => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
  }, []);

  const handleSearch = (value) => {
    setKeyword(value);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      fetchEmployees(value.trim());
    }, 400);
  };

  const toggleSelect = (employee) => {
    setSelectedId((prev) => (prev === employee.employeeId ? null : employee.employeeId));
  };

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

  const handleChangeRole = async (employee, newRole) => {
    const confirmed = await alertConfirm(
      `Chuyển ${employee.fullName} sang: ${newRole === "admin" ? "Quản trị viên" : "Nhân viên"}`,
      "Xác nhận thay đổi vai trò?",
    );
    if (!confirmed.isConfirmed) { fetchEmployees(keyword.trim()); return; }
    try {
      await axiosClient.put(
        `/employees/admin/management/${employee.employeeId}`,
        { role: newRole },
      );
      alertToast(`Đã cập nhật vai trò: ${newRole === "admin" ? "Admin" : "Nhân viên"}`);
      fetchEmployees(keyword.trim());
    } catch (err) {
      alertError(err, "có sự cố cập nhất rồi -.-");
      fetchEmployees(keyword.trim());
    }
  };

  const handleToggleLock = async (employee) => {
    if (employee.role === "admin")
      return alertError("Không thể khóa tài khoản Admin!", "Không được phép");
    const action = employee.isLocked ? "Mở khóa" : "Khóa";
    const result = await alertConfirm(
      `Bạn có chắc muốn ${action.toLowerCase()} tài khoản của ${employee.fullName}?`,
      `Xác nhận ${action}?`,
      employee.isLocked ? "btn-swal-danger" : "btn-swal-ok",
    );
    if (result.isConfirmed) {
      try {
        await axiosClient.patch(`/employees/admin/management/lock/${employee.employeeId}`);
        alertSuccess(`Đã ${action.toLowerCase()} tài khoản!`);
        fetchEmployees(keyword.trim());
      } catch (err) {
        alertError( err || "có vẻ có lỗi rồi -.-");
      }
    }
  };

  const handleSubmitCreate = async (e) => {
    e.preventDefault();
    const { fullName, phoneNumber, email, password, role } = createForm;
    if (!fullName || !phoneNumber || !email || !password) {
      return alertWarning("Vui lòng nhập đầy đủ các trường bắt buộc (*)");
    }
    if (password.length < 8) {
      return alertWarning("Mật khẩu phải có ít nhất 8 ký tự");
    }
    setSavingCreate(true);
    try {
      await axiosClient.post("/employees/admin/management", { fullName, phoneNumber, email, password, role });
      alertSuccess("Đã tạo tài khoản nhân viên mới!");
      setShowCreate(false);
      fetchEmployees(keyword.trim());
    } catch (err) {
      alertError(err, "Không thể tạo tài khoản");
    } finally {
      setSavingCreate(false);
    }
  };

  const handleSubmitEdit = async (e) => {
    e.preventDefault();
    const { fullName, phoneNumber, email, password } = editForm;
    if (!fullName || !phoneNumber || !email) {
      return alertWarning("Vui lòng nhập đầy đủ các trường bắt buộc (*)");
    }
    if (password && password.length < 8) {
      return alertWarning("Mật khẩu phải có ít nhất 8 ký tự");
    }
    const data = { ...editForm };
    if (!data.password) delete data.password;
    if (!data.dob)      data.dob = null;
    if (!data.hireDate) data.hireDate = null;

    setSavingEdit(true);
    try {
      await axiosClient.put(`/employees/admin/management/${editTarget.employeeId}`, data);
      alertSuccess("Thông tin nhân viên đã được cập nhật!");
      setShowEdit(false);
      fetchEmployees(keyword.trim());
    } catch (err) {
      alertError(err || "Không thể cập nhật");
    } finally {
      setSavingEdit(false);
    }
  };

  const handleDeleteSelected = async () => {
    const employee = selectedEmployee;
    if (!employee) return;
    if (employee.role === "admin")
      return alertError("Không được phép xóa Admin!");
    const result = await alertConfirm(
      `Tài khoản ${employee.fullName} sẽ bị xóa vĩnh viễn!`,
      "Bạn có chắc chắn?",
      "btn-swal-danger", 
    );
    if (result.isConfirmed) {
      try {
        await axiosClient.delete(`/employees/admin/management/${employee.employeeId}`);
        alertSuccess("Tài khoản nhân viên đã được xóa.");
        setSelectedId(null);
        fetchEmployees(keyword.trim());
      } catch (err) {
        alertError(err || "Không thể xóa nhân viên này. xóa thất bại -.-");
      }
    }
  };

  if (initialLoading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600" />
        <span className="ml-2 text-blue-600 font-medium">Đang tải dữ liệu...</span>
      </div>
    );
  }

  return (
    <>
      <Topbar
        title="Quản lý nhân viên"
        subtitle="Danh sách tài khoản nhân viên"
        hasSelection={!!selectedEmployee}
        onSearch={handleSearch}
        searchValue={keyword}
        searchPlaceholder="Tìm theo tên, mã nhân viên,..."
        actions={{
          onCreate: openCreate,
          onView: openViewSelected,
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
                    <td
                      colSpan="5"
                      className="px-6 py-12 text-center text-gray-400"
                    >
                      {" "}
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
                        className={`cursor-pointer transition-colors duration-200 select-none border-b border-gray-100
                          ${isSelected ? "bg-blue-100 ring-1 ring-inset ring-blue-50" : "hover:bg-gray-100"}
                          ${u.isLocked ? "bg-red-50/30" : ""}`}
                      >
                        {/* Avatar + Mã NV */}
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-3">
                            <img
                              src={
                                fileUrl(u.avatarUrl) ||
                                "/img/default/default-avt.png"
                              }
                              alt="avatar"
                              className="w-10 h-10 rounded-full object-cover border border-gray-200 shrink-0"
                            />
                            <span className="text-xs text-blue-600 font-semibold bg-blue-50 px-2 py-0.5 rounded border border-blue-100">
                              {u.employeeCode}
                            </span>
                          </div>
                        </td>

                        {/* Họ tên */}
                        <td className="px-6 py-4 font-medium text-black">
                          {" "}
                          {u.fullName}
                        </td>

                        {/* Liên hệ */}
                        <td className="px-6 py-4 text-sm text-gray-600">
                          <div className="flex items-center gap-1.5 mb-1">
                            <FaEnvelope className="text-gray-500 shrink-0" />
                            <span>{u.email}</span>
                          </div>
                          <div className="flex items-center gap-1.5">
                            <FaPhone className="text-gray-400 shrink-0" />
                            <span>{u.phoneNumber}</span>
                          </div>
                        </td>

                        {/* Vai trò */}
                        <td
                          className="px-6 py-4"
                          onClick={(e) => e.stopPropagation()}
                        >
                          <select
                            value={u.role}
                            onChange={(e) =>
                              handleChangeRole(u, e.target.value)
                            }
                            disabled={u.role === "admin"}
                            className={`text-sm rounded-full px-3 py-1 border font-medium focus:outline-none appearance-none cursor-pointer pr-8 bg-no-repeat
                                        disabled:opacity-70 disabled:cursor-not-allowed transition-colors
                              ${u.role === "admin" ? "bg-blue-600 text-white border-blue-200" : "bg-blue-50 text-blue-700 border-blue-200"}`}
                            style={{
                              backgroundImage: `url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%231d4ed8' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e")`,
                              backgroundPosition: "right 0.4rem center",
                              backgroundSize: "1.25em 1.25em",
                            }}
                          >
                            <option value="employee">Nhân viên</option>
                            <option value="admin">Admin</option>
                          </select>
                        </td>

                        {/* Trạng thái  */}
                        <td
                          className="px-6 py-4"
                          onClick={(e) => e.stopPropagation()}
                        >
                          <button
                            onClick={() => handleToggleLock(u)}
                            disabled={u.role === "admin"}
                            title={
                              u.isLocked
                                ? "Mở khóa tài khoản"
                                : "Khóa tài khoản"
                            }
                            className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium border transition
                              disabled:opacity-60 disabled:cursor-not-allowed
                              ${
                                u.isLocked
                                  ? "bg-red-50 text-red-600 border-red-200 hover:bg-red-100"
                                  : "bg-green-50 text-green-600 border-green-200 hover:bg-green-100"
                              }`}
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
                Tổng:{" "}
                <span className="font-semibold text-gray-700">
                  {employees.length}
                </span>{" "}
                nhân viên
              </span>

              {selectedEmployee && (
                <span className="text-blue-600">
                  {" "}
                  Đang chọn:{" "}
                  <span className="font-semibold">
                    {selectedEmployee.fullName}
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

      {/* Modal Thêm nhân viên*/}
      {showCreate && (
        <Modal title="THÊM TÀI KHOẢN MỚI" onClose={() => setShowCreate(false)}>
          <form onSubmit={handleSubmitCreate} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <div className="grid grid-cols-2 gap-4">
                <Field
                  label="Họ và tên (*)"
                  name="fullName"
                  value={createForm.fullName}
                  placeholder="VD: Trần Hoàng A"
                  onChange={(e) =>
                    setCreateForm((p) => ({ ...p, fullName: e.target.value }))
                  }
                />
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
              </div>
              <Field
                label="Email (*)"
                name="email"
                type="email"
                value={createForm.email}
                placeholder="me@email.com"
                onChange={(e) =>
                  setCreateForm((p) => ({ ...p, email: e.target.value }))
                }
              />
              <Field
                label="Mật khẩu (*)"
                name="password"
                type="password"
                value={createForm.password}
                placeholder="Ít nhất 8 ký tự"
                onChange={(e) =>
                  setCreateForm((p) => ({ ...p, password: e.target.value }))
                }
              />
              <SelectField
                label="Vai trò"
                name="role"
                value={createForm.role}
                options={ROLE_OPTIONS}
                onChange={(e) =>
                  setCreateForm((p) => ({ ...p, role: e.target.value }))
                }
              />
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
                {savingCreate ? "Đang tạo..." : "Tạo tài khoản"}
              </button>
            </div>
          </form>
        </Modal>
      )}

      {/* Modal Sửa nhân viên*/}
      {showEdit && editTarget && (
        <Modal title="CẬP NHẬT THÔNG TIN" onClose={() => setShowEdit(false)}>
          <form onSubmit={handleSubmitEdit} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <div className="grid grid-cols-2 gap-4">
                <Field
                  label="Họ và tên (*)"
                  name="fullName"
                  value={editForm.fullName}
                  onChange={(e) =>
                    setEditForm((p) => ({ ...p, fullName: e.target.value }))
                  }
                />
                <Field
                  label="Số điện thoại (*)"
                  name="phoneNumber"
                  value={editForm.phoneNumber}
                  onChange={(e) =>
                    setEditForm((p) => ({ ...p, phoneNumber: e.target.value }))
                  }
                />
              </div>
              <Field
                label="Email (*)"
                name="email"
                type="email"
                value={editForm.email}
                onChange={(e) =>
                  setEditForm((p) => ({ ...p, email: e.target.value }))
                }
              />
              <Field
                label="Mật khẩu mới"
                name="password"
                type="password"
                value={editForm.password}
                placeholder="Hãy để yên nếu không đổi"
                onChange={(e) =>
                  setEditForm((p) => ({ ...p, password: e.target.value }))
                }
              />
              <div className="grid grid-cols-2 gap-4">
                <SelectField
                  label="Giới tính"
                  name="gender"
                  value={editForm.gender}
                  options={GENDER_OPTIONS}
                  onChange={(e) =>
                    setEditForm((p) => ({ ...p, gender: e.target.value }))
                  }
                />
                <Field
                  label="Ngày sinh"
                  name="dob"
                  type="date"
                  value={editForm.dob}
                  onChange={(e) =>
                    setEditForm((p) => ({ ...p, dob: e.target.value }))
                  }
                />
              </div>
              <Field
                label="Địa chỉ"
                name="address"
                value={editForm.address}
                onChange={(e) =>
                  setEditForm((p) => ({ ...p, address: e.target.value }))
                }
              />
              <div className="grid grid-cols-2 gap-4">
                <Field
                  label="Ngày vào làm"
                  name="hireDate"
                  type="date"
                  value={editForm.hireDate}
                  onChange={(e) =>
                    setEditForm((p) => ({ ...p, hireDate: e.target.value }))
                  }
                />
                <SelectField
                  label="Vai trò"
                  name="role"
                  value={editForm.role}
                  options={ROLE_OPTIONS}
                  onChange={(e) =>
                    setEditForm((p) => ({ ...p, role: e.target.value }))
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

      {/* Detail Modal */}
      {detailEmployee && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/50 backdrop-blur-sm px-4"
          onClick={() => setDetailEmployee(null)}
        >
          <div
            className="bg-white rounded-2xl shadow-2xl ring-1 ring-black/5 w-full max-w-2xl overflow-hidden"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="bg-gradient-to-r from-blue-600 to-blue-500 px-6 py-8 flex items-center gap-4">
              <img
                src={
                  fileUrl(detailEmployee.avatarUrl) ||
                  "/img/default/default-avt.png"
                }
                alt="avatar"
                className="w-20 h-20 rounded-full object-cover ring-4 ring-white/30 shadow-lg shrink-0"
              />
              <div className="min-w-0">
                <div className="text-white font-bold text-xl leading-tight truncate">
                  {detailEmployee.fullName}
                </div>
                <div className="text-blue-100 text-sm mt-1 font-mono">
                  {detailEmployee.employeeCode}
                </div>
                <span
                  className={`inline-flex items-center gap-1.5 mt-2.5 px-2.5 py-1 rounded-full text-xs font-semibold
                  ${detailEmployee.role === "admin" ? "bg-purple-100 text-purple-700" : "bg-white text-blue-700"}`}
                >
                  {detailEmployee.role === "admin" ? (
                    <FaShieldHalved />
                  ) : (
                    <FaUser />
                  )}
                  {detailEmployee.role === "admin"
                    ? "Quản trị viên"
                    : "Nhân viên"}
                </span>
              </div>
            </div>

            <div className="px-6 py-7 grid grid-cols-2 sm:grid-cols-3 gap-6 text-sm">
              {[
                {
                  icon: <FaEnvelope />,
                  label: "Email",
                  value: detailEmployee.email,
                },
                {
                  icon: <FaPhone />,
                  label: "Điện thoại",
                  value: detailEmployee.phoneNumber,
                },
                {
                  icon: <FaVenusMars />,
                  label: "Giới tính",
                  value: detailEmployee.gender,
                },
                {
                  icon: <FaCakeCandles />,
                  label: "Ngày sinh",
                  value: formatDate(detailEmployee.dob),
                },
                {
                  icon: <FaLocationDot />,
                  label: "Địa chỉ",
                  value: detailEmployee.address || "chưa cập nhật",
                },
                {
                  icon: <FaCalendarDays />,
                  label: "Ngày vào làm",
                  value: formatDate(detailEmployee.hireDate),
                },
              ].map(({ icon, label, value }) => (
                <div key={label} className="flex items-start gap-3">
                  <span className="mt-0.5 h-8 w-8 shrink-0 rounded-lg bg-blue-50 text-blue-600 grid place-items-center">
                    {icon}
                  </span>
                  <div className="min-w-0">
                    <div className="text-gray-400 text-xs">{label}</div>
                    <div className="text-gray-800 font-semibold truncate">
                      {value}
                    </div>
                  </div>
                </div>
              ))}
            </div>

            <div className="px-6 pb-7">
              <div className="flex items-center justify-between bg-gray-50 rounded-xl border border-gray-100 px-4 py-4">
                <span className="text-gray-500 text-xs flex items-center gap-1.5">
                  <FaCircleInfo /> Trạng thái tài khoản
                </span>
                <span
                  className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold border
                  ${detailEmployee.isLocked ? "bg-red-50 text-red-600 border-red-200" : "bg-green-50 text-green-600 border-green-200"}`}
                >
                  {detailEmployee.isLocked ? <FaBan /> : <FaCircleCheck />}
                  {detailEmployee.isLocked ? "Đang bị khóa" : "Đang hoạt động"}
                </span>
              </div>
            </div>

            <div className="px-6 py-5 border-t border-gray-100 flex justify-end gap-2 bg-gray-50">
              <button
                onClick={() => {
                  setDetailEmployee(null);
                  openEditSelected();
                }}
                className="btn-gradient px-4 py-2 text-sm font-medium"
              >
                Chỉnh sửa
              </button>
              <button
                onClick={() => setDetailEmployee(null)}
                className="btn-cancel px-4 py-2 text-sm font-medium"
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