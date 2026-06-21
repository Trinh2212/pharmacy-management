import { useNavigate, Link } from "react-router-dom";
import { MdLock } from "react-icons/md";
import { FaUserAstronaut } from "react-icons/fa";
import { TbLockOpenOff, TbLockOpen } from "react-icons/tb";
import { useAuth } from "../contexts/AuthContext";
import axiosClient from "../api/axiosClient";
import { useState } from "react";

export default function Login() {
  const navigate = useNavigate();
  const { login } = useAuth();
  const [formData, setFormData] = useState({
    username: "",
    password: "",
  });
  const [errorMsg, setErrorMsg] = useState("");
  const [showPassword, setShowPassword] = useState(false);

  const handleInputChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };
  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      console.log(formData);

      const response = await axiosClient.post("/auth/login", formData);

      const { accessToken, user } = response.data;
      localStorage.setItem("user", JSON.stringify(user));

      localStorage.setItem("accessToken", accessToken);

      login(user);

      navigate("/admin");
    } catch (error) {
      setErrorMsg(error.response?.data?.message || "Lỗi kết nối đến máy chủ");
    }
  };

  return (
    <div className="relative min-h-screen flex items-center justify-center overflow-hidden bg-slate-50">
      <div className="absolute inset-0 bg-sky-950/50">
        <img
          src="/img/loginbg.jpg"
          alt="Pharmacy"
          className="h-full w-full object-cover blur-sm opacity-90"
        />

        <div className="absolute inset-0 bg-black/40" />
      </div>

      <div className="relative z-10 w-full max-w-md px-6">
        <form
          onSubmit={handleLogin}
          className="rounded-3xl bg-white/90 backdrop-blur-md p-6 shadow-2xl"
        >
          {/* Logo */}
          <div className="mb-8 flex flex-col items-center">
            <div
              className="flex h-16 w-16 items-center justify-center rounded-2xl bg-white shadow-lg overflow-hidden"
              onClick={() => navigate("/")}
            >
              <img
                src="/img/logo.png"
                alt="Logo Nhà Thuốc"
                className="h-full w-full object-cover"
              />
            </div>

            <h1 className="mt-4 text-2xl font-bold text-slate-800">
              CareMind Pharma
            </h1>

            <p className="mt-2 text-sm text-slate-500">Đăng nhập để tiếp tục</p>
          </div>

          <div className="mb-4">
            <label className="mb-2 block text-sm font-medium text-slate-700">
              Username
            </label>

            <div className="relative">
              <FaUserAstronaut
                size={20}
                className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400"
              />

              <input
                type="text"
                name="username"
                value={formData.username}
                onChange={handleInputChange}
                placeholder="mã NV, số điện thoại hoặc email"
                className="w-full rounded-xl border border-slate-200 bg-slate-50 py-3 pl-12 pr-4 outline-none transition focus:border-sky-500 focus:ring-2 focus:ring-sky-200"
              />
            </div>
          </div>

          <div>
            <label className="mb-2 block text-sm font-medium text-slate-700">
              Mật khẩu
            </label>

            <div className="relative">
              <MdLock
                size={20}
                className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400"
              />

              <input
                type={showPassword ? "text" : "password"}
                name="password"
                value={formData.password}
                onChange={handleInputChange}
                placeholder="Nhập mật khẩu..."
                className="w-full rounded-xl border border-slate-200 bg-slate-50 py-3 pl-12 pr-4 outline-none transition focus:border-sky-500 focus:ring-2 focus:ring-sky-200"
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute right-4 top-1/2 -translate-y-1/2 text-sm text-slate-500"
              >
                {showPassword ? (
                  <TbLockOpenOff size={20} />
                ) : (
                  <TbLockOpen size={20} />
                )}
              </button>
            </div>
          </div>

          <button
            type="submit"
            className="mt-6 w-full rounded-xl bg-gradient-to-r from-sky-600 to-cyan-600 py-3.5 font-semibold text-white shadow-lg transition hover:opacity-95"
          >
            Đăng nhập
          </button>

          {errorMsg && (
            <p className="mt-3 text-center text-sm text-red-500">{errorMsg}</p>
          )}

          <p className="mt-3 text-center text-sm text-slate-500">
            Trang này chỉ dành riêng cho nhân viên nhà thuốc của chúng tôi
          </p>
        </form>
      </div>
    </div>
  );
}
