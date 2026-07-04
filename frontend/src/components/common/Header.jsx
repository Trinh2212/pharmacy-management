import { useState, useEffect } from "react";
import { Link, useNavigate, useSearchParams } from "react-router-dom";
import { FaSearch, FaUser, FaBars, FaHandHoldingHeart, FaHandsHelping, FaBriefcaseMedical, FaShieldAlt } from "react-icons/fa";
import { useAuth } from "../../contexts/AuthContext";

function DesktopHeader() {
  const navigate = useNavigate();
  const { user } = useAuth();
  const [searchParams] = useSearchParams();
  const [text, setText] = useState(searchParams.get("search") || "");

  useEffect(() => {
    setText(searchParams.get("search") || "");
  }, [searchParams]);

  const handleSearch = (e) => {
    e.preventDefault();
    if (!text.trim()) {
      navigate(`/medicines`);
      return;
    }
    navigate(`/medicines?search=${encodeURIComponent(text.trim())}`);
  };
  return (
    <div className="hidden md:block">
      {/* MAIN BAR */}
      <div className="mx-auto max-w-7xl px-4 py-3.5 flex items-center gap-4">
        {/* Logo */}
        <Link to="/" className="flex items-center gap-2 shrink-0">
          <div className="h-10 w-10 overflow-hidden rounded-xl shadow-md bg-white p-0.5 border border-slate-100">
            <img
              src="img/logo.png"
              alt="CareMind Pharma"
              className="h-full w-full object-contain"
            />
          </div>
          <div className="leading-tight hidden sm:block">
            <div className="font-extrabold text-slate-900 text-2xl">
              CareMind Pharma
            </div>
            <div className="text-[10px] text-slate-500 uppercase font-medium">
              Nhà thuốc tận tâm
            </div>
          </div>
        </Link>

        {/* Search */}
        <form onSubmit={handleSearch} className="flex-1 flex">
          <div className="w-full flex items-center bg-slate-100 rounded-full pl-5 pr-1.5 py-1.5 focus-within:ring-2 focus-within:ring-blue-500 transition border border-transparent focus-within:bg-white focus-within:border-blue-500">
            <FaSearch className="h-4 w-4 text-slate-500" />
            <input
              type="text"
              placeholder="Tìm kiếm theo tên thuốc..."
              value={text}
              onChange={(e) => setText(e.target.value)}
              className="flex-1 bg-transparent px-3 py-1.5 text-md outline-none text-slate-900 placeholder-slate-500"
            />
            <button
              type="submit"
              className="btn-gradient w-auto px-4 py-1.5 rounded-full text-sm whitespace-nowrap"
            >
              Tìm kiếm
            </button>
          </div>
        </form>

        {/* User */}
        <div className="flex items-center gap-2">
          {user ? (
            <Link
              to="/admin/profile"
              className="flex items-center gap-2 px-3 py-2 rounded-full text-md font-medium text-slate-900 hover:bg-blue-50 transition-colors"
            >
              <div className="h-8 w-8 rounded-full bg-gradient-to-r from-blue-600 to-cyan-500 flex items-center justify-center text-white shrink-0">
                <FaUser className="h-4 w-4" />
              </div>
              <span className="max-w-[120px] truncate">
                {user.fullName || "Ẩn danh"}
              </span>
            </Link>
          ) : (
            <Link
              to="/login"
              className="group flex items-center gap-2 px-3 py-2 rounded-full text-md font-medium text-slate-900 bg-transparent transition-colors duration-200 ease-in-out hover:bg-gradient-to-r hover:from-blue-600 hover:to-cyan-500 hover:text-white hover:shadow-lg hover:shadow-blue-600/20"
            >
              <FaUser className="h-4 w-4 text-slate-700 transition-colors group-hover:text-white" />
              <span>Đăng nhập</span>
            </Link>
          )}
        </div>
      </div>

      {/* thanh NAV */}
      <nav>
        <div className="mx-auto max-w-7xl px-4 py-2 flex justify-center gap-2 text-lg">
          {[
            { to: "/", label: "Trang chủ" },
            { to: "/medicines", label: "Thuốc" },
            { to: "/ingredients", label: "Hoạt chất" },
            { to: "/about", label: "Giới thiệu" },
            { to: "/contact", label: "Liên hệ" },
          ].map((i) => (
            <Link
              key={i.to}
              to={i.to}
              className="px-3.5 py-1.5 rounded-full bg-transparent text-slate-900 whitespace-nowrap font-medium transition-colors duration-200 ease-in-out hover:bg-gradient-to-r hover:from-blue-600 hover:to-cyan-500 hover:text-white hover:shadow-lg hover:shadow-blue-600/20"
            >
              {i.label}
            </Link>
          ))}
        </div>
      </nav>
    </div>
  );
}

function MobileHeader() {
  const [openMenu, setOpenMenu] = useState(false);
  const [searchParams] = useSearchParams();
  const { user } = useAuth();

  const [text, setText] = useState(searchParams.get("search") || "");
  const navigate = useNavigate();

  useEffect(() => {
    setText(searchParams.get("search") || "");
  }, [searchParams]);

  const handleSearch = (e) => {
    e.preventDefault();
    if (!text.trim()) {
      navigate(`/medicines`);
      return;
    }
    navigate(`/medicines?search=${encodeURIComponent(text.trim())}`);
  };
  return (
    <div className="md:hidden">
      {/* Main Bar */}
      <div className="flex items-center justify-between px-3 py-3 relative">
        <button
          onClick={() => setOpenMenu(!openMenu)}
          className="p-2 rounded-full hover:bg-blue-100 hover:text-blue-700 transition-colors text-slate-900"
        >
          <FaBars className="h-5 w-5" />
        </button>

        {/* logo */}
        <Link
          to="/"
          className="flex items-center gap-2 absolute left-1/2 -translate-x-1/2 w-max"
        >
          <div className="h-9 w-9 overflow-hidden rounded-lg bg-white shadow flex items-center justify-center p-0.5 shrink-0 border border-slate-100">
            <img
              src="img/logo.png"
              alt="logo"
              className="h-full w-full object-contain"
            />
          </div>
          <div className="leading-tight flex flex-col justify-center">
            <div className="font-bold text-slate-900 text-2xl">CareMind </div>
            <div className="text-[9px] text-slate-500 uppercase tracking-wider font-medium">
              Nhà thuốc tận tâm
            </div>
          </div>
        </Link>

        {user ? (
          <Link
            to="/profile"
            className="p-1 rounded-full hover:bg-blue-100 transition-colors text-slate-900"
          >
            <div className="h-8 w-8 rounded-full bg-gradient-to-r from-blue-600 to-cyan-500 flex items-center justify-center text-white">
              <FaUser className="h-4 w-4" />
            </div>
          </Link>
        ) : (
          <Link
            to="/login"
            className="p-2 rounded-full hover:bg-blue-100 hover:text-blue-700 transition-colors text-slate-900"
          >
            <FaUser className="h-5 w-5" />
          </Link>
        )}
      </div>

      {/* thanh search */}
      <form onSubmit={handleSearch} className="px-3 py-2">
        <div className="flex items-center bg-slate-100 rounded-full px-3 py-2 shadow-inner border border-transparent focus-within:bg-white focus-within:border-blue-500 focus-within:ring-2 focus-within:ring-blue-500 transition">
          <FaSearch className="text-slate-500" />
          <input
            type="text"
            placeholder="Tìm theo tên thuốc..."
            value={text}
            onChange={(e) => setText(e.target.value)}
            className="flex-1 px-2 text-sm outline-none bg-transparent text-slate-900 placeholder-slate-500"
          />
          <button type="submit" className="hidden">
            Tìm
          </button>{" "}
        </div>
      </form>

      {/* Dropdown Menu */}
      {openMenu && (
        <div className="bg-white/95 backdrop-blur-md px-4 py-3 space-y-2 text-lg shadow-xl absolute w-full left-0 z-50 border-t border-slate-200">
          {[
            { to: "/", label: "Trang chủ" },
            { to: "/medicines", label: "Thuốc" },
            { to: "/ingredients", label: "Hoạt chất" },
            { to: "/about", label: "Giới thiệu" },
            { to: "/contact", label: "Liên hệ" },
          ].map((i) => (
            <Link
              key={i.to}
              to={i.to}
              onClick={() => setOpenMenu(false)}
              className="block py-2.5 px-4 rounded-xl bg-transparent text-slate-900 font-medium transition-colors duration-200 ease-in-out hover:bg-gradient-to-r hover:from-blue-600 hover:to-cyan-500 hover:text-white hover:shadow-md hover:shadow-blue-600/10 active:scale-[0.99]"
            >
              {i.label}
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}

export default function Header() {
  return (
    <>
      <div className="hidden md:block bg-slate-800 text-white border-b border-white/10 relative z-50">
        <div className="mx-auto max-w-7xl px-4 h-8 flex items-center justify-center text-sm">
          <div className="flex items-center justify-center gap-6 font-semibold uppercase tracking-wide text-base">
            <span className="flex items-center gap-1">
              <FaHandHoldingHeart className="text-yellow-300" />
              <span>Chăm sóc tận tâm</span>
            </span>
            <span className="flex items-center gap-1">
              <FaHandsHelping className="text-yellow-300" />
              <span>Tư vấn tận tình</span>
            </span>
            <span className="flex items-center gap-1">
              <FaBriefcaseMedical className="text-yellow-300" />
              <span>Chất lượng đảm bảo</span>
            </span>
            <span className="flex items-center gap-1">
              <FaShieldAlt className="text-yellow-300" />
              <span>An tâm sức khỏe</span>
            </span>
          </div>
        </div>
      </div>

      <header className="sticky top-0 z-40 bg-white/90 backdrop-blur-md rounded-b-xl text-slate-900 shadow-sm border-b border-slate-200 transition-all duration-300">
        <DesktopHeader />
        <MobileHeader />
      </header>
    </>
  );
}
