import { useState, useEffect, useRef } from "react";
import { Topbar } from "../../components/admin/TopBar";
import axiosClient from "../../api/axiosClient";
import { alertError } from "../../utils/SwalAlert";
import { FaBoxesStacked, FaTriangleExclamation, FaClock, FaCircleCheck, FaCalendarDays} from "react-icons/fa6";

function formatDate(value) {
  return value ? new Date(value).toLocaleDateString("vi-VN") : "chưa cập nhật";
}

const STATUS_CONFIG = {
  expired: {
    label: "Đã hết hạn",
    className: "bg-red-50 text-red-600 border-red-200",
    icon: FaTriangleExclamation,
  },
  expiring: {
    label: "Sắp hết hạn",
    className: "bg-amber-50 text-amber-600 border-amber-200",
    icon: FaClock,
  },
  normal: {
    label: "Còn hạn",
    className: "bg-green-50 text-green-600 border-green-200",
    icon: FaCircleCheck,
  },
};

function StatusBadge({ status }) {
  const config = STATUS_CONFIG[status] || STATUS_CONFIG.normal;
  const Icon = config.icon;

  return (
    <span
      className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium border whitespace-nowrap ${config.className}`}
    >
      <Icon className="shrink-0 h-3 w-3" />
      {config.label}
    </span>
  );
}

export default function BatchManagement() {
  const [batches, setBatches] = useState([]);
  const [initialLoading, setInitialLoading] = useState(true);
  const [searching, setSearching] = useState(false);
  const [keyword, setKeyword] = useState("");
  const debounceRef = useRef(null);
  const hasLoadedOnce = useRef(false);

  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalBatches, setTotalBatches] = useState(0);
  const LIMIT = 10;

  const [statusFilter, setStatusFilter] = useState("all"); // all | expiring | expired

  const [stats, setStats] = useState({ expiredCount: 0, expiringCount: 0 });

  useEffect(() => {
    axiosClient
      .get("/batches/stats")
      .then((res) =>
        setStats({
          expiredCount: res.data.data?.expiredCount ?? 0,
          expiringCount: res.data.data?.expiringCount ?? 0,
        }),
      )
      .catch(() => {});
  }, []);

  const fetchBatches = (page = 1, search = "", status = "all") => {
    if (!hasLoadedOnce.current) {
      setInitialLoading(true);
    } else {
      setSearching(true);
    }

    axiosClient.get("/batches", {
        params: {
          page,
          limit: LIMIT,
          ...(search ? { search } : {}),
          ...(status !== "all" ? { status } : {}),
        },
      })
      .then((res) => {
        setBatches(res.data.data);
        setTotalPages(res.data.totalPages || 1);
        setTotalBatches(res.data.totalBatches || 0);
        setCurrentPage(res.data.currentPage || page);
      })
      .catch(() => alertError("Không thể tải danh sách lô thuốc"))
      .finally(() => {
        hasLoadedOnce.current = true;
        setInitialLoading(false);
        setSearching(false);
      });
  };

  useEffect(() => {
    fetchBatches(1, "", "all");
  }, []);

  useEffect(
    () => () => {
      if (debounceRef.current) clearTimeout(debounceRef.current);
    },
    [],
  );

  const handleSearch = (value) => {
    setKeyword(value);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      fetchBatches(1, value.trim(), statusFilter);
    }, 400);
  };

  const handleStatusChange = (status) => {
    setStatusFilter(status);
    fetchBatches(1, keyword.trim(), status);
  };

  const handleChangePage = (page) => {
    if (page < 1 || page > totalPages || page === currentPage) return;
    fetchBatches(page, keyword.trim(), statusFilter);
  };

  if (initialLoading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600" />
        <span className="ml-2 text-teal-600 font-medium">
          Đang tải dữ liệu...
        </span>
      </div>
    );
  }

  return (
    <>
      <Topbar
        title="Quản lý lô thuốc"
        subtitle="Theo dõi hạn sử dụng và tồn kho theo từng lô"
        onSearch={handleSearch}
        searchValue={keyword}
        searchPlaceholder="Tìm theo số lô, tên/mã thuốc…"
      />

      <div className="p-6 min-h-screen">
        {/* Bộ lọc trạng thái + lọc theo thuốc */}
        <div className="mb-4 flex flex-wrap items-center gap-3">
          <button
            onClick={() => handleStatusChange("all")}
            className={`h-10 px-4 rounded-lg text-sm font-semibold transition-all duration-300 border ${
              statusFilter === "all"
                ? "btn-gradient border-none text-white shadow-md"
                : "bg-white text-gray-600 border-gray-300 hover:border-blue-400 hover:text-blue-600"
            }`}
          >
            Tất cả
          </button>

          <button
            onClick={() => handleStatusChange("expiring")}
            className={`flex items-center gap-2 px-4 py-2 h-10 rounded-lg text-sm font-semibold border transition ${
              statusFilter === "expiring"
                ? "bg-amber-500 text-white border-amber-500"
                : "bg-white text-amber-600 border-amber-200 hover:border-amber-400"
            }`}
          >
            <FaClock className="h-3.5 w-3.5" />
            Sắp hết hạn
            <span
              className={`text-xs px-1.5 py-0.5 rounded-full ${
                statusFilter === "expiring"
                  ? "bg-white/25"
                  : "bg-amber-50 text-amber-600"
              }`}
            >
              {stats.expiringCount}
            </span>
          </button>

          <button
            onClick={() => handleStatusChange("expired")}
            className={`flex items-center gap-2 px-4 py-2 h-10 rounded-lg text-sm font-semibold border transition ${
              statusFilter === "expired"
                ? "bg-red-600 text-white border-red-600"
                : "bg-white text-red-600 border-red-200 hover:border-red-400"
            }`}
          >
            <FaTriangleExclamation className="h-3.5 w-3.5" />
            Đã hết hạn
            <span
              className={`text-xs px-1.5 py-0.5 rounded-full ${
                statusFilter === "expired"
                  ? "bg-white/25"
                  : "bg-red-50 text-red-600"
              }`}
            >
              {stats.expiredCount}
            </span>
          </button>
        </div>

        <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-blue-600 border-b border-blue-800 text-white text-sm uppercase tracking-wider">
                  <th className="px-6 py-4 font-semibold">Mã lô</th>
                  <th className="px-6 py-4 font-semibold">Thuốc</th>
                  <th className="px-6 py-4 font-semibold">NSX</th>
                  <th className="px-6 py-4 font-semibold">HSD</th>
                  <th className="px-6 py-4 font-semibold text-right"> Tồn kho </th>
                  <th className="px-6 py-4 font-semibold">Trạng thái</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {batches.length === 0 ? (
                  <tr>
                    <td
                      colSpan="6"
                      className="px-6 py-12 text-center text-gray-400"
                    >
                      Không tìm thấy lô thuốc phù hợp!
                    </td>
                  </tr>
                ) : (
                  batches.map((b) => {
                    return (
                      <tr
                        key={b.batchId}
                        className={`transition-colors duration-200 border-b border-gray-100 ${
                          b.batchStatus === "expired"
                            ? "bg-red-50/40"
                            : b.batchStatus === "expiring"
                              ? "bg-amber-50/40"
                              : "hover:bg-gray-50"
                        }`}
                      >
                        <td className="px-6 py-4">
                          <span className="text-xs text-blue-600 font-semibold bg-blue-50 px-2 py-0.5 rounded border border-blue-100">
                            {b.batchNumber}
                          </span>
                        </td>

                        <td className="px-6 py-4">
                          <div className="text-sm font-medium text-black">
                            {b.medicineInfo?.brandName || "—"}
                          </div>
                          <div className="text-xs text-gray-400 font-mono">
                            {b.medicineInfo?.medicineCode}
                          </div>
                        </td>

                        <td className="px-6 py-4 text-sm text-black">
                          <span className="flex items-center gap-1.5">
                            <FaCalendarDays className="h-3 w-3 text-gray-400" />
                            {formatDate(b.productionDate)}
                          </span>
                        </td>

                        <td className="px-6 py-4 text-sm text-black">
                          <span className="flex items-center gap-1.5">
                            <FaCalendarDays className="h-3 w-3 text-gray-400" />
                            {formatDate(b.expiryDate)}
                          </span>
                        </td>

                        <td className="px-6 py-4 text-right">
                          <span className="inline-flex items-center gap-1.5 text-sm font-medium text-gray-800">
                            <FaBoxesStacked className="shrink-0 h-3.5 w-3.5 text-gray-400" />
                            {b.stockQuantity ?? 0}{" "}
                            {b.medicineInfo?.unit || "đơn vị"}
                          </span>
                        </td>

                        <td className="px-6 py-4">
                          <StatusBadge status={b.batchStatus} />
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>

          {batches.length > 0 && (
            <div className="px-6 py-3 border-t border-gray-100 bg-gray-50 flex items-center justify-between flex-wrap gap-3">
              <div className="flex items-center gap-2 text-sm text-gray-500">
                <span>
                  Tổng:{" "}
                  <span className="font-semibold text-gray-700">
                    {totalBatches}
                  </span>{" "}
                  lô thuốc
                </span>
                {searching && (
                  <span className="flex items-center gap-1.5 text-gray-400">
                    <span className="h-3 w-3 rounded-full border-2 border-gray-300 border-t-blue-500 animate-spin" />
                    Đang tìm kiếm...
                  </span>
                )}
              </div>

              {totalPages > 1 && (
                <div className="flex items-center gap-1.5">
                  <button
                    onClick={() => handleChangePage(currentPage - 1)}
                    disabled={currentPage === 1}
                    className="px-3 py-1.5 text-sm rounded-md border border-gray-200 bg-white text-gray-600 hover:text-blue-600 hover:border-blue-300 disabled:opacity-40 disabled:cursor-not-allowed transition"
                  >
                    Trước
                  </button>

                  {Array.from({ length: totalPages }, (_, i) => i + 1).map(
                    (p) => (
                      <button
                        key={p}
                        onClick={() => handleChangePage(p)}
                        className={`w-8 h-8 text-sm rounded-md border transition ${
                          p === currentPage
                            ? "bg-gradient-to-br from-blue-600 to-blue-400 text-white border-transparent"
                            : "bg-white text-gray-600 border-gray-200 hover:text-blue-600 hover:border-blue-300"
                        }`}
                      >
                        {p}
                      </button>
                    ),
                  )}

                  <button
                    onClick={() => handleChangePage(currentPage + 1)}
                    disabled={currentPage === totalPages}
                    className="px-3 py-1.5 text-sm rounded-md border border-gray-200 bg-white text-gray-600 hover:text-blue-600 hover:border-blue-300 disabled:opacity-40 disabled:cursor-not-allowed transition"
                  >
                    Sau
                  </button>
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    </>
  );
}