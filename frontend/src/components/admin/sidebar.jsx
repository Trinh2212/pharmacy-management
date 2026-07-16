import { useState } from "react";
import { Link, NavLink, useLocation } from "react-router-dom";
import { FaChartPie, FaMedkit, FaCapsules, FaFlask, FaUsers, FaHome, FaLayerGroup, FaTruck, FaArchive, FaBoxes, FaChevronDown, FaFileAlt, FaList} from "react-icons/fa";
import { useAuth } from "../../contexts/AuthContext"; 

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
      { to: "/admin/medicine-management", label: "Thuốc", icon: FaCapsules },
      {
        to: "/admin/group-management",
        label: "Nhóm thuốc",
        icon: FaLayerGroup,
      },
      { to: "/admin/ingredient-management", label: "Hoạt chất", icon: FaFlask },
    ],
  },
  {
    to: "/admin/supplier-management",
    label: "Nhà cung cấp",
    icon: FaTruck,
  },
  {
    // Chỉ admin mới thấy mục Nhân viên
    to: "/admin/employee-management",
    label: "Nhân viên",
    icon: FaUsers,
    roles: ["admin"],
  },
  {
    to: "/admin/batch-management",
    label: "Lô thuốc",
    icon: FaArchive,
  },
  {
    label: "Nhập kho thuốc",
    icon: FaBoxes,
    children: [
      {
        to: "/admin/warehouse/add-receipt",
        label: "Tạo phiếu nhập",
        icon: FaFileAlt,
      },
      {
        to: "/admin/warehouse-management",
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

function isVisible(item, userRole) {
  if (!item.roles) return true; 
  return item.roles.includes(userRole); // có giới hạn kiểm tra role
}

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
              ? "btn-gradient text-white font-semibold shadow-md"
              : "text-black-900 hover:bg-blue-100"
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
        <div className="mt-1 ml-4 pl-3 border-l border-gray-200 space-y-0.5">
          {item.children.map((child) => (
            <NavLink
              key={child.to}
              to={child.to}
              className={({ isActive }) =>
                `flex items-center gap-2.5 px-3 py-2 rounded-lg text-sm transition
                ${
                  isActive
                    ? "bg-blue-100 text-blue-700 font-semibold"
                    : "text-black-900 hover:bg-blue-100"
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
  const { user } = useAuth();
  const userRole = user?.role;

  return (
    <aside className="hidden md:flex w-64 shrink-0 flex-col h-screen sticky top-0 bg-sidebar border-r border-sidebar-border overflow-y-auto ">
      {/* Logo */}
      <div className="p-5 shrink-0">
        <Link to="/" className="flex items-center gap-2">
          <div className="h-10 w-10 rounded-xl grid place-items-center shadow-sm overflow-hidden">
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
      <div className="h-0.5 mx-4 bg-blue-200 rounded-full" />

      {/* Menu */}
      <nav className="flex-1 p-3 space-y-1 overflow-y-auto">
        {NAV_ITEMS.filter((item) => isVisible(item, userRole)).map((item) =>
          item.children ? (
            <AccordionItem key={item.label} item={item} />
          ) : (
            <NavLink
              key={item.to}
              to={item.to}
              end={item.end}
              className={({ isActive }) =>
                `flex items-center gap-3 px-4 py-2.5 rounded-xl text-sm font-medium transition-all duration-300
                ${
                  isActive
                    ? "btn-gradient text-white shadow-md"
                    : "text-black-900 hover:bg-blue-100"
                }`
              }
            >
              <item.icon className="h-4 w-4 shrink-0" /> {item.label}
            </NavLink>
          ),
        )}
      </nav>
      <div className="h-0.5 mx-4 bg-blue-200 rounded-full" />
      <div className="p-3 shrink-0">
        <Link
          to="/"
          className="flex items-center gap-3 px-4 py-2.5 rounded-xl text-sm font-medium transition-all duration-300 text-black-900 hover:bg-blue-100 hover:text-blue-900"
        >
          <FaHome className="h-4 w-4" /> Trang chủ
        </Link>
      </div>
    </aside>
  );
}
