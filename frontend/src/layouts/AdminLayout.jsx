import { Outlet } from "react-router-dom";
import { Sidebar } from "../components/admin/sidebar";

export default function AdminLayout() {
  return (
    <div className="min-h-screen flex bg-secondary/30">
      <Sidebar />
      <div className="flex-1 min-w-0 flex flex-col">
        <Outlet />
      </div>
    </div>
  );
}
