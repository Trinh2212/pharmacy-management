import { useState } from "react";
import { Link, NavLink, useLocation } from "react-router-dom";
import { FaChartPie, FaMedkit, FaFlask, FaUsers, FaHome, FaLayerGroup, FaTruck, FaBoxes, FaChevronDown, FaFileAlt, FaList} from "react-icons/fa";

const NAV_ITEMS = [
  {
    to: "/admin",
    label: "Thống kê",
    icon: FaChartPie,
    end: true,
  },
  {
    label: "Danh mục thuốc",
    icon: FaMedkit,
    children: [
      { to: "/admin/medicines", label: "Thuốc", icon: FaMedkit },
      { to: "/admin/medicine-groups", label: "Nhóm thuốc", icon: FaLayerGroup },
      { to: "/admin/ingredients", label: "Hoạt chất", icon: FaFlask },
    ],
  },
  {
    to: "/admin/suppliers",
    label: "Nhà cung cấp",
    icon: FaTruck,
  },
  {
    to: "/admin/employees",
    label: "Nhân viên",
    icon: FaUsers,
  },
  {
    label: "Nhập kho thuốc",
    icon: FaBoxes,
    children: [
      {
        to: "/admin/warehouse/create",
        label: "Tạo phiếu nhập",
        icon: FaFileAlt,
      },
      {
        to: "/admin/warehouse/list",
        label: "Danh sách phiếu nhập",
        icon: FaList,
      },
    ],
  },
  {
    to: "/admin/profile",
    label: "Hồ sơ cá nhân",
    icon: FaUsers,
  },
];

function AccordionItem({ item }) {
  const location = useLocation();
  const isChildActive = item.children?.some((c) =>
    location.pathname.startsWith(c.to),
  );
  const [open, setOpen] = useState(isChildActive);

  return (
    <div>
      <button
        onClick={() => setOpen((prev) => !prev)}
        className={`w-full flex items-center gap-3 px-4 py-2.5 rounded-xl text-sm font-medium transition
          ${
            isChildActive
              ? "bg-sidebar-accent text-sidebar-primary font-semibold"
              : "text-sidebar-foreground hover:bg-sidebar-accent/50"
          }`}
      >
        <item.icon className="h-4 w-4 shrink-0" />
        <span className="flex-1 text-left">{item.label}</span>
        <FaChevronDown
          className={`h-3 w-3 transition-transform duration-200 ${
            open ? "rotate-180" : ""
          }`}
        />
      </button>

      {open && (
        <div className="mt-1 ml-4 pl-3 border-l border-sidebar-border space-y-0.5">
          {item.children.map((child) => (
            <NavLink
              key={child.to}
              to={child.to}
              className={({ isActive }) =>
                `flex items-center gap-2.5 px-3 py-2 rounded-lg text-sm transition
                ${
                  isActive
                    ? "bg-sidebar-accent text-sidebar-primary font-semibold"
                    : "text-sidebar-foreground hover:bg-sidebar-accent/50"
                }`
              }
            >
              <child.icon className="h-3.5 w-3.5 shrink-0" />
              {child.label}
            </NavLink>
          ))}
        </div>
      )}
    </div>
  );
}

export function Sidebar() {
  return (
    <aside className="hidden md:flex w-64 shrink-0 flex-col h-screen sticky top-0 bg-sidebar border-r border-sidebar-border overflow-y-auto">
      {/* Logo */}
      <div className="p-5 border-b border-sidebar-border shrink-0">
        <Link to="/" className="flex items-center gap-2">
          <div className="h-10 w-10 rounded-xl bg-gradient-hero grid place-items-center shadow-soft overflow-hidden">
            <img
              src="/img/logo.png"
              alt="caremind pharmacy"
              className="h-8 w-8 object-contain"
            />
          </div>
          <div className="leading-tight">
            <div className="font-display font-extrabold text-sidebar-primary text-lg">
              CareMind Pharma
            </div>
            <div className="text-[10px] uppercase tracking-wider text-muted-foreground">
              Trang quản trị
            </div>
          </div>
        </Link>
      </div>

      {/* Menu */}
      <nav className="flex-1 p-3 space-y-1 overflow-y-auto">
        {NAV_ITEMS.map((item) =>
          item.children ? (
            <AccordionItem key={item.label} item={item} />
          ) : (
            <NavLink
              key={item.to}
              to={item.to}
              end={item.end}
              className={({ isActive }) =>
                `flex items-center gap-3 px-4 py-2.5 rounded-xl text-sm font-medium transition
                ${
                  isActive
                    ? "bg-sidebar-accent text-sidebar-primary font-semibold shadow-sm"
                    : "text-sidebar-foreground hover:bg-sidebar-accent/50"
                }`
              }
            >
              <item.icon className="h-4 w-4 shrink-0" /> {item.label}
            </NavLink>
          ),
        )}
      </nav>

      <div className="p-3 border-t border-sidebar-border shrink-0">
        <Link
          to="/"
          className="flex items-center gap-3 px-4 py-2.5 rounded-xl text-sm font-medium text-sidebar-foreground hover:bg-rose-50 hover:text-rose-600 transition"
        >
          <FaHome className="h-4 w-4" /> Trang chủ
        </Link>
      </div>
    </aside>
  );
}