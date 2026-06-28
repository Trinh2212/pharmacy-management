import { useState, useEffect } from "react";
import axiosClient from "../../api/axiosClient";
import Swal from "sweetalert2";
import { FiUser, FiLock, FiCamera } from "react-icons/fi";
import { IMAGE_URL } from "../../utils/constants";
import { useAuth } from "../../contexts/AuthContext";


export default function Profile() {
  const { user, updateUser } = useAuth();
  const [activeTab, setActiveTab] = useState("info");
  const [loading, setLoading] = useState(true);
  const [profileData, setProfileData] = useState({
    fullname: "",
    phone: "",
    email: "",
    cccd: "",
  });
  const [avatarPreview, setAvatarPreview] = useState(null);
  const [avatarFile, setAvatarFile] = useState(null);
  const [passwords, setPasswords] = useState({
    oldPassword: "",
    newPassword: "",
    confirmPassword: "",
  });

  useEffect(() => {
    fetchProfile();
  }, []);

  const fetchProfile = async () => {
    try {
      const res = await axiosClient.get("/users/profile");
      setProfileData({
        fullname: res.data.fullname || "",
        phone: res.data.phone || "",
        email: res.data.email || "",
        cccd: res.data.cccd || "",
      });
      if (res.data.avatar && !res.data.avatar.includes("default")) {
        setAvatarPreview(res.data.avatar);
      }
      setLoading(false);
    } catch (error) {
      console.error("Lỗi lấy profile:", error);
      setLoading(false);
    }
  };

  const handleFileChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      setAvatarFile(file);
      setAvatarPreview(URL.createObjectURL(file));
    }
  };

  const handleUpdateProfile = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append("fullname", profileData.fullname);
    formData.append("phone", profileData.phone);
    formData.append("cccd", profileData.cccd);
    if (avatarFile) formData.append("avatar", avatarFile);
    try {
      const res = await axiosClient.put("/users/profile", formData, {
        headers: { "Content-Type": "multipart/form-data" },
      });
      updateUser(res.data.user || res.data);
      Swal.fire("Thành công!", "Cập nhật hồ sơ thành công.", "success");
    } catch (error) {
      Swal.fire("Lỗi", error.response?.data || "Có lỗi xảy ra", "error");
    }
  };

  const handleChangePassword = async (e) => {
    e.preventDefault();
    if (passwords.newPassword !== passwords.confirmPassword) {
      return Swal.fire("Lỗi", "Mật khẩu xác nhận không khớp!", "error");
    }
    try {
      await axiosClient.put("/users/change-password", {
        oldPassword: passwords.oldPassword,
        newPassword: passwords.newPassword,
      });
      Swal.fire("Thành công!", "Đổi mật khẩu thành công.", "success");
      setPasswords({ oldPassword: "", newPassword: "", confirmPassword: "" });
    } catch (error) {
      Swal.fire(
        "Thất bại",
        error.response?.data || "Sai mật khẩu cũ!",
        "error",
      );
    }
  };

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-[60vh]">
        <h2 className="text-xl font-semibold text-gray-600 animate-pulse">
          Đang tải hồ sơ...
        </h2>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50 py-10 px-4 flex justify-center">
      <div className="max-w-4xl w-full bg-white rounded-xl shadow-lg border border-gray-100 flex flex-col md:flex-row overflow-hidden h-fit">
        {/* Sidebar */}
        <div className="w-full md:w-1/3 bg-gray-50 border-b md:border-b-0 md:border-r border-gray-200 p-6 flex flex-col items-center">
          <div className="flex flex-col items-center w-full mb-6">
            <div className="relative w-32 h-32 mb-4 group">
              <img
                src={
                  avatarPreview
                    ? avatarPreview.startsWith("blob")
                      ? avatarPreview
                      : `${IMAGE_URL}${avatarPreview}`
                    : "https://via.placeholder.com/150"
                }
                alt="Avatar"
                className="w-full h-full rounded-full object-cover border-4 border-white shadow-md"
              />
              <label
                htmlFor="avatar-upload"
                className="absolute bottom-1 right-1 bg-blue-600 text-white p-2 rounded-full cursor-pointer hover:bg-blue-700 transition shadow-sm"
                title="Thay đổi ảnh đại diện"
              >
                <FiCamera size={18} />
              </label>
              <input
                type="file"
                id="avatar-upload"
                className="hidden"
                accept="image/*"
                onChange={handleFileChange}
              />
            </div>
            <h3 className="text-xl font-bold text-gray-800 text-center line-clamp-1">
              {profileData.fullname || "Người dùng"}
            </h3>
            <p className="text-sm text-gray-500 mt-1 line-clamp-1">
              {profileData.email}
            </p>
          </div>

          <ul className="w-full space-y-2">
            <li
              className={`flex items-center gap-3 p-3 rounded-lg cursor-pointer transition-colors duration-200 ${
                activeTab === "info"
                  ? "bg-blue-100 text-blue-700 font-semibold"
                  : "text-gray-600 hover:bg-gray-100 hover:text-gray-900"
              }`}
              onClick={() => setActiveTab("info")}
            >
              <FiUser size={20} /> <span>Thông tin cá nhân</span>
            </li>
            <li
              className={`flex items-center gap-3 p-3 rounded-lg cursor-pointer transition-colors duration-200 ${
                activeTab === "password"
                  ? "bg-blue-100 text-blue-700 font-semibold"
                  : "text-gray-600 hover:bg-gray-100 hover:text-gray-900"
              }`}
              onClick={() => setActiveTab("password")}
            >
              <FiLock size={20} /> <span>Đổi mật khẩu</span>
            </li>
          </ul>
        </div>

        {/* Content */}
        <div className="w-full md:w-2/3 p-6 md:p-8 bg-white">
          {activeTab === "info" ? (
            <div className="animate-[fadeIn_0.3s_ease-in-out]">
              <h2 className="text-2xl font-bold text-gray-800 mb-6 pb-3 border-b border-gray-100">
                Thông Tin Hồ Sơ
              </h2>
              <form onSubmit={handleUpdateProfile} className="space-y-5">
                <div className="flex flex-col gap-1.5">
                  <label className="text-sm font-medium text-gray-700">
                    Email (Cố định)
                  </label>
                  <input
                    type="email"
                    value={profileData.email}
                    disabled
                    className="px-4 py-2.5 bg-gray-100 border border-gray-200 rounded-lg text-gray-500 cursor-not-allowed focus:outline-none"
                  />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-sm font-medium text-gray-700">
                    Họ và Tên
                  </label>
                  <input
                    type="text"
                    value={profileData.fullname}
                    onChange={(e) =>
                      setProfileData({
                        ...profileData,
                        fullname: e.target.value,
                      })
                    }
                    required
                    className="px-4 py-2.5 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                  />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-sm font-medium text-gray-700">
                    Số điện thoại
                  </label>
                  <input
                    type="tel"
                    value={profileData.phone}
                    onChange={(e) =>
                      setProfileData({ ...profileData, phone: e.target.value })
                    }
                    required
                    className="px-4 py-2.5 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                  />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-sm font-medium text-gray-700">
                    CCCD
                  </label>
                  <input
                    type="text"
                    value={profileData.cccd}
                    onChange={(e) =>
                      setProfileData({ ...profileData, cccd: e.target.value })
                    }
                    className="px-4 py-2.5 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                  />
                </div>
                <button
                  type="submit"
                  className="w-full mt-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2.5 px-4 rounded-lg transition duration-200 shadow-sm"
                >
                  LƯU THAY ĐỔI
                </button>
              </form>
            </div>
          ) : (
            <div className="animate-[fadeIn_0.3s_ease-in-out]">
              <h2 className="text-2xl font-bold text-gray-800 mb-6 pb-3 border-b border-gray-100">
                Đổi Mật Khẩu
              </h2>
              <form onSubmit={handleChangePassword} className="space-y-5">
                <div className="flex flex-col gap-1.5">
                  <label className="text-sm font-medium text-gray-700">
                    Mật khẩu cũ
                  </label>
                  <input
                    type="password"
                    value={passwords.oldPassword}
                    onChange={(e) =>
                      setPasswords({
                        ...passwords,
                        oldPassword: e.target.value,
                      })
                    }
                    required
                    className="px-4 py-2.5 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                  />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-sm font-medium text-gray-700">
                    Mật khẩu mới
                  </label>
                  <input
                    type="password"
                    value={passwords.newPassword}
                    onChange={(e) =>
                      setPasswords({
                        ...passwords,
                        newPassword: e.target.value,
                      })
                    }
                    required
                    className="px-4 py-2.5 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                  />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-sm font-medium text-gray-700">
                    Xác nhận mật khẩu
                  </label>
                  <input
                    type="password"
                    value={passwords.confirmPassword}
                    onChange={(e) =>
                      setPasswords({
                        ...passwords,
                        confirmPassword: e.target.value,
                      })
                    }
                    required
                    className="px-4 py-2.5 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                  />
                </div>
                <button
                  type="submit"
                  className="w-full mt-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2.5 px-4 rounded-lg transition duration-200 shadow-sm"
                >
                  CẬP NHẬT
                </button>
              </form>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
