import { useState, useEffect, useMemo, useRef, useCallback } from "react";
import { Topbar } from "../../components/admin/topbar";
import axiosClient from "../../api/axiosClient";
import Swal from "sweetalert2";
import {
  FaPlus,
  FaTrashCan,
  FaMagnifyingGlass,
  FaChevronDown,
} from "react-icons/fa6";

// ── Helpers ───────────────────────────────────────────────────────────────────
function formatCurrency(value) {
  const n = Number(value);
  if (!value && value !== 0) return "—";
  if (Number.isNaN(n)) return "—";
  return n.toLocaleString("vi-VN") + "đ";
}

function todayISO() {
  return new Date().toISOString().slice(0, 10); // YYYY-MM-DD
}

// ── Sub-components ────────────────────────────────────────────────────────────
function InlineInput({
  label,
  value,
  onChange,
  placeholder,
  type = "text",
  readOnly = false,
  className = "",
}) {
  return (
    <div className={`flex flex-col gap-1 ${className}`}>
      {label && (
        <span className="text-xs text-gray-500 font-medium">{label}</span>
      )}
      <input
        type={type}
        value={value}
        onChange={onChange}
        placeholder={placeholder}
        readOnly={readOnly}
        className={`px-3 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-teal-500 h-10
          ${readOnly ? "bg-gray-100 text-gray-600 cursor-not-allowed border-gray-200" : "border-gray-300 bg-white"}`}
      />
    </div>
  );
}

// Autocomplete dropdown tìm thuốc theo brandName / medicineCode
function MedicineSearchInput({ medicines, onSelect }) {
  const [query, setQuery] = useState("");
  const [open, setOpen] = useState(false);
  const ref = useRef(null);

  const filtered = useMemo(() => {
    if (!query.trim()) return [];
    const k = query.trim().toLowerCase();
    return medicines
      .filter((m) =>
        [m.medicineCode, m.brandName]
          .filter(Boolean)
          .some((v) => v.toLowerCase().includes(k)),
      )
      .slice(0, 10);
  }, [query, medicines]);

  useEffect(() => {
    const handler = (e) => {
      if (ref.current && !ref.current.contains(e.target)) setOpen(false);
    };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, []);

  const handleSelect = (m) => {
    onSelect(m);
    setQuery(m.brandName || "");
    setOpen(false);
  };

  return (
    <div ref={ref} className="relative flex-1 min-w-[220px]">
      <div className="flex items-center border border-gray-300 rounded-lg bg-white overflow-hidden h-10 focus-within:ring-2 focus-within:ring-teal-500">
        <FaMagnifyingGlass className="ml-3 text-gray-400 h-4 w-4 shrink-0" />
        <input
          value={query}
          onChange={(e) => {
            setQuery(e.target.value);
            setOpen(true);
          }}
          onFocus={() => query && setOpen(true)}
          placeholder="Tên, mã thuốc…"
          className="flex-1 px-3 py-2 text-sm outline-none bg-transparent"
        />
      </div>
      {open && filtered.length > 0 && (
        <div className="absolute z-50 top-11 left-0 right-0 bg-white border border-gray-200 rounded-lg shadow-lg max-h-56 overflow-y-auto">
          {filtered.map((m) => (
            <button
              key={m.medicineId}
              onMouseDown={() => handleSelect(m)}
              className="w-full text-left px-4 py-2.5 text-sm hover:bg-teal-50 transition flex items-center gap-3"
            >
              <span className="text-xs font-mono text-teal-600 bg-teal-50 px-1.5 py-0.5 rounded border border-teal-100 shrink-0">
                {m.medicineCode}
              </span>
              <span className="text-gray-800">{m.brandName}</span>
              <span className="ml-auto text-gray-400 text-xs shrink-0">
                {m.unit || ""}
              </span>
            </button>
          ))}
        </div>
      )}
    </div>
  );
}

// ── Giá trị mặc định hàng nhập liệu ─────────────────────────────────────────
const EMPTY_ROW = {
  selectedMedicine: null,
  unit: "",
  batchNumber: "",
  productionDate: "",
  expiryDate: "",
  quantity: "1",
  importPrice: "",
  // UI state
  batchChecked: false, // đã gọi /batches/check chưa
  isOldBatch: false, // lô cũ → lock productionDate + expiryDate
};

// ── Main component ────────────────────────────────────────────────────────────
export default function ImportReceiptCreate() {
  const [medicines, setMedicines] = useState([]);
  const [suppliers, setSuppliers] = useState([]);

  // Thông tin phiếu nhập
  const [receiptCode, setReceiptCode] = useState("");
  const [receiptDate, setReceiptDate] = useState(todayISO());
  const [supplierId, setSupplierId] = useState("");

  // Hàng nhập liệu hiện tại
  const [row, setRow] = useState(EMPTY_ROW);

  // Danh sách đã thêm vào phiếu
  const [items, setItems] = useState([]);

  // ── Fetch danh sách thuốc + NCC ──────────────────────────────────────────
  useEffect(() => {
    axiosClient
      .get("/medicines")
      .then((r) => setMedicines(r.data.data ?? []))
      .catch(() => Swal.fire("Lỗi", "Không thể tải danh sách thuốc", "error"));
    axiosClient
      .get("/suppliers")
      .then((r) => setSuppliers(r.data.data ?? []))
      .catch(() =>
        Swal.fire("Lỗi", "Không thể tải danh sách nhà cung cấp", "error"),
      );
  }, []);

  // ── Chọn thuốc từ autocomplete ────────────────────────────────────────────
  const handleSelectMedicine = (m) => {
    setRow((prev) => ({
      ...EMPTY_ROW, // reset lô khi đổi thuốc
      selectedMedicine: m,
      unit: m.unit || "",
    }));
  };

  // ── Kiểm tra lô khi blur khỏi field số lô ────────────────────────────────
  // Gọi GET /batches/check → lô cũ thì tự điền productionDate + expiryDate (readonly)
  const handleBatchNumberBlur = useCallback(async () => {
    const { selectedMedicine, batchNumber } = row;
    if (!selectedMedicine || !batchNumber.trim()) return;
    if (row.batchChecked) return; // đã check rồi, không gọi lại

    try {
      const res = await axiosClient.get("/batches/check", {
        params: {
          medicineId: selectedMedicine.medicineId,
          batchNumber: batchNumber.trim(),
        },
      });
      const { exists, batch } = res.data;

      if (exists && batch) {
        // Lô cũ → điền sẵn ngày, lock lại
        setRow((prev) => ({
          ...prev,
          productionDate: batch.productionDate ?? "",
          expiryDate: batch.expiryDate ?? "",
          batchChecked: true,
          isOldBatch: true,
        }));
      } else {
        // Lô mới → chỉ đánh dấu đã check, nhân viên nhập tay
        setRow((prev) => ({ ...prev, batchChecked: true, isOldBatch: false }));
      }
    } catch {
      // Không block UX nếu check thất bại, nhân viên vẫn nhập được
      setRow((prev) => ({ ...prev, batchChecked: true }));
    }
  }, [row]);

  // Reset trạng thái check lô khi nhân viên sửa lại số lô
  const handleBatchNumberChange = (e) => {
    setRow((prev) => ({
      ...prev,
      batchNumber: e.target.value,
      batchChecked: false,
      isOldBatch: false,
      productionDate: "",
      expiryDate: "",
    }));
  };

  // ── Thêm dòng vào bảng ───────────────────────────────────────────────────
  const handleAddItem = async () => {
    const {
      selectedMedicine,
      batchNumber,
      productionDate,
      expiryDate,
      quantity,
      importPrice,
      isOldBatch,
    } = row;

    if (!selectedMedicine)
      return Swal.fire("Cảnh báo", "Vui lòng chọn thuốc cần nhập", "warning");
    if (!batchNumber.trim())
      return Swal.fire("Cảnh báo", "Vui lòng nhập số lô", "warning");
    if (!Number.isInteger(Number(quantity)) || Number(quantity) < 1)
      return Swal.fire(
        "Cảnh báo",
        "Số lượng phải là số nguyên >= 1",
        "warning",
      );
    if (importPrice === "" || Number(importPrice) < 0)
      return Swal.fire("Cảnh báo", "Vui lòng nhập giá nhập hợp lệ", "warning");

    // Nếu chưa check lô → check ngay trước khi thêm
    if (!row.batchChecked) await handleBatchNumberBlur();

    // Lô mới bắt buộc nhập productionDate + expiryDate
    if (!row.isOldBatch) {
      if (!productionDate)
        return Swal.fire(
          "Cảnh báo",
          "Lô mới cần nhập ngày sản xuất (YYYY-MM-DD)",
          "warning",
        );
      if (!expiryDate)
        return Swal.fire(
          "Cảnh báo",
          "Lô mới cần nhập hạn sử dụng (YYYY-MM-DD)",
          "warning",
        );
      if (new Date(expiryDate) <= new Date(productionDate))
        return Swal.fire(
          "Cảnh báo",
          "Hạn sử dụng phải sau ngày sản xuất",
          "warning",
        );
    }

    // Kiểm tra trùng dòng trong phiếu hiện tại
    const dup = items.find(
      (i) =>
        i.medicineId === selectedMedicine.medicineId &&
        i.batchNumber.toLowerCase() === batchNumber.trim().toLowerCase(),
    );
    if (dup)
      return Swal.fire(
        "Cảnh báo",
        `Lô "${batchNumber.trim()}" của thuốc này đã có trong phiếu, vui lòng gộp lại`,
        "warning",
      );

    setItems((prev) => [
      ...prev,
      {
        key: Date.now(),
        medicineId: selectedMedicine.medicineId,
        medicineCode: selectedMedicine.medicineCode,
        brandName: selectedMedicine.brandName,
        unit: row.unit || selectedMedicine.unit || "—",
        batchNumber: batchNumber.trim(),
        productionDate: productionDate || null,
        expiryDate: expiryDate || null,
        importQuantity: Number(quantity),
        importPrice: Number(importPrice),
        isOldBatch,
      },
    ]);

    // Reset hàng nhập liệu, giữ lại thuốc + đơn vị để nhập nhanh lô khác
    setRow((prev) => ({
      ...EMPTY_ROW,
      selectedMedicine: prev.selectedMedicine,
      unit: prev.unit,
    }));
  };

  const handleRemoveItem = (key) =>
    setItems((prev) => prev.filter((i) => i.key !== key));

  // ── Tổng tiền ─────────────────────────────────────────────────────────────
  const totalAmount = useMemo(
    () => items.reduce((sum, i) => sum + i.importQuantity * i.importPrice, 0),
    [items],
  );

  // ── Hủy bỏ ───────────────────────────────────────────────────────────────
  const handleCancel = async () => {
    if (items.length === 0 && !supplierId && !receiptCode) return;
    const result = await Swal.fire({
      title: "Hủy bỏ phiếu nhập?",
      text: "Toàn bộ thông tin đã nhập sẽ bị xóa.",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#ef4444",
      cancelButtonColor: "#6b7280",
      confirmButtonText: "Vâng, hủy bỏ",
      cancelButtonText: "Tiếp tục nhập",
    });
    if (result.isConfirmed) {
      setItems([]);
      setSupplierId("");
      setReceiptCode("");
      setReceiptDate(todayISO());
      setRow(EMPTY_ROW);
    }
  };

  // ── Lưu phiếu → POST /warehouse-receipts ─────────────────────────────────
  const handleSubmit = async () => {
    if (!receiptCode.trim())
      return Swal.fire("Cảnh báo", "Vui lòng nhập mã phiếu nhập", "warning");
    if (!supplierId)
      return Swal.fire("Cảnh báo", "Vui lòng chọn nhà cung cấp", "warning");
    if (items.length === 0)
      return Swal.fire(
        "Cảnh báo",
        "Vui lòng thêm ít nhất một loại thuốc",
        "warning",
      );

    const payload = {
      receiptCode: receiptCode.trim(),
      receiptDate,
      supplierId: Number(supplierId),
      details: items.map((i) => ({
        medicineId: i.medicineId,
        batchNumber: i.batchNumber,
        productionDate: i.productionDate || undefined, // undefined → Joi bỏ qua (optional)
        expiryDate: i.expiryDate || undefined,
        importQuantity: i.importQuantity,
        importPrice: i.importPrice,
      })),
    };

    try {
      await axiosClient.post("/warehouse-receipts", payload);
      await Swal.fire({
        icon: "success",
        title: "Lưu phiếu nhập thành công",
        timer: 1800,
        showConfirmButton: false,
      });
      setItems([]);
      setSupplierId("");
      setReceiptCode("");
      setReceiptDate(todayISO());
      setRow(EMPTY_ROW);
    } catch (err) {
      const msg = err.response?.data?.message || "Lỗi khi lưu phiếu nhập";
      const errs = err.response?.data?.errors;
      Swal.fire("Lỗi", errs ? `${msg}\n• ${errs.join("\n• ")}` : msg, "error");
    }
  };

  // ── Render ────────────────────────────────────────────────────────────────
  return (
    <>
      <Topbar
        title="Phiếu nhập hàng"
        subtitle="Lập phiếu nhập hàng từ nhà cung cấp"
      />

      <div className="p-6 bg-gray-50 min-h-screen flex flex-col gap-4">
        {/* ── HÀNG 1: Thông tin phiếu nhập ── */}
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm px-6 py-4">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 items-end">
            {/* Chọn nhà cung cấp */}
            <div className="flex flex-col gap-1">
              <span className="text-xs text-gray-500 font-medium">
                Nhà cung cấp <span className="text-red-500">*</span>
              </span>
              <div className="flex items-center gap-2">
                <select
                  value={supplierId}
                  onChange={(e) => setSupplierId(e.target.value)}
                  className="flex-1 px-3 py-2 h-10 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white"
                >
                  <option value="">— Chọn NCC —</option>
                  {suppliers.map((s) => (
                    <option key={s.supplierId} value={s.supplierId}>
                      {s.supplierName}
                    </option>
                  ))}
                </select>
                <a
                  href="/admin/suppliers"
                  title="Thêm nhà cung cấp mới"
                  className="h-10 w-10 shrink-0 grid place-items-center rounded-lg bg-green-500 hover:bg-green-600 text-white transition"
                >
                  <FaPlus className="h-3.5 w-3.5" />
                </a>
              </div>
            </div>

            {/* Mã phiếu nhập — nhân viên tự nhập, max 20 ký tự */}
            <InlineInput
              label={
                <>
                  Mã phiếu nhập <span className="text-red-500">*</span>
                </>
              }
              value={receiptCode}
              onChange={(e) => setReceiptCode(e.target.value.slice(0, 20))}
              placeholder="VD: PN0001"
            />

            {/* Ngày nhập */}
            <InlineInput
              label="Ngày nhập"
              value={receiptDate}
              onChange={(e) => setReceiptDate(e.target.value)}
              type="date"
            />

            {/* Tổng tiền (readonly, tính tự động) */}
            <InlineInput
              label="Tổng tiền"
              value={totalAmount > 0 ? formatCurrency(totalAmount) : ""}
              placeholder="Tự động tính"
              readOnly
            />
          </div>
        </div>

        {/* ── HÀNG 2: Tìm kiếm thuốc + nhập thông tin lô ── */}
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm px-6 py-4">
          <div className="grid grid-cols-1 lg:grid-cols-[1fr_100px_140px_150px_150px_110px_130px_auto] gap-3 items-end">
            {/* Tìm kiếm thuốc */}
            <div className="flex flex-col gap-1">
              <span className="text-xs text-gray-500 font-medium">
                Tìm kiếm thuốc
              </span>
              <MedicineSearchInput
                medicines={medicines}
                onSelect={handleSelectMedicine}
              />
            </div>

            {/* Đơn vị tính */}
            <InlineInput
              label="ĐVT"
              value={row.unit}
              onChange={(e) => setRow((p) => ({ ...p, unit: e.target.value }))}
              placeholder="Đơn vị"
            />

            {/* Số lô — blur → gọi /batches/check */}
            <InlineInput
              label="Số lô"
              value={row.batchNumber}
              onChange={handleBatchNumberChange}
              onBlur={handleBatchNumberBlur}
              placeholder="Số lô"
            />

            {/* Ngày sản xuất — readonly nếu lô cũ */}
            <InlineInput
              label={
                row.isOldBatch ? (
                  "Ngày SX (lô cũ)"
                ) : (
                  <>
                    Ngày SX <span className="text-red-500">*</span>
                  </>
                )
              }
              value={row.productionDate}
              onChange={(e) =>
                setRow((p) => ({ ...p, productionDate: e.target.value }))
              }
              placeholder="YYYY-MM-DD"
              type="date"
              readOnly={row.isOldBatch}
            />

            {/* Hạn sử dụng — readonly nếu lô cũ */}
            <InlineInput
              label={
                row.isOldBatch ? (
                  "Hạn dùng (lô cũ)"
                ) : (
                  <>
                    Hạn dùng <span className="text-red-500">*</span>
                  </>
                )
              }
              value={row.expiryDate}
              onChange={(e) =>
                setRow((p) => ({ ...p, expiryDate: e.target.value }))
              }
              placeholder="YYYY-MM-DD"
              type="date"
              readOnly={row.isOldBatch}
            />

            {/* Số lượng */}
            <InlineInput
              label="Số lượng"
              value={row.quantity}
              onChange={(e) =>
                setRow((p) => ({ ...p, quantity: e.target.value }))
              }
              placeholder="1"
              type="number"
            />

            {/* Giá nhập */}
            <InlineInput
              label="Giá nhập"
              value={row.importPrice}
              onChange={(e) =>
                setRow((p) => ({ ...p, importPrice: e.target.value }))
              }
              placeholder="0"
              type="number"
            />

            {/* Nút Thêm */}
            <div className="flex flex-col gap-1">
              <span className="text-xs text-transparent select-none">.</span>
              <button
                onClick={handleAddItem}
                className="h-10 px-4 bg-green-600 hover:bg-green-700 text-white rounded-lg text-sm font-semibold transition flex items-center gap-2 whitespace-nowrap"
              >
                <FaPlus className="h-3.5 w-3.5" />
                Thêm
              </button>
            </div>
          </div>

          {/* Badge lô cũ / lô mới */}
          {row.batchChecked && (
            <div className="mt-2">
              {row.isOldBatch ? (
                <span className="text-xs px-2 py-0.5 rounded-full bg-blue-50 text-blue-600 border border-blue-200">
                  ● Lô cũ — ngày SX và hạn dùng đã được điền tự động
                </span>
              ) : (
                <span className="text-xs px-2 py-0.5 rounded-full bg-amber-50 text-amber-600 border border-amber-200">
                  ● Lô mới — vui lòng nhập ngày SX và hạn dùng
                </span>
              )}
            </div>
          )}
        </div>

        {/* ── HÀNG 3: Bảng danh sách thuốc đã thêm ── */}
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm overflow-hidden flex-1">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-100 text-gray-600 text-sm uppercase tracking-wider">
                  <th className="px-4 py-3 font-semibold">Mã SP</th>
                  <th className="px-4 py-3 font-semibold">Tên thuốc</th>
                  <th className="px-4 py-3 font-semibold">ĐVT</th>
                  <th className="px-4 py-3 font-semibold">Số lô</th>
                  <th className="px-4 py-3 font-semibold">Ngày SX</th>
                  <th className="px-4 py-3 font-semibold">Hạn dùng</th>
                  <th className="px-4 py-3 font-semibold text-right">SL</th>
                  <th className="px-4 py-3 font-semibold text-right">
                    Giá nhập
                  </th>
                  <th className="px-4 py-3 font-semibold text-right">
                    Thành tiền
                  </th>
                  <th className="px-4 py-3"></th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {items.length === 0 ? (
                  <tr>
                    <td
                      colSpan="10"
                      className="px-6 py-16 text-center text-gray-400 text-sm"
                    >
                      Chưa có sản phẩm nào trong phiếu nhập
                    </td>
                  </tr>
                ) : (
                  items.map((item) => (
                    <tr
                      key={item.key}
                      className="hover:bg-gray-50 transition text-sm"
                    >
                      <td className="px-4 py-3">
                        <span className="text-xs font-mono text-teal-600 bg-teal-50 px-2 py-0.5 rounded border border-teal-100">
                          {item.medicineCode}
                        </span>
                      </td>
                      <td className="px-4 py-3 font-medium text-gray-900">
                        {item.brandName}
                      </td>
                      <td className="px-4 py-3 text-gray-600">{item.unit}</td>
                      <td className="px-4 py-3 text-gray-600">
                        <span className="flex items-center gap-1.5">
                          {item.batchNumber}
                          {item.isOldBatch ? (
                            <span className="text-[10px] text-blue-500 border border-blue-200 bg-blue-50 px-1 rounded">
                              cũ
                            </span>
                          ) : (
                            <span className="text-[10px] text-amber-500 border border-amber-200 bg-amber-50 px-1 rounded">
                              mới
                            </span>
                          )}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-gray-600">
                        {item.productionDate || "—"}
                      </td>
                      <td className="px-4 py-3 text-gray-600">
                        {item.expiryDate || "—"}
                      </td>
                      <td className="px-4 py-3 text-right text-gray-800">
                        {item.importQuantity}
                      </td>
                      <td className="px-4 py-3 text-right text-gray-800">
                        {formatCurrency(item.importPrice)}
                      </td>
                      <td className="px-4 py-3 text-right font-semibold text-gray-900">
                        {formatCurrency(item.importQuantity * item.importPrice)}
                      </td>
                      <td className="px-4 py-3 text-right">
                        <button
                          onClick={() => handleRemoveItem(item.key)}
                          title="Xóa khỏi phiếu"
                          className="p-1.5 text-red-500 hover:bg-red-50 rounded transition"
                        >
                          <FaTrashCan className="h-3.5 w-3.5" />
                        </button>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
              {items.length > 0 && (
                <tfoot>
                  <tr className="bg-gray-50 border-t-2 border-gray-200">
                    <td
                      colSpan="8"
                      className="px-4 py-3 text-right font-bold text-gray-700"
                    >
                      Tổng hóa đơn:
                    </td>
                    <td className="px-4 py-3 text-right font-bold text-red-600 text-base">
                      {formatCurrency(totalAmount)}
                    </td>
                    <td />
                  </tr>
                </tfoot>
              )}
            </table>
          </div>
        </div>

        {/* ── HÀNG 4: Nút hành động ── */}
        <div className="flex justify-end gap-3">
          <button
            onClick={handleCancel}
            className="px-8 py-2.5 bg-red-500 hover:bg-red-600 text-white rounded-lg font-semibold text-sm tracking-wide transition"
          >
            HỦY BỎ
          </button>
          <button
            onClick={handleSubmit}
            className="px-8 py-2.5 bg-green-600 hover:bg-green-700 text-white rounded-lg font-semibold text-sm tracking-wide transition"
          >
            LƯU PHIẾU
          </button>
        </div>
      </div>
    </>
  );
}
