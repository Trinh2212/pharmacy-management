import { useState, useEffect, useMemo, useRef } from "react";
import { useNavigate } from "react-router-dom";
import { Topbar } from "../../components/admin/topbar";
import axiosClient from "../../api/axiosClient";
import Swal from "sweetalert2";
import {
  FaBoxesStacked,
  FaLayerGroup,
  FaXmark,
  FaTriangleExclamation,
  FaFlask,
} from "react-icons/fa6";

// ── Shared sub-components ─────────────────────────────────────────────────────
function Modal({ title, onClose, children }) {
  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm px-4 py-6"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-xl w-full max-w-lg flex flex-col"
        style={{ maxHeight: "calc(100vh - 48px)" }}
        onClick={(e) => e.stopPropagation()}
      >
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between shrink-0">
          <h3 className="text-xl font-bold text-teal-700">{title}</h3>
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

// ── Main component ────────────────────────────────────────────────────────────
export default function MedicineList() {
  const navigate = useNavigate();

  const [medicines, setMedicines] = useState([]);
  const [initialLoading, setInitialLoading] = useState(true);
  const [searching, setSearching] = useState(false);
  const [keyword, setKeyword] = useState("");
  const debounceRef = useRef(null);
  const hasLoadedOnce = useRef(false);

  // Phân trang
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalMedicines, setTotalMedicines] = useState(0);
  const LIMIT = 8;

  // Lọc theo nhóm thuốc
  const [groups, setGroups] = useState([]); // TODO: confirm API danh sách nhóm thuốc
  const [groupId, setGroupId] = useState("all");

  // Dòng đang được chọn
  const [selectedId, setSelectedId] = useState(null);
  const selectedMedicine = useMemo(
    () => medicines.find((m) => m.medicineId === selectedId) || null, // TODO: confirm PK là "medicineId"
    [medicines, selectedId],
  );

  const [detailMedicine, setDetailMedicine] = useState(null);

  // ── Fetch danh sách nhóm thuốc cho dropdown lọc ─────────────────────────────
  useEffect(() => {
    const fetchGroups = async () => {
      try {
        const res = await axiosClient.get("/medicine-groups"); // TODO: confirm endpoint
        setGroups(res.data.data || []);
      } catch {
        // Không chặn trang chính nếu lấy nhóm lỗi
      }
    };
    fetchGroups();
  }, []);

  // ── Fetch danh sách thuốc ────────────────────────────────────────────────────
  const fetchMedicines = async (page = 1, search = "", group = "all") => {
    try {
      if (!hasLoadedOnce.current) {
        setInitialLoading(true);
      } else {
        setSearching(true);
      }
      const res = await axiosClient.get("/medicines", {
        // TODO: confirm endpoint
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
      Swal.fire("Lỗi", "Không thể tải danh sách thuốc", "error");
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

  // Gõ tìm kiếm -> debounce 400ms, luôn quay về trang 1
  const handleSearch = (value) => {
    setKeyword(value);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      setSelectedId(null);
      fetchMedicines(1, value.trim(), groupId);
    }, 400);
  };

  // Đổi nhóm thuốc lọc -> quay về trang 1
  const handleChangeGroup = (value) => {
    setGroupId(value);
    setSelectedId(null);
    fetchMedicines(1, keyword.trim(), value);
  };

  // Chuyển trang
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

  // ── Điều hướng thêm / sửa ─────────────────────────────────────────────────
  const openCreate = () => navigate("/admin/add-medicine"); // TODO: confirm route

  const openEditSelected = () => {
    if (!selectedMedicine) return;
    navigate(`/admin/update-medicine/${selectedMedicine.medicineId}`); // TODO: confirm route
  };

  const openViewSelected = () => {
    if (!selectedMedicine) return;
    setDetailMedicine(selectedMedicine);
  };

  // ── Xóa (chỉ dòng đang chọn) ──────────────────────────────────────────────
  const handleDeleteSelected = async () => {
    const medicine = selectedMedicine;
    if (!medicine) return;
    const result = await Swal.fire({
      title: "Bạn có chắc chắn?",
      html: `Thuốc <b>${medicine.brandName}</b> sẽ bị xóa vĩnh viễn!`,
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#ef4444",
      cancelButtonColor: "#6b7280",
      confirmButtonText: "Vâng, xóa đi!",
      cancelButtonText: "Hủy",
    });
    if (result.isConfirmed) {
      try {
        await axiosClient.delete(`/medicines/${medicine.medicineId}`); // TODO: confirm endpoint
        Swal.fire({
          icon: "success",
          title: "Đã xóa!",
          text: "Thuốc đã được xóa.",
          timer: 1800,
          showConfirmButton: false,
        });
        setSelectedId(null);
        // Nếu xóa hết item ở trang cuối thì lùi về trang trước
        const isLastItemOnPage = medicines.length === 1 && currentPage > 1;
        fetchMedicines(
          isLastItemOnPage ? currentPage - 1 : currentPage,
          keyword.trim(),
          groupId,
        );
      } catch (err) {
        Swal.fire(
          "Lỗi",
          err.response?.data?.message || "Không thể xóa thuốc này",
          "error",
        );
      }
    }
  };

  // ── Loading lần đầu ───────────────────────────────────────────────────────
  if (initialLoading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-teal-600" />
        <span className="ml-2 text-teal-600 font-medium">
          Đang tải dữ liệu...
        </span>
      </div>
    );
  }

  // ── Render ──────────────────────────────────────────────────────────────────
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

      <div className="p-6 bg-gray-50 min-h-screen">
        {/* Dropdown lọc theo nhóm thuốc */}
        <div className="mb-4 flex items-center gap-3">
          <label className="text-sm font-medium text-gray-600 flex items-center gap-1.5">
            <FaLayerGroup className="text-gray-400" /> Nhóm thuốc:
          </label>
          <select
            value={groupId}
            onChange={(e) => handleChangeGroup(e.target.value)}
            className="px-3 py-2 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white min-w-[200px]"
          >
            <option value="all">Tất cả nhóm</option>
            {groups.map((g) => (
              <option key={g.groupId} value={g.groupId}>
                {g.groupName}
              </option> // TODO: confirm field groupName
            ))}
          </select>
        </div>

        <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-100 text-gray-600 text-sm uppercase tracking-wider">
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
                        className={`cursor-pointer transition select-none
              ${isSelected ? "bg-teal-50 ring-1 ring-inset ring-teal-300" : "hover:bg-gray-50"}
              ${isOutOfStock ? "bg-red-50/30" : ""}`}
                      >
                        {/* Cột 1: Mã thuốc */}
                        <td className="px-6 py-4">
                          <span className="text-xs text-teal-600 font-semibold bg-teal-50 px-2 py-0.5 rounded border border-teal-100">
                            {m.medicineCode}
                          </span>
                        </td>

                        {/* Cột 2: Tên thuốc */}
                        <td className="px-6 py-4 font-medium text-gray-900">
                          {m.brandName}
                        </td>

                        {/* Cột 3: Đơn vị */}
                        <td className="px-6 py-4 text-sm text-gray-600">
                          {m.unit}
                        </td>

                        {/* Cột 4: Xuất xứ */}
                        <td className="px-6 py-4 text-sm text-gray-600">
                          {m.origin || "—"}
                        </td>

                        {/* Cột 5: Số đăng ký */}
                        <td className="px-6 py-4 text-sm text-gray-600">
                          {m.registrationNumber}
                        </td>

                        {/* Cột 6: Tồn kho */}
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

          {/* Footer: tổng số + phân trang */}
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
                  <span className="text-teal-600">
                    · Đang chọn:{" "}
                    <span className="font-semibold">
                      {selectedMedicine.brandName}
                    </span>
                  </span>
                )}
                {searching && (
                  <span className="flex items-center gap-1.5 text-gray-400">
                    <span className="h-3 w-3 rounded-full border-2 border-gray-300 border-t-teal-500 animate-spin" />
                    Đang tìm kiếm...
                  </span>
                )}
              </div>

              {totalPages > 1 && (
                <div className="flex items-center gap-1.5">
                  <button
                    onClick={() => handleChangePage(currentPage - 1)}
                    disabled={currentPage === 1}
                    className="px-3 py-1.5 text-sm rounded-md border border-gray-300 bg-white text-gray-600 hover:bg-gray-100 disabled:opacity-40 disabled:cursor-not-allowed transition"
                  >
                    Trước
                  </button>
                  {Array.from({ length: totalPages }, (_, i) => i + 1).map(
                    (p) => (
                      <button
                        key={p}
                        onClick={() => handleChangePage(p)}
                        className={`w-8 h-8 text-sm rounded-md border transition
                        ${
                          p === currentPage
                            ? "bg-teal-600 text-white border-teal-600"
                            : "bg-white text-gray-600 border-gray-300 hover:bg-gray-100"
                        }`}
                      >
                        {p}
                      </button>
                    ),
                  )}
                  <button
                    onClick={() => handleChangePage(currentPage + 1)}
                    disabled={currentPage === totalPages}
                    className="px-3 py-1.5 text-sm rounded-md border border-gray-300 bg-white text-gray-600 hover:bg-gray-100 disabled:opacity-40 disabled:cursor-not-allowed transition"
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
              <div className="text-gray-900 font-bold text-lg leading-tight">
                {detailMedicine.brandName}
              </div>
              <div className="text-teal-600 text-sm mt-0.5">
                {detailMedicine.medicineCode}
              </div>
            </div>

            <div className="grid grid-cols-2 gap-x-6 gap-y-4 text-sm">
              <div>
                <div className="text-gray-400 text-xs mb-0.5">Đơn vị</div>
                <div className="text-gray-800 font-medium">
                  {detailMedicine.unit}
                </div>
              </div>
              <div>
                <div className="text-gray-400 text-xs mb-0.5">Xuất xứ</div>
                <div className="text-gray-800 font-medium">
                  {detailMedicine.origin || "—"}
                </div>
              </div>
              <div>
                <div className="text-gray-400 text-xs mb-0.5">Số đăng ký</div>
                <div className="text-gray-800 font-medium">
                  {detailMedicine.registrationNumber}
                </div>
              </div>
              <div>
                <div className="text-gray-400 text-xs mb-0.5 flex items-center gap-1.5">
                  <FaBoxesStacked /> Tồn kho
                </div>
                <div
                  className={`font-medium ${(detailMedicine.totalStock ?? 0) === 0 ? "text-red-600" : "text-gray-800"}`}
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
                      <span>{d.ingredientInfo?.ingredientName || "—"}</span>
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
                  `/admin/medicines/update/${detailMedicine.medicineId}`,
                );
              }}
              className="px-4 py-2 bg-teal-600 hover:bg-teal-700 text-white text-sm rounded-lg font-medium transition"
            >
              Chỉnh sửa
            </button>
            <button
              onClick={() => setDetailMedicine(null)}
              className="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 text-sm rounded-lg font-medium transition"
            >
              Đóng
            </button>
          </div>
        </Modal>
      )}
    </>
  );
}
