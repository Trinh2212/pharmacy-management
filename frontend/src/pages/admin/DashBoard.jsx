import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { Topbar } from "../../components/admin/TopBar";
import axiosClient from "../../api/axiosClient";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer} from "recharts";
import { FaCapsules, FaTruck, FaUsers, FaTriangleExclamation, FaCalendarDays, FaClock, FaBoxesStacked} from "react-icons/fa6";
import { BiChevronsRight } from "react-icons/bi";
import { formatDate, formatCurrency, formatMonthLabel } from "../../utils/Format";

function extractCount(resData, totalFieldCandidates = []) {
  if (!resData) return 0;
  for (const field of totalFieldCandidates) {
    if (typeof resData[field] === "number") return resData[field];
  }
  if (Array.isArray(resData.data)) return resData.data.length;
  if (Array.isArray(resData)) return resData.length;
  return 0;
}

function StatCard({ icon: Icon, label, value, colorClass, linkTo, linkLabel }) {
  return (
    <div className={`rounded-2xl border p-6 flex flex-col gap-4 ${colorClass}`}>
      <div className="h-12 w-12 rounded-xl bg-white/60 flex items-center justify-center">
        <Icon className="h-6 w-6" />
      </div>
      <div>
        <div className="text-sm font-medium opacity-80">{label}</div>
        <div className="text-3xl font-extrabold mt-1">{value}</div>
      </div>
      {linkTo && (
        <Link
          to={linkTo}
          className="mt-auto inline-flex items-center gap-1 text-sm font-semibold underline underline-offset-2 transition hover:opacity-70"
        >
          {linkLabel} <BiChevronsRight className="text-lg" />
        </Link>
      )}
    </div>
  );
}

export default function Dashboard() {
  const [loading, setLoading] = useState(true);

  const [totalMedicines, setTotalMedicines] = useState(0);
  const [totalSuppliers, setTotalSuppliers] = useState(0);
  const [totalEmployees, setTotalEmployees] = useState(0);
  const [expiredCount, setExpiredCount] = useState(0);
  const [expiringCount, setExpiringCount] = useState(0);
  const [nearestBatches, setNearestBatches] = useState([]);
  const [recentReceipts, setRecentReceipts] = useState([]);
  const [costTrend, setCostTrend] = useState([]);

  useEffect(() => {
    let active = true;

    Promise.allSettled([
      axiosClient.get("/medicines", { params: { limit: 1 } }),
      axiosClient.get("/suppliers"),
      axiosClient.get("/employees/admin/management"),
      axiosClient.get("/batches/stats"),
      axiosClient.get("/warehouse-receipts", { params: { limit: 5 } }),
      axiosClient.get("/warehouse-receipts/cost-trend", {
        params: { months: 6 },
      }),
    ]).then((results) => {
      if (!active) return;
      const [medRes, supRes, empRes, batchStatsRes, receiptsRes, trendRes] =
        results;

      if (medRes.status === "fulfilled") {
        setTotalMedicines(extractCount(medRes.value.data, ["totalMedicines"]));
      }
      if (supRes.status === "fulfilled") {
        setTotalSuppliers(
          extractCount(supRes.value.data, ["totalSuppliers", "total"]),
        );
      }
      if (empRes.status === "fulfilled") {
        setTotalEmployees(
          extractCount(empRes.value.data, ["totalEmployees", "total"]),
        );
      }
      if (batchStatsRes.status === "fulfilled") {
        const d = batchStatsRes.value.data.data;
        setExpiredCount(d?.expiredCount ?? 0);
        setExpiringCount(d?.expiringCount ?? 0);
        setNearestBatches(d?.nearestBatches ?? []);
      }
      if (receiptsRes.status === "fulfilled") {
        setRecentReceipts(receiptsRes.value.data.data ?? []);
      }
      if (trendRes.status === "fulfilled") {
        const raw = trendRes.value.data.data ?? [];
        setCostTrend(
          raw.map((r) => ({
            month: formatMonthLabel(r.month),
            totalCost: Number(r.totalCost) || 0,
          })),
        );
      }

      setLoading(false);
    });

    return () => {
      active = false;
    };
  }, []);

  if (loading) {
    return (
      <>
        <Topbar title="Dashboard" subtitle="Tổng quan hoạt động hệ thống" />
        <div className="flex justify-center items-center h-64">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600" />
          <span className="ml-2 text-gray-500 font-medium">
            Đang tải dữ liệu...
          </span>
        </div>
      </>
    );
  }

  return (
    <>
      <Topbar title="Dashboard" subtitle="Tổng quan hoạt động hệ thống" />
      <div className="p-6 min-h-screen">
        {/* Thẻ thống kê  */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 mb-8">
          <StatCard
            icon={FaCapsules}
            label="Số loại thuốc"
            value={totalMedicines}
            colorClass="bg-gradient-to-br from-blue-600 to-cyan-500 text-white border-none"
            linkTo="/admin/medicine-management"
            linkLabel="Xem danh sách thuốc"
          />
          <StatCard
            icon={FaTruck}
            label="Nhà cung cấp"
            value={totalSuppliers}
            colorClass="bg-gradient-to-br from-green-700 to-emerald-500 text-white border-none"
            linkTo="/admin/supplier-management"
            linkLabel="Xem nhà cung cấp"
          />
          <StatCard
            icon={FaUsers}
            label="Nhân viên"
            value={totalEmployees}
            colorClass="bg-gradient-to-br from-purple-600 to-indigo-500 text-white border-none"
            linkTo="/admin/employee-management"
            linkLabel="Xem nhân viên"
          />
          <StatCard
            icon={FaTriangleExclamation}
            label="Lô cần chú ý (sắp/đã hết hạn)"
            value={expiringCount + expiredCount}
            colorClass="bg-gradient-to-br from-red-600 to-orange-500 text-white border-none"
            linkTo="/admin/batch-management"
            linkLabel="Xử lý ngay"
          />
        </div>

        {/* Biểu đồ chi phí nhập thuốc theo thời gian */}
        <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6 mb-8">
          <h2 className="text-xl font-bold text-slate-800 mb-4">
            Chi phí nhập thuốc theo tháng
          </h2>
          {costTrend.length === 0 ? (
            <p className="text-sm text-gray-400 italic py-8 text-center">
              Chưa có dữ liệu phiếu nhập trong giai đoạn này.
            </p>
          ) : (
            <ResponsiveContainer width="100%" height={300}>
              <LineChart data={costTrend}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                <XAxis dataKey="month" tick={{ fontSize: 12 }} />
                <YAxis
                  tick={{ fontSize: 12 }}
                  tickFormatter={(v) => `${(v / 1000000).toFixed(0)}tr`}
                />
                <Tooltip
                  formatter={(value) => [formatCurrency(value), "Chi phí nhập"]}
                />
                <Line
                  type="monotone"
                  dataKey="totalCost"
                  stroke="#2563eb"
                  strokeWidth={2.5}
                  dot={{ r: 4, fill: "#2563eb" }}
                />
              </LineChart>
            </ResponsiveContainer>
          )}
        </div>

        {/* Phiếu nhập gần đây + Lô sắp/đã hết hạn */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {/* Phiếu nhập gần đây */}
          <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
            <h2 className="text-xl font-bold text-slate-800 mb-4">
              Phiếu nhập gần đây
            </h2>
            {recentReceipts.length === 0 ? (
              <p className="text-sm text-gray-400 italic">
                Chưa có phiếu nhập nào.
              </p>
            ) : (
              <ul className="flex flex-col gap-2">
                {recentReceipts.map((r) => (
                  <li
                    key={r.receiptId}
                    className="flex items-center justify-between bg-gray-50 rounded-lg px-4 py-3 text-sm"
                  >
                    <div>
                      <div className="font-semibold text-slate-800">
                        {r.receiptCode}
                      </div>
                      <div className="text-xs text-gray-400 flex items-center gap-1 mt-0.5">
                        <FaCalendarDays className="h-3 w-3" />
                        {formatDate(r.receiptDate)} ·{" "}
                        {r.supplierInfo?.supplierName || "—"}
                      </div>
                    </div>
                    <span className="font-bold text-blue-600">
                      {formatCurrency(r.totalPrice)}
                    </span>
                  </li>
                ))}
              </ul>
            )}
            <Link
              to="/admin/warehouse-management"
              className="block text-sm font-semibold text-blue-600 hover:underline mt-4"
            >
              Xem tất cả phiếu nhập »
            </Link>
          </div>

          {/* Lô sắp/đã hết hạn */}
          <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
            <h2 className="text-xl font-bold text-slate-800 mb-4">
              Lô thuốc có HSD sắp hoặc hết hạn
            </h2>
            {nearestBatches.length === 0 ? (
              <p className="text-sm text-gray-400 italic">
                Không có lô nào sắp hoặc đã hết hạn.
              </p>
            ) : (
              <ul className="flex flex-col gap-2">
                {nearestBatches.map((b) => (
                  <li
                    key={b.batchId}
                    className={`flex items-center justify-between rounded-lg px-4 py-3 text-sm ${
                      b.batchStatus === "expired" ? "bg-red-50" : "bg-amber-50"
                    }`}
                  >
                    <div>
                      <div className="font-semibold text-slate-800">
                        {b.medicineInfo?.brandName || "—"}
                      </div>
                      <div className="text-xs text-gray-400 flex items-center gap-1 mt-0.5">
                        <FaBoxesStacked className="h-3 w-3" />
                        Lô {b.batchNumber} · HSD {formatDate(b.expiryDate)}
                      </div>
                    </div>
                    <span
                      className={`flex items-center gap-1 text-xs font-semibold px-2 py-1 rounded-full ${
                        b.batchStatus === "expired"
                          ? "text-red-600 bg-red-100"
                          : "text-amber-600 bg-amber-100"
                      }`}
                    >
                      {b.batchStatus === "expired" ? (
                        <FaTriangleExclamation className="h-3 w-3" />
                      ) : (
                        <FaClock className="h-3 w-3" />
                      )}
                      {b.batchStatus === "expired" ? "Hết hạn" : "Sắp hết hạn"}
                    </span>
                  </li>
                ))}
              </ul>
            )}
            <Link
              to="/admin/batch-management"
              className="block text-sm font-semibold text-blue-600 hover:underline mt-4"
            >
              Xem tất cả lô thuốc »
            </Link>
          </div>
        </div>
      </div>
    </>
  );
}