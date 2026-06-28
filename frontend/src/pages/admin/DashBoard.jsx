import { Topbar } from "../../components/admin/topbar";
// import { DashboardCard } from "../../components/admin/DashboardCard";
import { MedicineCard } from "../../components/common/MedicineCard";
// 👉 Đổi import từ lucide-react sang react-icons/fa
// import {
//   FaMedkit, // Thay cho Pill
//   FaUsers, // Thay cho Users
//   FaShoppingBag, // Thay cho ShoppingBag
//   FaChartLine, // Thay cho TrendingUp
// } from "react-icons/fa";
// import { medicines } from "../../mock/medicines";

export default function Dashboard() {
  return (
    <>
      <Topbar title="Tổng quan" subtitle="Chào mừng trở lại, Admin" />

      <div className="p-6 space-y-6">
        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {/* <DashboardCard
            icon={FaShoppingBag}
            label="Đơn hàng hôm nay"
            value="248"
            change="+12.4%"
            accent="primary"
          />
          <DashboardCard
            icon={FaChartLine}
            label="Doanh thu tháng"
            value="1.82 tỷ"
            change="+8.2%"
            accent="success"
          />
          <DashboardCard
            icon={FaMedkit}
            label="Sản phẩm"
            value="10.452"
            accent="sky"
          />
          <DashboardCard
            icon={FaUsers}
            label="Nhân viên"
            value="486"
            change="+3"
            accent="cyan"
          /> */}
        </div>

        <div className="grid lg:grid-cols-3 gap-6">
          <div className="lg:col-span-2 bg-card border border-border rounded-2xl p-6">
            <div className="flex items-center justify-between mb-5">
              <div>
                <h3 className="font-bold text-lg">Doanh thu 7 ngày</h3>
                <p className="text-sm text-muted-foreground">
                  Tăng trưởng ổn định tuần này
                </p>
              </div>
              <select className="bg-secondary rounded-lg px-3 py-2 text-sm outline-none">
                <option>7 ngày</option>
                <option>30 ngày</option>
                <option>90 ngày</option>
              </select>
            </div>
            <div className="h-64 flex items-end gap-3">
              {[42, 58, 51, 68, 73, 65, 82].map((h, i) => (
                <div
                  key={i}
                  className="flex-1 flex flex-col items-center gap-2"
                >
                  <div
                    className="w-full bg-gradient-hero rounded-t-xl shadow-soft transition hover:opacity-90"
                    style={{ height: `${h}%` }}
                  />
                  <span className="text-xs text-muted-foreground">
                    T{i + 2}
                  </span>
                </div>
              ))}
            </div>
          </div>

          <div className="bg-card border border-border rounded-2xl p-6">
            <h3 className="font-bold text-lg">Hoạt động gần đây</h3>
            <ul className="mt-4 space-y-3.5">
              {[
                {
                  t: "Đơn #OP10241 đã giao",
                  time: "5 phút trước",
                  color: "bg-success",
                },
                {
                  t: "Nhập kho Panadol Extra (200 hộp)",
                  time: "32 phút trước",
                  color: "bg-primary",
                },
                {
                  t: "Nhân viên mới: Lê Hoài An",
                  time: "1 giờ trước",
                  color: "bg-cyan-brand",
                },
                {
                  t: "Khiếu nại đơn #OP10238",
                  time: "2 giờ trước",
                  color: "bg-sale",
                },
                {
                  t: "Khuyến mãi mùa hè đã kích hoạt",
                  time: "Hôm qua",
                  color: "bg-sky-brand",
                },
              ].map((a, i) => (
                <li key={i} className="flex gap-3">
                  <span className={`h-2 w-2 rounded-full ${a.color} mt-2`} />
                  <div className="flex-1 min-w-0">
                    <div className="text-sm font-medium truncate">{a.t}</div>
                    <div className="text-xs text-muted-foreground">
                      {a.time}
                    </div>
                  </div>
                </li>
              ))}
            </ul>
          </div>
        </div>

        <div className="bg-card border border-border rounded-2xl p-6">
          <div className="flex items-center justify-between mb-5">
            <h3 className="font-bold text-lg">Sản phẩm bán chạy</h3>
            <a className="text-sm text-primary font-medium hover:underline cursor-pointer">
              Xem tất cả →
            </a>
          </div>
          {/* <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4">
            {medicines.slice(0, 4).map((p) => (
              <MedicineCard key={p.id} p={p} />
            ))}
          </div> */}
        </div>
      </div>
    </>
  );
}
