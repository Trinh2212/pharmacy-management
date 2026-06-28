import Swal from "sweetalert2";
import axiosClient from "../api/axiosClient"; 

export const ChangePassPopup = async (apiUrl, requireOldPass = true) => {
  const htmlContent = requireOldPass
    ? `
      <div class="flex flex-col gap-4 text-left px-2 mt-2">
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Mật khẩu cũ</label>
          <input id="swal-old-password" type="password" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="Nhập mật khẩu hiện tại">
        </div>
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Mật khẩu mới</label>
          <input id="swal-new-password" type="password" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="Ít nhất 8 ký tự">
        </div>
      </div>
    `
    : `
      <div class="flex flex-col gap-4 text-left px-2 mt-2">
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Mật khẩu mới (Cấp lại)</label>
          <input id="swal-new-password" type="password" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500" placeholder="Ít nhất 8 ký tự">
        </div>
      </div>
    `;

  const { value: formValues } = await Swal.fire({
    title: '<h3 class="text-xl font-bold text-teal-700">ĐỔI MẬT KHẨU</h3>',
    html: htmlContent,
    focusConfirm: false,
    showCancelButton: true,
    confirmButtonColor: "#2e39ad",
    confirmButtonText: "Lưu mật khẩu",
    cancelButtonText: "Hủy",
    preConfirm: () => {
      const newPassword = document.getElementById("swal-new-password").value;
      let oldPassword = null;

      if (requireOldPass) {
        oldPassword = document.getElementById("swal-old-password").value;
        if (!oldPassword) {
          Swal.showValidationMessage("Vui lòng nhập mật khẩu cũ!");
          return false;
        }
      }

      if (!newPassword || newPassword.length < 8) {
        Swal.showValidationMessage("Mật khẩu mới phải có ít nhất 8 ký tự!");
        return false;
      }

      return requireOldPass
        ? { oldPassword: oldPassword, password: newPassword }
        : { password: newPassword };
    },
  });

  if (formValues) {
    try {
      await axiosClient.put(apiUrl, formValues);

      Swal.fire({
        icon: "success",
        title: "Thành công!",
        text: "Mật khẩu đã được cập nhật.",
        timer: 1500,
        showConfirmButton: false,
      });
    } catch (error) {
      Swal.fire(
        "Lỗi",
        error.response?.data?.message || "Không thể đổi mật khẩu",
        "error",
      );
    }
  }
};
