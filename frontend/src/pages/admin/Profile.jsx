import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { Topbar } from "../../components/admin/topbar";
import axiosClient from "../../api/axiosClient";
import { useAuth } from "../../contexts/AuthContext";
import { alertSuccess, alertError, alertWarning } from "../../utils/SwalAlert";
import { FiCamera, FiLoader, FiUser, FiEdit2, FiLock, FiLogOut } from "react-icons/fi";
import { FaXmark } from "react-icons/fa6";
const DEFAULT_AVATAR = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

function Field({ label, name, value, onChange, type = "text", disabled = false }) {
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
        disabled={disabled}
        className="form-base"
      />
    </div>
  );
}

function SelectField({ label, name, value, onChange }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-800 mb-1">
        {label}
      </label>
      <select
        name={name}
        value={value}
        onChange={onChange}
        className="form-base"
      >
        <option value="nam">Nam</option>
        <option value="nữ">Nữ</option>
        <option value="khác">Khác</option>
      </select>
    </div>
  );
}

function InfoRow({ label, value }) {
  return (
    <div>
      <p className="text-xs text-gray-400 mb-0.5">{label}</p>
      <p className="text-sm font-medium text-gray-800">{value || "chưa có thông tin"}</p>
    </div>
  );
}

function extractEmployee(res) {
  const payload = res?.data !== undefined ? res.data : res;
  return payload?.employee || payload;
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

export default function Profile() {
  const navigate = useNavigate();
  const { logout } = useAuth(); 
  const [employee, setEmployee] = useState(null);
  const [loading, setLoading] = useState(true);
  const [showEditModal, setShowEditModal] = useState(false);
  const [showPasswordModal, setShowPasswordModal] = useState(false);

  const [profileForm, setProfileForm] = useState({
    fullName: "",
    dob: "",
    gender: "khác",
    email: "",
    phoneNumber: "",
    address: "",
  });
  const [avatarFile, setAvatarFile] = useState(null);
  const [avatarPreview, setAvatarPreview] = useState(null);
  const [savingProfile, setSavingProfile] = useState(false);

  const [passwordForm, setPasswordForm] = useState({
    oldPassword: "",
    newPassword: "",
  });
  const [savingPassword, setSavingPassword] = useState(false);

  const syncForm = (data) => {
    setProfileForm({
      fullName: data?.fullName || "",
      dob: data?.dob ? data.dob.split("T")[0] : "",
      gender: data?.gender || "khác",
      email: data?.email || "",
      phoneNumber: data?.phoneNumber || "",
      address: data?.address || "",
    });
  };

  useEffect(() => {
    let active = true;
    setLoading(true);
    axiosClient
      .get("/employees/getProfile")
      .then((res) => {
        if (!active) return;
        const data = extractEmployee(res);
        setEmployee(data);
        syncForm(data);
      })
      .catch(() => {
        if (!active) return;
        alertError("Không thể tải thông tin hồ sơ rồi, có lẽ có sự cố -.-");
      })
      .finally(() => {
        if (active) setLoading(false);
      });
    return () => {
      active = false;
    };
  }, []);

  const handleLogout = () => {
    logout();
    navigate("/login");
  };

  const handleOpenEdit = () => {
    syncForm(employee);
    setAvatarFile(null);
    setAvatarPreview(null);
    setShowEditModal(true);
  };

  const handleAvatarChange = (e) => {
    const file = e.target.files?.[0];
    if (!file) return;
    setAvatarFile(file);
    setAvatarPreview(URL.createObjectURL(file));
  };

  const handleSubmitProfile = async (e) => {
    e.preventDefault();
    setSavingProfile(true);
    try {
      const form = new FormData();
      if (profileForm.fullName) form.append("fullName", profileForm.fullName);
      if (profileForm.dob) form.append("dob", profileForm.dob);
      if (profileForm.gender) form.append("gender", profileForm.gender);
      if (profileForm.email) form.append("email", profileForm.email);
      if (profileForm.phoneNumber)
        form.append("phoneNumber", profileForm.phoneNumber);
      if (profileForm.address) form.append("address", profileForm.address);
      if (avatarFile) form.append("avatar", avatarFile);

      const res = await axiosClient.put("/employees/updateProfile", form, {
        headers: { "Content-Type": "multipart/form-data" },
      });

      const updated = extractEmployee(res) || { ...employee, ...profileForm };
      setEmployee(updated);
      setShowEditModal(false);
      alertSuccess("Hồ sơ đã được cập nhật thành công!");
    } catch (err) {
      alertError(err, "Không thể cập nhật hồ sơ. có lẽ có sự cố rồi -.-");
    } finally {
      setSavingProfile(false);
    }
  };

  const handleSubmitPassword = async (e) => {
    e.preventDefault();
    if (!passwordForm.oldPassword || !passwordForm.newPassword) {
      return alertWarning("Vui lòng điền đủ mật khẩu cũ và mới");
    }
    if (passwordForm.newPassword.length < 8) {
      return alertWarning("Mật khẩu mới tối thiểu 8 ký tự");
    }
    setSavingPassword(true);
    try {
      await axiosClient.put("employees/change-password", {
        oldPassword: passwordForm.oldPassword,
        newPassword: passwordForm.newPassword,
      });
      alertSuccess("mật khẩu mới đã được lưu thành công")
      setPasswordForm({ oldPassword: "", newPassword: "" });
      setShowPasswordModal(false);
    } catch (err) {
      alertError(err, "đổi mật khẩu thất bại rồi -.-");
    } finally {
      setSavingPassword(false);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center gap-2 py-24 text-gray-400">
        <FiLoader className="h-5 w-5 animate-spin" />
        <span className="text-sm">Đang tải hồ sơ nhân viên…</span>
      </div>
    );
  }

  return (
    <>
      <Topbar title="Hồ sơ cá nhân" subtitle="Quản lý thông tin cá nhân" />
      <div className="p-6 grid lg:grid-cols-3 gap-6 max-w-7xl mx-auto">
        {/* avatar */}
        <div className="bg-white border border-gray-100 rounded-2xl p-6 text-center h-fit sticky top-6 shadow-sm">
          <div className="relative h-32 w-32 mx-auto">
            <img
              src={
                employee?.avatarUrl
                  ? employee.avatarUrl.startsWith("/uploads")
                    ? `http://localhost:5000${employee.avatarUrl}`
                    : employee.avatarUrl
                  : DEFAULT_AVATAR
              }
              alt="avatar"
              className="h-32 w-32 rounded-full object-cover border-4 border-white shadow"
            />
          </div>

          <h3 className="mt-4 text-xl font-bold text-gray-900">
            {employee?.fullName || "Chưa có thông tin"}
          </h3>
          <p className="text-sm text-blue-800 font-medium mt-1">
            {employee?.role === "admin" ? "Quản trị viên" : "Nhân viên"}
          </p>
          <p className="text-xs text-gray-400 mt-1">{employee?.employeeCode}</p>

          <div className="mt-6 pt-5 border-t border-gray-100 flex flex-col gap-2">
            <button
              onClick={handleOpenEdit}
              className="btn-gradient w-full flex items-center justify-center gap-2 px-4 py-2.5 text-sm font-medium"
            >
              <FiEdit2 className="h-4 w-4" /> Chỉnh sửa thông tin
            </button>
            <button
              onClick={() => {
                setPasswordForm({ oldPassword: "", newPassword: "" });
                setShowPasswordModal(true);
              }}
              className="btn-light-gradient w-full flex items-center justify-center gap-2 px-4 py-2.5 text-sm font-medium"
            >
              <FiLock className="h-4 w-4" /> Đổi mật khẩu
            </button>
          </div>
        </div>

        {/* info */}
        <div className="lg:col-span-2 space-y-6">
          <div className="bg-white border border-gray-100 rounded-2xl p-6 shadow-sm">
            <div className="flex items-center gap-2 border-b border-gray-100 pb-4 mb-5">
              <FiUser className="h-5 w-5 text-blue-800" />
              <h3 className="font-bold text-lg text-blue-800">
                Thông tin cá nhân
              </h3>
            </div>
            <div className="grid sm:grid-cols-2 gap-5">
              <InfoRow label="Mã nhân viên" value={employee?.employeeCode} />
              <InfoRow label="Họ và tên" value={employee?.fullName} />
              <InfoRow
                label="Ngày sinh"
                value={employee?.dob ? employee.dob.split("T")[0] : null}
              />
              <InfoRow label="Giới tính" value={employee?.gender} />
              <InfoRow label="Số điện thoại" value={employee?.phoneNumber} />
              <InfoRow label="Email" value={employee?.email} />
              <InfoRow
                label="Ngày vào làm"
                value={
                  employee?.hireDate ? employee.hireDate.split("T")[0] : null
                }
              />
              <InfoRow label="Địa chỉ" value={employee?.address} />
            </div>
          </div>

          {/* Nút đăng xuất - canh giữa so với ô thông tin cá nhân */}
          <div className="flex justify-center">
            <button
              onClick={handleLogout}
              className="btn-danger-outline flex items-center gap-2 px-5 py-2.5 text-sm font-medium"
            >
              <FiLogOut className="h-4 w-4" /> Đăng xuất
            </button>
          </div>
        </div>
      </div>
      {/* Modal chỉnh sửa  */}
      {showEditModal && (
        <Modal
          title="CHỈNH SỬA THÔNG TIN"
          onClose={() => setShowEditModal(false)}
        >
          <form onSubmit={handleSubmitProfile}>
            <div className="px-6 py-5 overflow-y-auto flex flex-col gap-4">
              <div className="flex items-center gap-4 pb-2">
                <div className="relative h-16 w-16 shrink-0">
                  <img
                    src={
                      avatarPreview ||
                      (employee?.avatarUrl
                        ? employee.avatarUrl.startsWith("/uploads")
                          ? `http://localhost:5000${employee.avatarUrl}`
                          : employee.avatarUrl
                        : DEFAULT_AVATAR)
                    }
                    alt="avatar"
                    className="h-16 w-16 rounded-full object-cover border-2 border-gray-200"
                  />
                  <label
                    htmlFor="avatar-upload-modal"
                    className="absolute bottom-0 right-0 h-6 w-6 rounded-full bg-teal-600 text-white grid place-items-center cursor-pointer hover:bg-teal-700 transition"
                    title="Đổi ảnh"
                  >
                    <FiCamera className="h-3 w-3" />
                  </label>
                  <input
                    id="avatar-upload-modal"
                    type="file"
                    accept="image/*"
                    onChange={handleAvatarChange}
                    className="hidden"
                  />
                </div>
                <div>
                  <p className="text-sm font-medium text-gray-800">
                    {employee?.fullName}
                  </p>
                  <p className="text-xs text-gray-400">
                    {employee?.employeeCode}
                  </p>
                </div>
              </div>

              <div className="grid grid-cols-2 gap-4">
                <Field
                  label="Họ và tên (*)"
                  name="fullName"
                  value={profileForm.fullName}
                  onChange={(e) =>
                    setProfileForm((p) => ({ ...p, fullName: e.target.value }))
                  }
                />
                <Field
                  label="Số điện thoại (*)"
                  name="phoneNumber"
                  value={profileForm.phoneNumber}
                  onChange={(e) =>
                    setProfileForm((p) => ({
                      ...p,
                      phoneNumber: e.target.value,
                    }))
                  }
                />
              </div>
              <Field
                label="Email (*)"
                type="email"
                name="email"
                value={profileForm.email}
                onChange={(e) =>
                  setProfileForm((p) => ({ ...p, email: e.target.value }))
                }
              />
              <div className="grid grid-cols-2 gap-4">
                <SelectField
                  label="Giới tính"
                  name="gender"
                  value={profileForm.gender}
                  onChange={(e) =>
                    setProfileForm((p) => ({ ...p, gender: e.target.value }))
                  }
                />
                <Field
                  label="Ngày sinh"
                  type="date"
                  name="dob"
                  value={profileForm.dob}
                  onChange={(e) =>
                    setProfileForm((p) => ({ ...p, dob: e.target.value }))
                  }
                />
              </div>
              <Field
                label="Địa chỉ"
                name="address"
                value={profileForm.address}
                onChange={(e) =>
                  setProfileForm((p) => ({ ...p, address: e.target.value }))
                }
              />
            </div>

            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50 flex justify-end gap-3">
              <button
                type="button"
                onClick={() => setShowEditModal(false)}
                className="btn-cancel px-4 py-2 text-sm font-medium"
              >
                Hủy
              </button>
              <button
                type="submit"
                disabled={savingProfile}
                className="btn-gradient px-4 py-2 text-sm font-medium"
              >
                {savingProfile ? "Đang lưu..." : "Lưu thay đổi"}
              </button>
            </div>
          </form>
        </Modal>
      )}
      {/* Modal đổi mật khẩu */}
      {showPasswordModal && (
        <Modal title="ĐỔI MẬT KHẨU" onClose={() => setShowPasswordModal(false)}>
          <form onSubmit={handleSubmitPassword}>
            <div className="px-6 py-5 flex flex-col gap-4">
              <Field
                label="Mật khẩu hiện tại (*)"
                type="password"
                name="oldPassword"
                value={passwordForm.oldPassword}
                onChange={(e) =>
                  setPasswordForm((p) => ({
                    ...p,
                    oldPassword: e.target.value,
                  }))
                }
              />
              <Field
                label="Mật khẩu mới (*) phải tối thiểu 8 ký tự"
                type="password"
                name="newPassword"
                value={passwordForm.newPassword}
                onChange={(e) =>
                  setPasswordForm((p) => ({
                    ...p,
                    newPassword: e.target.value,
                  }))
                }
              />
            </div>

            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50 flex justify-end gap-3">
              <button
                type="button"
                onClick={() => setShowPasswordModal(false)}
                className="btn-cancel px-4 py-2 text-sm font-medium"
              >
                Hủy
              </button>
              <button
                type="submit"
                disabled={savingPassword}
                className="btn-gradient px-4 py-2 text-sm font-medium"
              >
                {savingPassword ? "Đang xử lý..." : "Xác nhận"}
              </button>
            </div>
          </form>
        </Modal>
      )}
    </>
  );
}