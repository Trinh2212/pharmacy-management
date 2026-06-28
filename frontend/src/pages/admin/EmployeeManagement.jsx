// chưa hoàn thành còn lỗi nè
import { useState, useEffect } from "react";
import { Topbar } from "../../components/admin/topbar";

import axiosClient from "../../api/axiosClient";
import Swal from "sweetalert2";
import { useAuth } from "../../contexts/AuthContext";

export default function EmployeeManagement() {
  const [employees, setEmployees] = useState([]);
  const [loading, setLoading] = useState(true);
  const { user: currentUser } = useAuth();

  const fetchEmployees = async () => {
    try {
      const res = await axiosClient.get("admin/employees");
      setEmployees(res.data.data);
      setLoading(false);
    } catch (error) {
      console.error("Lỗi fetch nhân viên:", error);
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchEmployees();
  }, []);

  const handleCreateEmployee = async () => {
    const { value: formValues } = await Swal.fire({
      title:
        '<h3 class="text-xl font-bold text-teal-700 mb-4"><i class="fa-solid fa-plus mr-2"></i> THÊM NHÂN VIÊN MỚI</h3>',
      html: `
        <div class="flex flex-col gap-4 text-left">
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Mã NV (*)</label>
                    <input id="swal-code" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="VD: NV001">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Họ và tên (*)</label>
                    <input id="swal-name" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="VD: Nguyễn Văn A">
                </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Số điện thoại (*)</label>
                    <input id="swal-phone" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="0901234567">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Email (*)</label>
                    <input id="swal-email" type="email" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="email@nhathuoc.com">
                </div>
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Mật khẩu (*)</label>
                <input id="swal-pass" type="password" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="Nhập ít nhất 6 ký tự">
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
      width: "600px",
      preConfirm: () => {
        const employeeCode = document.getElementById("swal-code").value;
        const fullName = document.getElementById("swal-name").value;
        const phoneNumber = document.getElementById("swal-phone").value;
        const email = document.getElementById("swal-email").value;
        const password = document.getElementById("swal-pass").value;
        const role = document.getElementById("swal-role").value;

        if (!employeeCode || !fullName || !email || !password || !phoneNumber) {
          Swal.showValidationMessage(
            "Vui lòng nhập đầy đủ các trường bắt buộc (*)",
          );
        }
        return { employeeCode, fullName, phoneNumber, email, password, role };
      },
    });

    if (formValues) {
      try {
        await axiosClient.post("/auth/users", formValues);
        Swal.fire("Thành công", "Đã tạo tài khoản nhân viên mới!", "success");
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

  const handleEditEmployee = async (employee) => {
    const { value: formValues } = await Swal.fire({
      title:
        '<h3 class="text-xl font-bold text-teal-700 mb-4"><i class="fa-solid fa-pen-to-square mr-2"></i> CẬP NHẬT THÔNG TIN</h3>',
      html: `
        <div class="flex flex-col gap-4 text-left">
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Họ tên</label>
                <input id="swal-edit-name" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" value="${employee.fullName || ""}">
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Số điện thoại</label>
                    <input id="swal-edit-phone" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" value="${employee.phoneNumber || ""}">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Giới tính</label>
                    <select id="swal-edit-gender" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white">
                        <option value="nam" ${employee.gender === "nam" ? "selected" : ""}>Nam</option>
                        <option value="nữ" ${employee.gender === "nữ" ? "selected" : ""}>Nữ</option>
                        <option value="khác" ${employee.gender === "khác" ? "selected" : ""}>Khác</option>
                    </select>
                </div>
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Địa chỉ</label>
                <input id="swal-edit-address" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" value="${employee.address || ""}">
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Ngày sinh</label>
                <input id="swal-edit-dob" type="date" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" value="${employee.dob || ""}">
            </div>
        </div>
      `,
      focusConfirm: false,
      showCancelButton: true,
      confirmButtonColor: "#0d9488",
      confirmButtonText: "Lưu thay đổi",
      cancelButtonText: "Hủy",
      preConfirm: () => {
        return {
          fullName: document.getElementById("swal-edit-name").value,
          phoneNumber: document.getElementById("swal-edit-phone").value,
          gender: document.getElementById("swal-edit-gender").value,
          address: document.getElementById("swal-edit-address").value,
          dob: document.getElementById("swal-edit-dob").value || null,
        };
      },
    });

    if (formValues) {
      try {
        await axiosClient.put(`/auth/users/${employee.id}`, formValues);
        Swal.fire("Đã lưu", "Thông tin nhân viên đã được cập nhật!", "success");
        fetchEmployees();
      } catch (err) {
        Swal.fire("Lỗi", "Không thể cập nhật", "error");
      }
    }
  };

  const handleChangeRole = async (id, newRole) => {
    try {
      await axiosClient.put(`/auth/users/${id}`, { role: newRole });
      Swal.fire({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 2000,
        icon: "success",
        title: `Đã cập nhật vai trò: ${newRole}`,
      });
      fetchEmployees();
    } catch (err) {
      Swal.fire("Lỗi", "Cập nhật vai trò thất bại", "error");
    }
  };

  const handleToggleLock = async (employee) => {
    if (employee.role === "admin")
      return Swal.fire("Lỗi", "Không thể khóa tài khoản Admin!", "error");

    const action = employee.isLocked ? "Mở khóa" : "Khóa";
    const result = await Swal.fire({
      title: `Xác nhận ${action}?`,
      text: `Bạn có chắc chắn muốn ${action} nhân viên này?`,
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: employee.isLocked ? "#0d9488" : "#ef4444",
      confirmButtonText: "Xác nhận",
      cancelButtonText: "Hủy",
    });

    if (result.isConfirmed) {
      try {
        await axiosClient.patch(`/auth/users/lock/${employee.id}`);
        Swal.fire(
          "Thành công",
          `Đã ${action} tài khoản thành công!`,
          "success",
        );
        fetchEmployees();
      } catch (err) {
        Swal.fire("Lỗi", "Thao tác thất bại", "error");
      }
    }
  };

  const handleDeleteEmployee = async (employee) => {
    if (employee.role === "admin") {
      return Swal.fire("Lỗi", "Không được phép xóa Admin!", "error");
    }
    const result = await Swal.fire({
      title: "Bạn có chắc chắn?",
      text: `Dữ liệu nhân viên ${employee.fullName} sẽ bị xóa vĩnh viễn!`,
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#ef4444",
      cancelButtonColor: "#6b7280",
      confirmButtonText: "Vâng, xóa nó!",
      cancelButtonText: "Hủy",
    });

    if (result.isConfirmed) {
      try {
        await axiosClient.delete(`/auth/users/${employee.id}`);
        Swal.fire("Đã xóa!", "Tài khoản nhân viên đã được xóa.", "success");
        fetchEmployees();
      } catch (err) {
        Swal.fire("Lỗi", "Không thể xóa nhân viên này", "error");
      }
    }
  };

  if (loading)
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-teal-600"></div>
        <span className="ml-2 text-teal-600 font-medium">
          Đang tải dữ liệu...
        </span>
      </div>
    );

  return (
    <>
      <Topbar title="Tổng quan" subtitle="Chào mừng trở lại, Admin" />

      <div className="p-6 bg-gray-50 min-h-screen animate-fade-in">
        <div className="flex flex-col sm:flex-row justify-between items-center mb-6 gap-4">
          <h2 className="text-2xl font-bold text-gray-800 flex items-center gap-2">
            <i className="fa-solid fa-user-nurse text-teal-600"></i> Quản Lý
            Nhân Sự
          </h2>
          <button
            onClick={handleCreateEmployee}
            className="bg-teal-600 hover:bg-teal-700 text-white px-4 py-2.5 rounded-lg shadow-sm font-medium transition-colors flex items-center gap-2"
          >
            <i className="fa-solid fa-plus"></i>
            Thêm Nhân Viên
          </button>
        </div>

        <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-100 text-gray-600 text-sm uppercase tracking-wider">
                  <th className="px-6 py-4 font-semibold">Nhân viên</th>
                  <th className="px-6 py-4 font-semibold">Liên hệ</th>
                  <th className="px-6 py-4 font-semibold">Phân quyền</th>
                  <th className="px-6 py-4 font-semibold text-center">
                    Trạng thái
                  </th>
                  <th className="px-6 py-4 font-semibold text-right">
                    Thao tác
                  </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {employees.length === 0 ? (
                  <tr>
                    <td
                      colSpan="5"
                      className="px-6 py-12 text-center text-gray-500"
                    >
                      <i className="fa-regular fa-folder-open text-4xl mb-3 block text-gray-300"></i>
                      Chưa có nhân viên nào trên hệ thống!
                    </td>
                  </tr>
                ) : (
                  employees.map((u) => (
                    <tr
                      key={u.id}
                      className={`hover:bg-gray-50 transition-colors ${u.isLocked ? "bg-red-50/30" : ""}`}
                    >
                      <td className="px-6 py-4">
                        <div className="flex items-center gap-3">
                          <img
                            src={
                              u.avatarUrl && !u.avatarUrl.includes("default")
                                ? u.avatarUrl
                                : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                            }
                            alt="avt"
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
                      <td className="px-6 py-4">
                        <div className="text-sm text-gray-700 flex items-center gap-2 mb-1">
                          <i className="fa-solid fa-envelope text-gray-400 w-4"></i>{" "}
                          {u.email}
                        </div>
                        <div className="text-sm text-gray-600 flex items-center gap-2">
                          <i className="fa-solid fa-phone text-gray-400 w-4"></i>{" "}
                          {u.phoneNumber}
                        </div>
                      </td>
                      <td className="px-6 py-4">
                        <select
                          value={u.role}
                          onChange={(e) =>
                            handleChangeRole(u.id, e.target.value)
                          }
                          disabled={u.role === "admin"}
                          className={`text-sm rounded-full px-3 py-1 border font-medium focus:outline-none appearance-none cursor-pointer pr-8 bg-no-repeat bg-right disabled:opacity-70 disabled:cursor-not-allowed
                          ${u.role === "admin" ? "bg-purple-100 text-purple-700 border-purple-200" : "bg-blue-100 text-blue-700 border-blue-200"}`}
                          style={{
                            backgroundImage: `url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e")`,
                            backgroundPosition: `right 0.2rem center`,
                            backgroundSize: `1.5em 1.5em`,
                          }}
                        >
                          <option value="employee">Nhân viên</option>
                          <option value="admin">Admin</option>
                        </select>
                      </td>
                      <td className="px-6 py-4 text-center">
                        <span
                          className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium border
                        ${u.isLocked ? "bg-red-50 text-red-600 border-red-200" : "bg-green-50 text-green-600 border-green-200"}`}
                        >
                          {u.isLocked ? (
                            <>
                              <i className="fa-solid fa-ban"></i> Bị khóa
                            </>
                          ) : (
                            <>
                              <i className="fa-solid fa-circle-check"></i> Hoạt
                              động
                            </>
                          )}
                        </span>
                      </td>
                      <td className="px-6 py-4">
                        <div className="flex items-center justify-end gap-2">
                          <button
                            onClick={() => handleEditEmployee(u)}
                            className="p-2 text-blue-600 hover:bg-blue-50 rounded-lg transition-colors"
                            title="Sửa thông tin"
                          >
                            <i className="fa-solid fa-pen-to-square"></i>
                          </button>
                          <button
                            onClick={() => handleToggleLock(u)}
                            disabled={u.role === "admin"}
                            className={`p-2 rounded-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed
                            ${u.isLocked ? "text-green-600 hover:bg-green-50" : "text-orange-500 hover:bg-orange-50"}`}
                            title={
                              u.isLocked
                                ? "Mở khóa tài khoản"
                                : "Khóa tài khoản"
                            }
                          >
                            {u.isLocked ? (
                              <i className="fa-solid fa-lock-open"></i>
                            ) : (
                              <i className="fa-solid fa-lock"></i>
                            )}
                          </button>
                          <button
                            onClick={() => handleDeleteEmployee(u)}
                            disabled={u.role === "admin"}
                            className="p-2 text-red-600 hover:bg-red-50 rounded-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                            title="Xóa vĩnh viễn"
                          >
                            <i className="fa-solid fa-trash-can"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </>
  );
}
