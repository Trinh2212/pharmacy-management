import { useState, useEffect } from "react";

export default function UpdateProfileDialog({
  isOpen,
  onClose,
  initialData,
  isAdmin,
  onSubmit,
}) {
  const [formData, setFormData] = useState({
    fullName: "",
    phoneNumber: "",
    email: "",
    password: "",
    gender: "khác",
    address: "",
    dob: "",
    role: "employee",
    hireDate: "",
  });

  useEffect(() => {
    if (initialData && isOpen) {
      setFormData({
        fullName: initialData.fullName || "",
        phoneNumber: initialData.phoneNumber || "",
        email: initialData.email || "",
        password: "",
        gender: initialData.gender || "khác",
        address: initialData.address || "",
        role: initialData.role || "employee",
        dob: initialData.dob ? initialData.dob.split("T")[0] : "",
        hireDate: initialData.hireDate
          ? initialData.hireDate.split("T")[0]
          : "",
      });
    }
  }, [initialData, isOpen]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Chỉ gửi password khi là admin và có nhập (để trống/không phải admin = giữ nguyên mật khẩu cũ)
    const { password, ...rest } = formData;
    const dataToSubmit =
      isAdmin && password.trim() !== "" ? { ...rest, password } : rest;
    onSubmit(dataToSubmit);
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 px-4 transition-opacity duration-300">
      <div className="bg-white rounded-lg shadow-xl w-full max-w-2xl overflow-hidden flex flex-col max-h-[90vh] scale-95 animate-modal-in">
        {/* Header */}
        <div className="px-6 py-4 border-b border-gray-200">
          <h3 className="text-xl font-bold text-black">CẬP NHẬT THÔNG TIN</h3>
        </div>

        {/* ND */}
        <div className="px-6 py-4 overflow-y-auto">
          <form
            id="update-profile-form"
            onSubmit={handleSubmit}
            className="grid grid-cols-2 gap-4 text-left"
          >
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Họ tên
              </label>
              <input
                name="fullName"
                value={formData.fullName}
                onChange={handleChange}
                required
                className="w-full px-3 py-2 border border-gray-300 rounded-md"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Số điện thoại
              </label>
              <input
                name="phoneNumber"
                value={formData.phoneNumber}
                onChange={handleChange}
                required
                className="w-full px-3 py-2 border border-gray-300 rounded-md"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Email
              </label>
              <input
                type="email"
                name="email"
                value={formData.email}
                onChange={handleChange}
                required
                className="w-full px-3 py-2 border border-gray-300 rounded-md"
              />
            </div>
            {isAdmin && (
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Mật khẩu mới
                </label>
                <input
                  type="password"
                  name="password"
                  value={formData.password}
                  onChange={handleChange}
                  placeholder="Để trống nếu không đổi mật khẩu"
                  autoComplete="new-password"
                  className="w-full px-3 py-2 border border-gray-300 rounded-md"
                />
              </div>
            )}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Giới tính
              </label>
              <select
                name="gender"
                value={formData.gender}
                onChange={handleChange}
                className="w-full px-3 py-2 border border-gray-300 rounded-md bg-white"
              >
                <option value="nam">Nam</option>
                <option value="nữ">Nữ</option>
                <option value="khác">Khác</option>
              </select>
            </div>
            <div className="col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Địa chỉ
              </label>
              <input
                name="address"
                value={formData.address}
                onChange={handleChange}
                className="w-full px-3 py-2 border border-gray-300 rounded-md"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Ngày sinh
              </label>
              <input
                type="date"
                name="dob"
                value={formData.dob}
                onChange={handleChange}
                className="w-full px-3 py-2 border border-gray-300 rounded-md"
              />
            </div>
            {isAdmin && (
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Ngày vào làm
                </label>
                <input
                  type="date"
                  name="hireDate"
                  value={formData.hireDate}
                  onChange={handleChange}
                  className="w-full px-3 py-2 border border-gray-300 rounded-md"
                />
              </div>
            )}
            {isAdmin && (
              <div className="col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Vai trò
                </label>
                <select
                  name="role"
                  value={formData.role}
                  onChange={handleChange}
                  className="w-full px-3 py-2 border border-gray-300 rounded-md bg-white"
                >
                  <option value="employee">Nhân viên</option>
                  <option value="admin">Quản trị viên</option>
                </select>
              </div>
            )}
          </form>
        </div>

        <div className="px-6 py-4 border-t border-gray-200 flex justify-end items-center bg-gray-50">
          <div className="flex gap-3">
            <button
              type="button"
              onClick={onClose}
              className="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-md hover:bg-gray-50"
            >
              Hủy
            </button>
            <button
              type="submit"
              form="update-profile-form"
              className="px-4 py-2 text-white bg-blue-600 rounded-md hover:bg-blue-700"
            >
              Lưu thay đổi
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}