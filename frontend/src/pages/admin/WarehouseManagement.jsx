import { useState, useEffect, useMemo, useRef } from "react";
import { useNavigate } from "react-router-dom";
import { Topbar } from "../../components/admin/TopBar";
import axiosClient from "../../api/axiosClient";
import { alertError } from "../../utils/SwalAlert";

import { FaBoxesStacked, FaXmark, FaFlask, FaUser, FaTruck, FaCalendarDays} from "react-icons/fa6";

function Modal({ title, onClose, children }) {
  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm px-4"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-xl w-full max-w-2xl flex flex-col max-h-[90vh]"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between shrink-0">
          <div className="w-5"></div>
          <h3 className="text-xl font-bold text-slate-800 text-center">
            {title}
          </h3>
          <button
            onClick={onClose}
            className="p-1 text-gray-400 hover:text-gray-600 transition"
          >
            <FaXmark className="h-5 w-5" />
          </button>
        </div>
        <div className="flex flex-col overflow-y-auto">{children}</div>
      </div>
    </div>
  );
}

const formatCurrency = (value) =>
  new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
  }).format(value || 0);

const formatDate = (value) =>
  value ? new Date(value).toLocaleDateString("vi-VN") : "đang cập nhật";

export default function WarehouseManagement() {
  const navigate = useNavigate();

  const [receipts, setReceipts] = useState([]);
  const [initialLoading, setInitialLoading] = useState(true);
  const [searching, setSearching] = useState(false);
  const [keyword, setKeyword] = useState("");
  const debounceRef = useRef(null);
  const hasLoadedOnce = useRef(false);

  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalReceipts, setTotalReceipts] = useState(0);
  const LIMIT = 8;

  const [selectedId, setSelectedId] = useState(null);
  const selectedReceipt = useMemo(
    () => receipts.find((r) => r.receiptId === selectedId) || null,
    [receipts, selectedId],
  );

  const [detailReceipt, setDetailReceipt] = useState(null);
  const [detailLoading, setDetailLoading] = useState(false);

  const fetchReceipts = async (page = 1, search = "") => {
    try {
      if (!hasLoadedOnce.current) {
        setInitialLoading(true);
      } else {
        setSearching(true);
      }
      const res = await axiosClient.get("/warehouse-receipts", {
        params: {
          page,
          limit: LIMIT,
          ...(search ? { search } : {}),
        },
      });
      setReceipts(res.data.data);
      setTotalPages(res.data.totalPages || 1);
      setTotalReceipts(res.data.totalReceipts || 0);
      setCurrentPage(res.data.currentPage || page);
    } catch {
      alertError("Không thể tải danh sách phiếu nhập kho");
    } finally {
      hasLoadedOnce.current = true;
      setInitialLoading(false);
      setSearching(false);
    }
  };

  useEffect(() => {
    fetchReceipts(1, "");
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
      setSelectedId(null);
      fetchReceipts(1, value.trim());
    }, 400);
  };

  const handleChangePage = (page) => {
    if (page < 1 || page > totalPages || page === currentPage) return;
    setSelectedId(null);
    fetchReceipts(page, keyword.trim());
  };

  const toggleSelect = (receipt) => {
    setSelectedId((prev) =>
      prev === receipt.receiptId ? null : receipt.receiptId,
    );
  };

  const openCreate = () => navigate("/admin/warehouse/add-receipt");

  const openViewSelected = async () => {
    if (!selectedReceipt) return;
    try {
      setDetailLoading(true);
      const res = await axiosClient.get(
        `/warehouse-receipts/${selectedReceipt.receiptId}`,
      );
      setDetailReceipt(res.data.data || res.data);
    } catch {
      alertError("Không thể tải chi tiết phiếu nhập");
    } finally {
      setDetailLoading(false);
    }
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
        title="Quản lý phiếu nhập kho"
        subtitle="Danh sách phiếu nhập kho"
        hasSelection={!!selectedReceipt}
        onSearch={handleSearch}
        searchValue={keyword}
        searchPlaceholder="Tìm theo mã phiếu…"
        actions={{
          onCreate: openCreate,
          onView: openViewSelected,
        }}
      />

      <div className="p-6 bg-gray-50 min-h-screen">
        <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-blue-600 border-b border-blue-800 text-white text-sm uppercase tracking-wider">
                  <th className="px-6 py-4 font-semibold">Mã phiếu nhập</th>
                  <th className="px-6 py-4 font-semibold">Ngày nhập phiếu</th>
                  <th className="px-6 py-4 font-semibold">Nhà cung cấp</th>
                  <th className="px-6 py-4 font-semibold">Người lập phiếu</th>
                  <th className="px-6 py-4 font-semibold">Tổng tiền phiếu</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {receipts.length === 0 ? (
                  <tr>
                    <td
                      colSpan="5"
                      className="px-6 py-12 text-center text-gray-400"
                    >
                      Không tìm thấy phiếu nhập phù hợp!
                    </td>
                  </tr>
                ) : (
                  receipts.map((r) => {
                    const isSelected = r.receiptId === selectedId;
                    return (
                      <tr
                        key={r.receiptId}
                        onClick={() => toggleSelect(r)}
                        className={`cursor-pointer transition-colors duration-200 select-none border-b border-gray-100
                        ${
                          isSelected
                            ? "bg-blue-100 ring-1 ring-inset ring-blue-50"
                            : "hover:bg-gray-100"
                        }`}
                      >
                        <td className="px-6 py-4">
                          <span className="text-xs text-blue-600 font-semibold bg-blue-50 px-2 py-0.5 rounded border border-blue-100">
                            {r.receiptCode}
                          </span>
                        </td>
                        <td className="px-6 py-4 text-sm text-black">
                          {formatDate(r.receiptDate)}
                        </td>
                        <td className="px-6 py-4 font-medium text-black">
                          {r.supplierInfo?.supplierName || "đang cập nhật"}
                        </td>
                        <td className="px-6 py-4 text-sm text-black">
                          {r.employeeInfo?.fullName || "đang cập nhật"}
                        </td>
                        <td className="px-6 py-4 text-sm font-semibold text-black">
                          {formatCurrency(r.totalPrice)}
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>

          {receipts.length > 0 && (
            <div className="px-6 py-3 border-t border-gray-100 bg-gray-50 flex items-center justify-between flex-wrap gap-3">
              <div className="flex items-center gap-2 text-sm text-gray-500">
                <span>
                  Tổng:{" "}
                  <span className="font-semibold text-gray-700">
                    {totalReceipts}
                  </span>{" "}
                  phiếu
                </span>
                {selectedReceipt && (
                  <span className="text-blue-600">
                    Đang chọn:{" "}
                    <span className="font-semibold">
                      {selectedReceipt.receiptCode}
                    </span>
                  </span>
                )}
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

      {/* ── Detail Modal ── */}
      {(detailReceipt || detailLoading) && (
        <Modal
          title="CHI TIẾT PHIẾU NHẬP KHO"
          onClose={() => setDetailReceipt(null)}
        >
          {detailLoading ? (
            <div className="flex justify-center items-center py-12">
              <div className="animate-spin rounded-full h-6 w-6 border-b-2 border-blue-600" />
            </div>
          ) : (
            <div className="px-6 py-5 flex flex-col gap-4">
              <div>
                <div className="text-black font-bold text-xl leading-tight">
                  {detailReceipt.receiptCode}
                </div>
                <div className="text-black text-sm mt-0.5 flex items-center gap-1.5">
                  <FaCalendarDays />
                  {formatDate(detailReceipt.receiptDate)}
                </div>
              </div>

              <div className="grid grid-cols-3 gap-x-6 gap-y-4 text-sm">
                <div>
                  <div className="text-gray-700 text-xs mb-0.5 flex items-center gap-1.5">
                    <FaTruck /> Nhà cung cấp
                  </div>
                  <div className="text-black font-medium">
                    {detailReceipt.supplierInfo?.supplierName || "đang cập nhật"}
                  </div>
                </div>
                <div>
                  <div className="text-gray-700 text-xs mb-0.5 flex items-center gap-1.5">
                    <FaUser /> Người lập phiếu
                  </div>
                  <div className="text-black font-medium">
                    {detailReceipt.employeeInfo?.fullName || "đang cập nhật"}
                  </div>
                </div>

                <div>
                  <div className="text-gray-700 text-xs mb-0.5">
                    Tổng tiền phiếu
                  </div>
                  <div className="text-black font-medium">
                    {formatCurrency(detailReceipt.totalPrice)}
                  </div>
                </div>
              </div>

              {/* Danh sách lô hàng trong phiếu */}
              {detailReceipt.detailInfo?.length > 0 && (
                <div className="pt-2 border-t border-gray-100">
                  <div className="text-gray-400 text-xs mb-2 flex items-center gap-1.5">
                    <FaFlask /> Danh sách thuốc nhập theo lô
                  </div>
                  <ul className="flex flex-col gap-1.5">
                    {detailReceipt.detailInfo.map((d, idx) => (
                      <li
                        key={idx}
                        className="text-sm text-gray-700 flex items-center justify-between bg-gray-50 rounded-md px-3 py-2"
                      >
                        <div className="flex flex-col">
                          <span className="font-medium text-black">
                            {d.batchInfo?.medicineInfo?.brandName || "đang cập nhật"}
                          </span>
                          <span className="text-gray-400 text-xs">
                            Lô thuốc: {d.batchInfo?.batchNumber || "đang cập nhật"} - NSX:{" "}
                            {formatDate(d.batchInfo?.productionDate)} - HSD:{" "}
                            {formatDate(d.batchInfo?.expiryDate)}
                          </span>
                        </div>
                        <div className="flex flex-col items-end">
                          <span className="flex items-center gap-1.5">
                            <FaBoxesStacked className="shrink-0 text-gray-400" />
                            {d.importQuantity}
                          </span>
                          <span className="text-gray-500 text-xs">
                            {formatCurrency(d.importPrice)}
                          </span>
                        </div>
                      </li>
                    ))}
                  </ul>
                </div>
              )}
            </div>
          )}

          <div className="px-6 py-4 border-t border-gray-100 flex justify-end gap-2">
            <button
              onClick={() => setDetailReceipt(null)}
              className="btn-cancel px-4 py-2 text-sm font-medium"
            >
              Đóng
            </button>
          </div>
        </Modal>
      )}
    </>
  );
}