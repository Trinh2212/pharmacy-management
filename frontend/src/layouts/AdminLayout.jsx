import { Outlet } from "react-router-dom";
import { Sidebar } from "../components/admin/SideBar";

export default function AdminLayout() {
  return (
    <div className="min-h-screen flex bg-gradient-to-b from-blue-50 via-white to-slate-50">
      <Sidebar />
      <div className="flex-1 min-w-0 flex flex-col">
        <Outlet />
      </div>
    </div>
  );
}
