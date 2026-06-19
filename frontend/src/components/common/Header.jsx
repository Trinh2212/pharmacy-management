import { useState } from "react";
import { Link } from "react-router-dom";
import { FaSearch, FaUser, FaBars, FaHandHoldingHeart, FaHandsHelping, FaBriefcaseMedical, FaShieldAlt } from "react-icons/fa";

export default function Header() {
  const [openMenu, setOpenMenu] = useState(false);

  return (
    <header className="sticky top-0 z-40 bg-white/90 backdrop-blur-md border-b border-gray-200">
      {/* TOP STRIP */}
      <div className="bg-slate-900 text-white text-sm hidden md:block relative z-50">
        <div className="mx-auto max-w-7xl px-4 h-10 flex items-center justify-center">
          <div className="hidden md:flex items-center justify-center gap-6 font-semibold uppercase tracking-wide">
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

      {/* MOBILE SEARCH */}
      <div className="md:hidden bg-slate-900 px-3 py-2">
        <div className="flex items-center bg-white rounded-full px-3 py-2 border border-gray-200">
          <FaSearch className="text-gray-500" />
          <input
            type="text"
            placeholder="Tìm theo tên thuốc, hoạt chất..."
            className="flex-1 px-2 text-sm outline-none bg-transparent"
          />
        </div>
      </div>

      <div className="md:hidden flex items-center justify-between px-3 py-3 border-b bg-white">
        {/* Left: hamburger */}
        <button
          onClick={() => setOpenMenu(!openMenu)}
          className="p-2 rounded-full hover:bg-gray-100"
        >
          <FaBars className="h-5 w-5" />
        </button>

        {/* logo + name */}
        <Link
          to="/"
          className="flex items-center gap-2 absolute left-1/2 -translate-x-1/2"
        >
          <div className="h-9 w-9 overflow-hidden rounded-lg bg-white shadow">
            <img
              src="img/logo.png"
              alt="logo"
              className="h-full w-full object-contain"
            />
          </div>

          <div className="leading-tight">
            <div className="font-bold text-slate-900 text-lg">CareMind</div>
          </div>
        </Link>

        {/* biểu tượng login (- đăng nhập - tài khoản - avatar) */}
        <Link to="/login" className="p-2 rounded-full hover:bg-gray-100">
          <FaUser className="h-5 w-5" />
        </Link>
      </div>
      {/* MAIN BAR */}
      <div className="hidden md:flex mx-auto max-w-7xl px-4 py-3.5 items-center gap-4">
        {/* Logo */}
        <Link to="/" className="flex items-center gap-2 shrink-0">
          <div className="h-10 w-10 overflow-hidden rounded-xl shadow-md bg-white">
            <img
              src="img/logo.png"
              alt="CareMind Pharma"
              className="h-full w-full object-contain"
            />
          </div>
          <div className="leading-tight hidden sm:block">
            <div className="font-extrabold text-slate-900  text-lg">
              CareMind Pharma
            </div>
            <div className="text-[10px] text-gray-500 uppercase">
              Nhà thuốc tận tâm
            </div>
          </div>
        </Link>

        {/* SEARCH DESKTOP */}
        <div className="flex-1 hidden md:flex">
          <div className="w-full flex items-center bg-gray-100 rounded-full pl-5 pr-1.5 py-1.5 border border-gray-200 focus-within:border-blue-600 transition">
            <FaSearch className="h-4 w-4 text-gray-500" />
            <input
              type="text"
              placeholder="Tìm thuốc, thực phẩm chức năng, dược mỹ phẩm…"
              className="flex-1 bg-transparent px-3 py-1.5 text-sm outline-none"
            />
            <button className="rounded-full bg-blue-600 text-white px-4 py-1.5 text-sm font-medium hover:bg-blue-700">
              Tìm kiếm
            </button>
          </div>
        </div>

        {/* USER + MENU */}
        <div className="flex items-center gap-2">
          <Link
            to="/login"
            className="hidden sm:flex items-center gap-2 px-3 py-2 rounded-full hover:bg-gray-100 text-sm"
          >
            <FaUser className="h-4 w-4" />
            <span>Đăng nhập</span>
          </Link>

          {/* HAMBURGER */}
          <button
            onClick={() => setOpenMenu(!openMenu)}
            className="md:hidden p-2.5 rounded-full hover:bg-gray-100"
          >
            <FaBars className="h-5 w-5" />
          </button>
        </div>
      </div>

      {/* NAV DESKTOP */}
      <nav className="hidden md:block border-t border-gray-200 bg-white">
        <div className="mx-auto max-w-7xl px-4 py-2 grid grid-cols-3 items-center">
          
          <div></div>

          {/* CENTER NAV */}
          <div className="flex justify-center gap-2 text-sm">
            {[
              { to: "/homepage", label: "Trang chủ" },
              { to: "/medicines", label: "Thuốc" },
              { to: "/ingredients", label: "Hoạt chất" },
              { to: "/about", label: "Giới thiệu" },
              { to: "/contact", label: "Liên hệ" },
            ].map((i) => (
              <Link
                key={i.to}
                to={i.to}
                className="px-3.5 py-1.5 rounded-full hover:bg-gray-100 whitespace-nowrap font-medium"
              >
                {i.label}
              </Link>
            ))}
          </div>

          <div className="flex justify-end"></div>
        </div>
      </nav>

      {/* MOBILE MENU DROPDOWN (HAMBURGER) */}
      {openMenu && (
        <div className="md:hidden border-t bg-white px-4 py-3 space-y-2 text-sm">
          {[
            { to: "/", label: "Trang chủ" },
            { to: "/products", label: "Sản phẩm" },
            { to: "/ingredients", label: "Hoạt chất" },
            { to: "/about", label: "Về CareMind" },
            { to: "/contact", label: "Liên hệ" },
          ].map((i) => (
            <Link
              key={i.to}
              to={i.to}
              onClick={() => setOpenMenu(false)}
              className="block py-2 px-3 rounded hover:bg-gray-100"
            >
              {i.label}
            </Link>
          ))}
        </div>
      )}
    </header>
  );
}
