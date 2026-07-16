import { useState, useEffect, useMemo, useRef } from "react";
import { useNavigate } from "react-router-dom";
import { Topbar } from "../../components/admin/TopBar";
import axiosClient from "../../api/axiosClient";
import {
  alertSuccess,
  alertError,
  alertConfirm,
} from "../../utils/SwalAlert";

import {
  FaBoxesStacked,
  FaLayerGroup,
  FaXmark,
  FaTriangleExclamation,
  FaFlask,
} from "react-icons/fa6";

function Modal({ title, onClose, children }) {
  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm px-4"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-xl w-full max-w-lg flex flex-col max-h-[90vh]"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between shrink-0">
          <div className="w-5"></div>{" "}
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

export default function MedicineList() {
  const navigate = useNavigate();

  const [medicines, setMedicines] = useState([]);
  const [initialLoading, setInitialLoading] = useState(true);
  const [searching, setSearching] = useState(false);
  const [keyword, setKeyword] = useState("");
  const debounceRef = useRef(null);
  const hasLoadedOnce = useRef(false);

  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalMedicines, setTotalMedicines] = useState(0);
  const LIMIT = 8;

  const [groups, setGroups] = useState([]);
  const [groupId, setGroupId] = useState("all");

  const [selectedId, setSelectedId] = useState(null);
  const selectedMedicine = useMemo(
    () => medicines.find((m) => m.medicineId === selectedId) || null, 
    [medicines, selectedId],
  );

  const [detailMedicine, setDetailMedicine] = useState(null);

  useEffect(() => {
    const fetchGroups = async () => {
      try {
        const res = await axiosClient.get("/medicine-groups"); 
        setGroups(res.data.data || []);
      } catch {
        // Không chặn nếu lấy nhóm lỗi
      }
    };
    fetchGroups();
  }, []);

  const fetchMedicines = async (page = 1, search = "", group = "all") => {
    try {
      if (!hasLoadedOnce.current) {
        setInitialLoading(true);
      } else {
        setSearching(true);
      }
      const res = await axiosClient.get("/medicines", {
        params: {
          page,
          limit: LIMIT,
          ...(search ? { search } : {}),
          ...(group && group !== "all" ? { groupId: group } : {}),
        },
      });
      setMedicines(res.data.data);
      setTotalPages(res.data.totalPages || 1);
      setTotalMedicines(res.data.totalMedicines || 0);
      setCurrentPage(res.data.currentPage || page);
    } catch {
      alertError("Không thể tải danh sách thuốc");
    } finally {
      hasLoadedOnce.current = true;
      setInitialLoading(false);
      setSearching(false);
    }
  };

  useEffect(() => {
    fetchMedicines(1, "", "all");
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
      fetchMedicines(1, value.trim(), groupId);
    }, 400);
  };

  const handleChangeGroup = (value) => {
    setGroupId(value);
    setSelectedId(null);
    fetchMedicines(1, keyword.trim(), value);
  };

  const handleChangePage = (page) => {
    if (page < 1 || page > totalPages || page === currentPage) return;
    setSelectedId(null);
    fetchMedicines(page, keyword.trim(), groupId);
  };

  const toggleSelect = (medicine) => {
    setSelectedId((prev) =>
      prev === medicine.medicineId ? null : medicine.medicineId,
    );
  };

  const openCreate = () => navigate("/admin/medicine/add-medicine"); 

  const openEditSelected = () => {
    if (!selectedMedicine) return;
    navigate(`/admin/medicine/update-medicine/${selectedMedicine.medicineId}`); 
  };

  const openViewSelected = () => {
    if (!selectedMedicine) return;
    setDetailMedicine(selectedMedicine);
  };

  const handleDeleteSelected = async () => {
    const medicine = selectedMedicine;
    if (!medicine) return;
    const result = await alertConfirm(
      `Thuốc [${medicine.brandName}] sẽ bị xóa vĩnh viễn!`,
      "Bạn có chắc chắn?",
      "btn-swal-danger",
    );
    if (result.isConfirmed) {
      try {
        await axiosClient.delete(`/medicines/${medicine.medicineId}`);
        alertSuccess("Thuốc đã được xóa thành công");
        setSelectedId(null);
        const isLastItemOnPage = medicines.length === 1 && currentPage > 1;
        fetchMedicines(
          isLastItemOnPage ? currentPage - 1 : currentPage,
          keyword.trim(),
          groupId,
        );
      } catch (err) {
        alertError(err || "Không thể xóa thuốc này");
      }
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
        title="Quản lý thuốc"
        subtitle="Danh sách thuốc trong kho"
        hasSelection={!!selectedMedicine}
        onSearch={handleSearch}
        searchValue={keyword}
        searchPlaceholder="Tìm theo tên, mã thuốc…"
        actions={{
          onCreate: openCreate,
          onView: openViewSelected,
          onEdit: openEditSelected,
          onDelete: handleDeleteSelected,
        }}
      />

      <div className="p-6 min-h-screen">
        {/* Dropdown lọc theo nhóm thuốc */}
        <div className="mb-4 flex items-center gap-3">
          <label className="text-sm font-medium text-gray-800 flex items-center gap-1.5">
            <FaLayerGroup className="text-black" /> Nhóm thuốc:
          </label>
          <select
            value={groupId}
            onChange={(e) => handleChangeGroup(e.target.value)}
            className="px-3 py-2 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 bg-white min-w-[200px]"
          >
            <option value="all">Tất cả nhóm</option>
            {groups.map((g) => (
              <option key={g.groupId} value={g.groupId}>
                {g.groupName}
              </option>
            ))}
          </select>
        </div>

        <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-blue-600 border-b border-blue-800 text-white text-sm uppercase tracking-wider">
                  <th className="px-6 py-4 font-semibold">Mã thuốc</th>
                  <th className="px-6 py-4 font-semibold">Tên thuốc</th>
                  <th className="px-6 py-4 font-semibold">Đơn vị</th>
                  <th className="px-6 py-4 font-semibold">Xuất xứ</th>
                  <th className="px-6 py-4 font-semibold">Số đăng ký</th>
                  <th className="px-6 py-4 font-semibold">Tồn kho</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {medicines.length === 0 ? (
                  <tr>
                    <td
                      colSpan="6"
                      className="px-6 py-12 text-center text-gray-400"
                    >
                      Không tìm thấy thuốc phù hợp!
                    </td>
                  </tr>
                ) : (
                  medicines.map((m) => {
                    const isSelected = m.medicineId === selectedId;
                    const totalStock = m.totalStock ?? 0;
                    const isOutOfStock = totalStock === 0;
                    return (
                      <tr
                        key={m.medicineId}
                        onClick={() => toggleSelect(m)}
                        className={`cursor-pointer transition-colors duration-200 select-none border-b border-gray-100
                        ${
                          isSelected
                            ? "bg-blue-100 ring-1 ring-inset ring-blue-50"
                            : isOutOfStock
                              ? "bg-red-50/50"
                              : "hover:bg-gray-100"
                        }`}
                      >
                        {/* Mã thuốc */}
                        <td className="px-6 py-4">
                          <span className="text-xs text-blue-600 font-semibold bg-blue-50 px-2 py-0.5 rounded border border-blue-100">
                            {m.medicineCode}
                          </span>
                        </td>

                        {/* Tên thuốc */}
                        <td className="px-6 py-4 font-medium text-black">
                          {m.brandName}
                        </td>

                        {/* Đơn vị */}
                        <td className="px-6 py-4 text-sm text-black">
                          {m.unit}
                        </td>

                        {/* Xuất xứ */}
                        <td className="px-6 py-4 text-sm text-black">
                          {m.origin || "chưa cập nhật"}
                        </td>

                        {/* Số đăng ký */}
                        <td className="px-6 py-4 text-sm text-black">
                          {m.registrationNumber}
                        </td>

                        {/* Tồn kho */}
                        <td className="px-6 py-4">
                          <span
                            className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium border
                          ${
                            isOutOfStock
                              ? "bg-red-50 text-red-600 border-red-200"
                              : "bg-green-50 text-green-600 border-green-200"
                          }`}
                          >
                            <FaBoxesStacked className="shrink-0" />
                            {isOutOfStock
                              ? "Hết hàng"
                              : `${totalStock} ${m.unit || "đơn vị"}`}
                          </span>
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>

          {medicines.length > 0 && (
            <div className="px-6 py-3 border-t border-gray-100 bg-gray-50 flex items-center justify-between flex-wrap gap-3">
              <div className="flex items-center gap-2 text-sm text-gray-500">
                <span>
                  Tổng:{" "}
                  <span className="font-semibold text-gray-700">
                    {totalMedicines}
                  </span>{" "}
                  thuốc
                </span>
                {selectedMedicine && (
                  <span className="text-blue-600">
                    Đang chọn:{" "}
                    <span className="font-semibold">
                      {selectedMedicine.brandName}
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
      {detailMedicine && (
        <Modal title="CHI TIẾT THUỐC" onClose={() => setDetailMedicine(null)}>
          <div className="px-6 py-5 flex flex-col gap-4">
            <div>
              <div className="text-black font-bold text-lg leading-tight">
                {detailMedicine.brandName}
              </div>
              <div className="text-blue-600 text-sm mt-0.5">
                {detailMedicine.medicineCode}
              </div>
            </div>

            <div className="grid grid-cols-2 gap-x-6 gap-y-4 text-sm">
              <div>
                <div className="text-gray-700 text-xs mb-0.5">Đơn vị</div>
                <div className="text-black font-medium">
                  {detailMedicine.unit}
                </div>
              </div>
              <div>
                <div className="text-gray-700 text-xs mb-0.5">Xuất xứ</div>
                <div className="text-black font-medium">
                  {detailMedicine.origin || "chưa cập nhật"}
                </div>
              </div>
              <div>
                <div className="text-gray-700 text-xs mb-0.5">Số đăng ký</div>
                <div className="text-black font-medium">
                  {detailMedicine.registrationNumber}
                </div>
              </div>
              <div>
                <div className="text-gray-700 text-xs mb-0.5 flex items-center gap-1.5">
                  <FaBoxesStacked /> Tồn kho
                </div>
                <div
                  className={`font-medium ${(detailMedicine.totalStock ?? 0) === 0 ? "text-red-600" : "text-black"}`}
                >
                  {(detailMedicine.totalStock ?? 0) === 0
                    ? "Hết hàng"
                    : `${detailMedicine.totalStock} ${detailMedicine.unit || "đơn vị"}`}
                </div>
              </div>
            </div>

            {/* Danh sách hoạt chất */}
            {detailMedicine.ingredientDetailInfo?.length > 0 && (
              <div className="pt-2 border-t border-gray-100">
                <div className="text-gray-400 text-xs mb-2 flex items-center gap-1.5">
                  <FaFlask /> Thành phần hoạt chất
                </div>
                <ul className="flex flex-col gap-1.5">
                  {detailMedicine.ingredientDetailInfo.map((d, idx) => (
                    <li
                      key={idx}
                      className="text-sm text-gray-700 flex items-center justify-between bg-gray-50 rounded-md px-3 py-1.5"
                    >
                      <span>{d.ingredientInfo?.ingredientName || "đang cập nhật"}</span>
                      {d.dosage && (
                        <span className="text-gray-500 text-xs">
                          {d.dosage}
                        </span>
                      )}
                    </li>
                  ))}
                </ul>
              </div>
            )}

            {(detailMedicine.totalStock ?? 0) === 0 && (
              <div className="flex items-center gap-2 text-red-600 bg-red-50 border border-red-200 rounded-md px-3 py-2 text-sm">
                <FaTriangleExclamation className="shrink-0" />
                Thuốc này hiện đã hết hàng trong kho.
              </div>
            )}
          </div>

          <div className="px-6 py-4 border-t border-gray-100 flex justify-end gap-2">
            <button
              onClick={() => {
                setDetailMedicine(null);
                navigate(
                  `/admin/medicine/update-medicine/${detailMedicine.medicineId}`,
                );
              }}
              className="btn-gradient px-4 py-2 text-sm font-medium"
            >
              Chỉnh sửa
            </button>
            <button
              onClick={() => setDetailMedicine(null)}
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
