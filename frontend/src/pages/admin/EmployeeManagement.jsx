import { useState, useEffect } from "react";
import { Topbar } from "../../components/admin/topbar";
import axiosClient from "../../api/axiosClient";
import Swal from "sweetalert2";
import { FaEye, FaPenToSquare, FaLock, FaLockOpen, FaTrashCan, FaBan, FaCircleCheck, FaEnvelope, FaPhone, FaVenusMars, FaCakeCandles, FaLocationDot, FaCalendarDays, FaCircleInfo, FaShieldHalved, FaUser, FaPlus} from "react-icons/fa6";

export default function EmployeeManagement() {
  const [employees, setEmployees] = useState([]);
  const [loading, setLoading] = useState(true);
  const [detailEmployee, setDetailEmployee] = useState(null);

  const fetchEmployees = async (keyword = "") => {
    try {
      setLoading(true);
      const res = await axiosClient.get("/admin/employees", {
        params: { search: keyword },
      });
      setEmployees(res.data.data);
    } catch (error) {
      console.error("Lỗi fetch nhân viên:", error);
      Swal.fire("Lỗi", "Không thể tải danh sách nhân viên", "error");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchEmployees();
  }, []);

  const handleCreateEmployee = async () => {
    const { value: formValues } = await Swal.fire({
      title:
        '<h3 class="text-xl font-bold text-teal-700 mb-4">THÊM TÀI KHOẢN MỚI</h3>',
      html: `
        <div class="flex flex-col gap-4 text-left">
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Họ và tên (*)</label>
              <input id="swal-name" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="VD: Nguyễn Văn A">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Số điện thoại (*)</label>
              <input id="swal-phone" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="0901234567">
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Email (*)</label>
            <input id="swal-email" type="email" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="email@nhathuoc.com">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Mật khẩu (*)</label>
            <input id="swal-pass" type="password" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="Nhập ít nhất 8 ký tự">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Vai trò</label>
            <select id="swal-role" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white">
              <option value="employee">Nhân viên (Employee)</option>
              <option value="admin">Quản trị viên (Admin)</option>
            </select>
          </div>
        </div>
      `,
      focusConfirm: false,
      showCancelButton: true,
      confirmButtonText: "Tạo tài khoản",
      cancelButtonText: "Hủy",
      confirmButtonColor: "#0d9488",
      width: "560px",
      preConfirm: () => {
        const fullName = document.getElementById("swal-name").value.trim();
        const phoneNumber = document.getElementById("swal-phone").value.trim();
        const email = document.getElementById("swal-email").value.trim();
        const password = document.getElementById("swal-pass").value;
        const role = document.getElementById("swal-role").value;
        if (!fullName || !phoneNumber || !email || !password) {
          Swal.showValidationMessage(
            "Vui lòng nhập đầy đủ các trường bắt buộc (*)",
          );
          return false;
        }
        if (password.length < 8) {
          Swal.showValidationMessage("Mật khẩu phải có ít nhất 8 ký tự");
          return false;
        }
        return { fullName, phoneNumber, email, password, role };
      },
    });

    if (formValues) {
      try {
        await axiosClient.post("/admin/employees", formValues);
        Swal.fire({
          icon: "success",
          title: "Thành công",
          text: "Đã tạo tài khoản nhân viên mới!",
          timer: 1800,
          showConfirmButton: false,
        });
        fetchEmployees();
      } catch (err) {
        Swal.fire(
          "Lỗi",
          err.response?.data?.message || "Không thể tạo tài khoản",
          "error",
        );
      }
    }
  };

  // ─── EDIT ─────────────────────────────────────────────────────────────────────
  const handleEditEmployee = async (employee) => {
    setDetailEmployee(null);
    const dob = employee.dob ? employee.dob.split("T")[0] : "";
    const hireDate = employee.hireDate ? employee.hireDate.split("T")[0] : "";

    const { value: formValues } = await Swal.fire({
      title:
        '<h3 class="text-xl font-bold text-teal-700 mb-4">CẬP NHẬT THÔNG TIN</h3>',
      html: `
        <div class="flex flex-col gap-4 text-left">
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Họ và tên (*)</label>
              <input id="swal-edit-name" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" value="${employee.fullName || ""}">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Số điện thoại (*)</label>
              <input id="swal-edit-phone" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" value="${employee.phoneNumber || ""}">
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Email (*)</label>
            <input id="swal-edit-email" type="email" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" value="${employee.email || ""}">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Mật khẩu mới</label>
            <input id="swal-edit-pass" type="password" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="Để trống nếu không đổi">
          </div>
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Giới tính</label>
              <select id="swal-edit-gender" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white">
                <option value="nam"  ${employee.gender === "nam" ? "selected" : ""}>Nam</option>
                <option value="nữ"   ${employee.gender === "nữ" ? "selected" : ""}>Nữ</option>
                <option value="khác" ${employee.gender === "khác" ? "selected" : ""}>Khác</option>
              </select>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Ngày sinh</label>
              <input id="swal-edit-dob" type="date" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" value="${dob}">
            </div>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Địa chỉ</label>
            <input id="swal-edit-address" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" value="${employee.address || ""}">
          </div>
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Ngày vào làm</label>
              <input id="swal-edit-hiredate" type="date" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" value="${hireDate}">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-1">Vai trò</label>
              <select id="swal-edit-role" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white">
                <option value="employee" ${employee.role === "employee" ? "selected" : ""}>Nhân viên</option>
                <option value="admin"    ${employee.role === "admin" ? "selected" : ""}>Quản trị viên</option>
              </select>
            </div>
          </div>
        </div>
      `,
      focusConfirm: false,
      showCancelButton: true,
      confirmButtonColor: "#0d9488",
      confirmButtonText: "Lưu thay đổi",
      cancelButtonText: "Hủy",
      width: "560px",
      preConfirm: () => {
        const fullName = document.getElementById("swal-edit-name").value.trim();
        const phoneNumber = document
          .getElementById("swal-edit-phone")
          .value.trim();
        const email = document.getElementById("swal-edit-email").value.trim();
        const password = document.getElementById("swal-edit-pass").value;
        if (!fullName || !phoneNumber || !email) {
          Swal.showValidationMessage(
            "Vui lòng nhập đầy đủ các trường bắt buộc (*)",
          );
          return false;
        }
        if (password && password.length < 8) {
          Swal.showValidationMessage("Mật khẩu phải có ít nhất 8 ký tự");
          return false;
        }
        const data = {
          fullName,
          phoneNumber,
          email,
          gender: document.getElementById("swal-edit-gender").value,
          dob: document.getElementById("swal-edit-dob").value || null,
          address: document.getElementById("swal-edit-address").value.trim(),
          hireDate: document.getElementById("swal-edit-hiredate").value || null,
          role: document.getElementById("swal-edit-role").value,
        };
        if (password) data.password = password; 
        return data;
      },
    });

    if (formValues) {
      try {
        await axiosClient.put(
          `/admin/employees/${employee.employeeId}`,
          formValues,
        );
        Swal.fire({
          icon: "success",
          title: "Đã lưu",
          text: "Thông tin nhân viên đã được cập nhật!",
          timer: 1800,
          showConfirmButton: false,
        });
        fetchEmployees();
      } catch (err) {
        Swal.fire(
          "Lỗi",
          err.response?.data?.message || "Không thể cập nhật",
          "error",
        );
      }
    }
  };

  // ─── CHANGE ROLE ──────────────────────────────────────────────────────────────
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

    if (!confirmed.isConfirmed) {
      fetchEmployees();
      return;
    }

    try {
      await axiosClient.put(`/admin/employees/${employee.employeeId}`, {
        role: newRole,
      });
      Swal.fire({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 2000,
        icon: "success",
        title: `Đã cập nhật vai trò: ${newRole === "admin" ? "Admin" : "Nhân viên"}`,
      });
      fetchEmployees();
    } catch (err) {
      Swal.fire(
        "Lỗi",
        err.response?.data?.message || "Cập nhật vai trò thất bại",
        "error",
      );
      fetchEmployees();
    }
  };

  // ─── TOGGLE LOCK ──────────────────────────────────────────────────────────────
  const handleToggleLock = async (employee) => {
    if (employee.role === "admin")
      return Swal.fire(
        "Không được phép",
        "Không thể khóa tài khoản Admin!",
        "error",
      );

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
        Swal.fire({
          icon: "success",
          title: "Thành công",
          text: `Đã ${action.toLowerCase()} tài khoản!`,
          timer: 1800,
          showConfirmButton: false,
        });
        fetchEmployees();
      } catch (err) {
        Swal.fire(
          "Lỗi",
          err.response?.data?.message || "Thao tác thất bại",
          "error",
        );
      }
    }
  };

  const handleDeleteEmployee = async (employee) => {
    if (employee.role === "admin")
      return Swal.fire(
        "Không được phép",
        "Không được phép xóa Admin!",
        "error",
      );

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
        Swal.fire({
          icon: "success",
          title: "Đã xóa!",
          text: "Tài khoản nhân viên đã được xóa.",
          timer: 1800,
          showConfirmButton: false,
        });
        fetchEmployees();
      } catch (err) {
        Swal.fire(
          "Lỗi",
          err.response?.data?.message || "Không thể xóa nhân viên này",
          "error",
        );
      }
    }
  };

  // ─── LOADING ──────────────────────────────────────────────────────────────────
  if (loading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-teal-600"></div>
        <span className="ml-2 text-teal-600 font-medium">
          Đang tải dữ liệu...
        </span>
      </div>
    );
  }

  const detailFields = detailEmployee
    ? [
        { icon: <FaEnvelope />, label: "Email", value: detailEmployee.email },
        {
          icon: <FaPhone />,
          label: "Điện thoại",
          value: detailEmployee.phoneNumber,
        },
        {
          icon: <FaVenusMars />,
          label: "Giới tính",
          value: detailEmployee.gender || "—",
        },
        {
          icon: <FaCakeCandles />,
          label: "Ngày sinh",
          value: detailEmployee.dob ? detailEmployee.dob.split("T")[0] : "—",
        },
        {
          icon: <FaLocationDot />,
          label: "Địa chỉ",
          value: detailEmployee.address || "—",
        },
        {
          icon: <FaCalendarDays />,
          label: "Ngày vào làm",
          value: detailEmployee.hireDate
            ? detailEmployee.hireDate.split("T")[0]
            : "—",
        },
      ]
    : [];

  // ─── RENDER ───────────────────────────────────────────────────────────────────
  return (
    <>
      <Topbar
        title="Quản lý nhân viên"
        subtitle="Danh sách tài khoản nhân viên"
      />

      <div className="p-6 bg-gray-50 min-h-screen">
        {/* Header */}
        <div className="flex flex-col sm:flex-row justify-between items-center mb-6 gap-4">
          <h2 className="text-2xl font-bold text-gray-800">
            Quản Lý Nhân Viên
          </h2>
          <button
            onClick={handleCreateEmployee}
            className="bg-teal-600 hover:bg-teal-700 text-white px-4 py-2.5 rounded-lg shadow-sm font-medium transition flex items-center gap-2 whitespace-nowrap"
          >
            <FaPlus /> Thêm Nhân Viên
          </button>
        </div>

        {/* Table */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-100 text-gray-600 text-sm uppercase tracking-wider">
                  <th className="px-6 py-4 font-semibold">Nhân viên</th>
                  <th className="px-6 py-4 font-semibold">Email</th>
                  <th className="px-6 py-4 font-semibold">Số điện thoại</th>
                  <th className="px-6 py-4 font-semibold">Vai trò</th>
                  <th className="px-6 py-4 font-semibold text-center">
                    Trạng thái
                  </th>
                  <th className="px-6 py-4 font-semibold text-right">
                    Hành động
                  </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {employees.length === 0 ? (
                  <tr>
                    <td
                      colSpan="6"
                      className="px-6 py-12 text-center text-gray-400"
                    >
                      Chưa có nhân viên nào trên hệ thống!
                    </td>
                  </tr>
                ) : (
                  employees.map((u) => (
                    <tr
                      key={u.employeeId}
                      className={`hover:bg-gray-50 transition ${u.isLocked ? "bg-red-50/30" : ""}`}
                    >
                      {/* Nhân viên */}
                      <td className="px-6 py-4">
                        <div className="flex items-center gap-3">
                          <img
                            src={
                              u.avatarUrl && !u.avatarUrl.includes("default")
                                ? u.avatarUrl
                                : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                            }
                            alt="avatar"
                            className="w-11 h-11 rounded-full object-cover border border-gray-200"
                          />
                          <div>
                            <div className="font-medium text-gray-900">
                              {u.fullName}
                            </div>
                            <div className="text-xs text-teal-600 font-semibold bg-teal-50 inline-block px-2 py-0.5 rounded mt-1 border border-teal-100">
                              {u.employeeCode}
                            </div>
                          </div>
                        </div>
                      </td>

                      {/* Email */}
                      <td className="px-6 py-4 text-sm text-gray-700">
                        {u.email}
                      </td>

                      {/* SĐT */}
                      <td className="px-6 py-4 text-sm text-gray-600">
                        {u.phoneNumber}
                      </td>

                      {/* Vai trò */}
                      <td className="px-6 py-4">
                        <select
                          value={u.role}
                          onChange={(e) => handleChangeRole(u, e.target.value)}
                          disabled={u.role === "admin"}
                          className={`text-sm rounded-full px-3 py-1 border font-medium focus:outline-none appearance-none cursor-pointer pr-8 bg-no-repeat
                            disabled:opacity-70 disabled:cursor-not-allowed
                            ${
                              u.role === "admin"
                                ? "bg-purple-100 text-purple-700 border-purple-200"
                                : "bg-blue-100 text-blue-700 border-blue-200"
                            }`}
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

                      {/* Trạng thái */}
                      <td className="px-6 py-4 text-center">
                        <span
                          className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium border
                          ${
                            u.isLocked
                              ? "bg-red-50 text-red-600 border-red-200"
                              : "bg-green-50 text-green-600 border-green-200"
                          }`}
                        >
                          {u.isLocked ? (
                            <>
                              <FaBan /> Bị khóa
                            </>
                          ) : (
                            <>
                              <FaCircleCheck /> Hoạt động
                            </>
                          )}
                        </span>
                      </td>

                      {/* Hành động */}
                      <td className="px-6 py-4">
                        <div className="flex items-center justify-end gap-1">
                          <button
                            onClick={() => setDetailEmployee(u)}
                            className="p-2 text-gray-500 hover:bg-gray-100 rounded-lg transition"
                            title="Xem chi tiết"
                          >
                            <FaEye />
                          </button>
                          <button
                            onClick={() => handleEditEmployee(u)}
                            className="p-2 text-blue-600 hover:bg-blue-50 rounded-lg transition"
                            title="Sửa thông tin"
                          >
                            <FaPenToSquare />
                          </button>
                          <button
                            onClick={() => handleToggleLock(u)}
                            disabled={u.role === "admin"}
                            className={`p-2 rounded-lg transition disabled:opacity-50 disabled:cursor-not-allowed
                              ${u.isLocked ? "text-green-600 hover:bg-green-50" : "text-orange-500 hover:bg-orange-50"}`}
                            title={
                              u.isLocked
                                ? "Mở khóa tài khoản"
                                : "Khóa tài khoản"
                            }
                          >
                            {u.isLocked ? <FaLockOpen /> : <FaLock />}
                          </button>
                          <button
                            onClick={() => handleDeleteEmployee(u)}
                            disabled={u.role === "admin"}
                            className="p-2 text-red-600 hover:bg-red-50 rounded-lg transition disabled:opacity-50 disabled:cursor-not-allowed"
                            title="Xóa vĩnh viễn"
                          >
                            <FaTrashCan />
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>

          {employees.length > 0 && (
            <div className="px-6 py-3 border-t border-gray-100 text-sm text-gray-500 bg-gray-50">
              Tổng:{" "}
              <span className="font-semibold text-gray-700">
                {employees.length}
              </span>{" "}
              nhân viên
            </div>
          )}
        </div>
      </div>

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
            {/* Header */}
            <div className="bg-gradient-to-r from-teal-600 to-teal-500 px-6 py-5 flex items-center gap-4">
              <img
                src={
                  detailEmployee.avatarUrl &&
                  !detailEmployee.avatarUrl.includes("default")
                    ? detailEmployee.avatarUrl
                    : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                }
                alt="avatar"
                className="w-16 h-16 rounded-full object-cover border-2 border-white/60"
              />
              <div>
                <div className="text-white font-bold text-lg leading-tight">
                  {detailEmployee.fullName}
                </div>
                <div className="text-teal-100 text-sm mt-0.5">
                  {detailEmployee.employeeCode}
                </div>
                <span
                  className={`inline-flex items-center gap-1 mt-1.5 px-2 py-0.5 rounded-full text-xs font-medium
                  ${detailEmployee.role === "admin" ? "bg-purple-100 text-purple-700" : "bg-blue-100 text-blue-700"}`}
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

            {/* Body */}
            <div className="px-6 py-5 grid grid-cols-2 gap-x-6 gap-y-4 text-sm">
              {detailFields.map(({ icon, label, value }) => (
                <div key={label}>
                  <div className="text-gray-400 text-xs mb-0.5 flex items-center gap-1.5">
                    <span className="shrink-0">{icon}</span> {label}
                  </div>
                  <div className="text-gray-800 font-medium truncate">
                    {value}
                  </div>
                </div>
              ))}
              <div className="col-span-2 pt-1 border-t border-gray-100">
                <div className="text-gray-400 text-xs mb-1 flex items-center gap-1.5">
                  <FaCircleInfo /> Trạng thái tài khoản
                </div>
                <span
                  className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium border
                  ${
                    detailEmployee.isLocked
                      ? "bg-red-50 text-red-600 border-red-200"
                      : "bg-green-50 text-green-600 border-green-200"
                  }`}
                >
                  {detailEmployee.isLocked ? <FaBan /> : <FaCircleCheck />}
                  {detailEmployee.isLocked ? "Đang bị khóa" : "Đang hoạt động"}
                </span>
              </div>
            </div>

            {/* Footer */}
            <div className="px-6 py-4 border-t border-gray-100 flex justify-end gap-2">
              <button
                onClick={() => handleEditEmployee(detailEmployee)}
                className="px-4 py-2 bg-teal-600 hover:bg-teal-700 text-white text-sm rounded-lg font-medium transition flex items-center gap-2"
              >
                <FaPenToSquare /> Chỉnh sửa
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
