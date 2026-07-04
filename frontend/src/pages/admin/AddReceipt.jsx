import { useState, useEffect, useMemo, useRef, useCallback } from "react";
import { Topbar } from "../../components/admin/TopBar";
import axiosClient from "../../api/axiosClient";
import { alertSuccess, alertError, alertWarning, alertConfirm } from "../../utils/SwalAlert";
import { FaPlus, FaTrashCan, FaMagnifyingGlass } from "react-icons/fa6";

function formatCurrency(value) {
  const n = Number(value);
  if (!value && value !== 0) return "";
  if (Number.isNaN(n)) return "";
  return n.toLocaleString("vi-VN") + "đ";
}

function todayISO() {
  return new Date().toISOString().slice(0, 10); // YYYY-MM-DD
}

const NO_SPINNER = "[appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none";

function InlineInput({
  label,
  value,
  onChange,
  onBlur,
  placeholder,
  type = "text",
  readOnly = false,
  noSpinner = false,
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
        onBlur={onBlur}
        placeholder={placeholder}
        readOnly={readOnly}
        className={`px-3 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 h-10
          ${readOnly ? "bg-gray-100 text-gray-600 cursor-not-allowed border-gray-200" : "border-gray-300 bg-white"}
          ${noSpinner ? NO_SPINNER : ""}`}
      />
    </div>
  );
}

function MedicineSearchInput({ onSelect }) {
  const [query, setQuery] = useState("");
  const [results, setResults] = useState([]);
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);
  const ref = useRef(null);
  const debounceRef = useRef(null);

  useEffect(() => {
    const handler = (e) => {
      if (ref.current && !ref.current.contains(e.target)) setOpen(false);
    };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, []);

  const runSearch = useCallback((keyword) => {
    if (!keyword.trim()) {
      setResults([]);
      return;
    }
    setLoading(true);
    axiosClient
      .get("/medicines", { params: { search: keyword.trim(), limit: 10 } })
      .then((res) => setResults(res.data.data ?? []))
      .catch(() => setResults([]))
      .finally(() => setLoading(false));
  }, []);

  const handleChange = (e) => {
    const val = e.target.value;
    setQuery(val);
    setOpen(true);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => runSearch(val), 350);
  };

  const handleSelect = (m) => {
    onSelect(m);
    setQuery(m.brandName || "");
    setOpen(false);
  };

  return (
    <div ref={ref} className="relative flex-1 min-w-[220px]">
      <div className="flex items-center border border-gray-300 rounded-lg bg-white overflow-hidden h-10 focus-within:ring-2 focus-within:ring-blue-500">
        <FaMagnifyingGlass className="ml-3 text-gray-400 h-4 w-4 shrink-0" />
        <input
          value={query}
          onChange={handleChange}
          onFocus={() => query && setOpen(true)}
          placeholder="Tên, mã thuốc…"
          className="flex-1 px-3 py-2 text-sm outline-none bg-transparent"
        />
      </div>
      {open && (loading || results.length > 0) && (
        <div className="absolute z-50 top-11 left-0 right-0 bg-white border border-gray-200 rounded-lg shadow-lg max-h-56 overflow-y-auto">
          {loading ? (
            <div className="px-4 py-3 text-sm text-gray-400 flex items-center gap-2">
              <span className="h-3 w-3 rounded-full border-2 border-gray-300 border-t-blue-500 animate-spin" />
              Đang tìm...
            </div>
          ) : (
            results.map((m) => (
              <button
                key={m.medicineId}
                onMouseDown={() => handleSelect(m)}
                className="w-full text-left px-4 py-2.5 text-sm hover:bg-blue-50 transition flex items-center gap-3"
              >
                <span className="text-xs font-mono text-blue-600 bg-blue-50 px-1.5 py-0.5 rounded border border-blue-100 shrink-0">
                  {m.medicineCode}
                </span>
                <span className="text-gray-800">{m.brandName}</span>
                <span className="ml-auto text-gray-400 text-xs shrink-0">
                  {m.unit || ""}
                </span>
              </button>
            ))
          )}
        </div>
      )}
    </div>
  );
}

const EMPTY_ROW = {
  selectedMedicine: null,
  unit: "",
  batchNumber: "",
  productionDate: "",
  expiryDate: "",
  quantity: "1",
  importPrice: "",
  batchChecked: false,
  isOldBatch: false,
};

export default function ImportReceiptCreate() {
  const [suppliers, setSuppliers] = useState([]);

  const [receiptCode, setReceiptCode] = useState("");
  const [receiptDate, setReceiptDate] = useState(todayISO());
  const [supplierId, setSupplierId] = useState("");

  const [row, setRow] = useState(EMPTY_ROW);
  const [items, setItems] = useState([]);

  useEffect(() => {
    axiosClient
      .get("/suppliers")
      .then((r) => setSuppliers(r.data.data ?? []))
      .catch(() => alertError("Không thể tải danh sách nhà cung cấp"));
  }, []);

  const handleSelectMedicine = (m) => {
    setRow((prev) => ({
      ...EMPTY_ROW,
      selectedMedicine: m,
      unit: m.unit || "",
    }));
  };

  const handleBatchNumberBlur = useCallback(async () => {
    const { selectedMedicine, batchNumber } = row;
    if (!selectedMedicine || !batchNumber.trim()) return;
    if (row.batchChecked) return;

    try {
      const res = await axiosClient.get("/batches/check", {
        params: {
          medicineId: selectedMedicine.medicineId,
          batchNumber: batchNumber.trim(),
        },
      });
      const { exists, batch } = res.data;

      if (exists && batch) {
        setRow((prev) => ({
          ...prev,
          productionDate: batch.productionDate ?? "",
          expiryDate: batch.expiryDate ?? "",
          batchChecked: true,
          isOldBatch: true,
        }));
      } else {
        setRow((prev) => ({ ...prev, batchChecked: true, isOldBatch: false }));
      }
    } catch {
      setRow((prev) => ({ ...prev, batchChecked: true }));
    }
  }, [row]);

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

    if (!selectedMedicine) return alertWarning("Vui lòng chọn thuốc cần nhập");
    if (!batchNumber.trim()) return alertWarning("Vui lòng nhập số lô");
    if (!Number.isInteger(Number(quantity)) || Number(quantity) < 1)
      return alertWarning("Số lượng phải là số nguyên >= 1");
    if (importPrice === "" || Number(importPrice) < 0)
      return alertWarning("Vui lòng nhập giá nhập hợp lệ");

    if (!row.batchChecked) await handleBatchNumberBlur();

    if (!row.isOldBatch) {
      if (!productionDate)
        return alertWarning("Lô mới cần nhập NSX");
      if (!expiryDate)
        return alertWarning("Lô mới cần nhập HSD");
      if (new Date(expiryDate) <= new Date(productionDate))
        return alertWarning("HSD phải sau NSX");
    }

    const dup = items.find(
      (i) =>
        i.medicineId === selectedMedicine.medicineId &&
        i.batchNumber.toLowerCase() === batchNumber.trim().toLowerCase(),
    );
    if (dup)
      return alertWarning(
        `Lô "${batchNumber.trim()}" của thuốc này đã có trong phiếu, vui lòng check lại`,
      );

    setItems((prev) => [
      ...prev,
      {
        key: Date.now(),
        medicineId: selectedMedicine.medicineId,
        medicineCode: selectedMedicine.medicineCode,
        brandName: selectedMedicine.brandName,
        unit: row.unit || selectedMedicine.unit || "chưa cập nhật",
        batchNumber: batchNumber.trim(),
        productionDate: productionDate || null,
        expiryDate: expiryDate || null,
        importQuantity: Number(quantity),
        importPrice: Number(importPrice),
        isOldBatch,
      },
    ]);

    setRow((prev) => ({
      ...EMPTY_ROW,
      selectedMedicine: prev.selectedMedicine,
      unit: prev.unit,
    }));
  };

  const handleRemoveItem = (key) =>
    setItems((prev) => prev.filter((i) => i.key !== key));

  const totalAmount = useMemo(
    () => items.reduce((sum, i) => sum + i.importQuantity * i.importPrice, 0),
    [items],
  );

  const handleCancel = async () => {
    if (items.length === 0 && !supplierId && !receiptCode) return;
    const result = await alertConfirm(
      "Toàn bộ thông tin đã nhập sẽ bị xóa.",
      "Hủy bỏ phiếu nhập?",
      "btn-swal-danger",
    );
    if (result.isConfirmed) {
      setItems([]);
      setSupplierId("");
      setReceiptCode("");
      setReceiptDate(todayISO());
      setRow(EMPTY_ROW);
    }
  };

  const handleSubmit = async () => {
    if (!receiptCode.trim()) return alertWarning("Vui lòng nhập mã phiếu nhập");
    if (!supplierId) return alertWarning("Vui lòng chọn nhà cung cấp");
    if (items.length === 0)
      return alertWarning("Vui lòng thêm ít nhất một loại thuốc");

    const payload = {
      receiptCode: receiptCode.trim(),
      receiptDate,
      supplierId: Number(supplierId),
      details: items.map((i) => ({
        medicineId: i.medicineId,
        batchNumber: i.batchNumber,
        productionDate: i.productionDate || undefined,
        expiryDate: i.expiryDate || undefined,
        importQuantity: i.importQuantity,
        importPrice: i.importPrice,
      })),
    };

    try {
      await axiosClient.post("/warehouse-receipts", payload);
      alertSuccess("Lưu phiếu nhập thành công");
      setItems([]);
      setSupplierId("");
      setReceiptCode("");
      setReceiptDate(todayISO());
      setRow(EMPTY_ROW);
    } catch (err) {
      const msg = err.response?.data?.message || "Lỗi khi lưu phiếu nhập";
      const errs = err.response?.data?.errors;
      alertError(errs ? `${msg}\n ${errs.join("\n ")}` : msg);
    }
  };

  return (
    <>
      <Topbar
        title="Phiếu nhập Thuốc"
        subtitle="Lập phiếu nhập Thuốc theo giấy tờ đã hoàn tất kiểm tra"
      />
      <div className="p-6 bg-gray-50 min-h-screen flex flex-col gap-4">
        {/*Mã phiếu nhập , Ngày nhập  */}
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm px-6 py-4">
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 items-end">
            <InlineInput
              label={
                <>
                  Mã phiếu nhập *
                </>
              }
              value={receiptCode}
              onChange={(e) => setReceiptCode(e.target.value.slice(0, 20))}
              placeholder="VD: PN0001"
            />

            <InlineInput
              label="Ngày nhập *"
              value={receiptDate}
              onChange={(e) => setReceiptDate(e.target.value)}
              type="date"
            />
          </div>
        </div>

        {/* Nhà cung cấp + Thuốc + ĐVT + Số lượng + Giá nhập + Thêm  */}
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm px-6 py-4">
          <div className="grid grid-cols-1 lg:grid-cols-[220px_1fr_90px_110px_130px_auto] gap-3 items-end">
            {/* Nhà cung cấp */}
            <div className="flex flex-col gap-1">
              <span className="text-xs text-gray-500 font-medium">
                Nhà cung cấp *
              </span>
              <div className="flex items-center gap-2">
                <select
                  value={supplierId}
                  onChange={(e) => setSupplierId(e.target.value)}
                  className="flex-1 px-3 py-2 h-10 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 bg-white"
                >
                  <option value=""> Chọn NCC </option>
                  {suppliers.map((s) => (
                    <option key={s.supplierId} value={s.supplierId}>
                      {s.supplierName}
                    </option>
                  ))}
                </select>
              </div>
            </div>

            {/* Tìm kiếm thuốc */}
            <div className="flex flex-col gap-1">
              <span className="text-xs text-gray-500 font-medium">
                Tìm kiếm thuốc *
              </span>
              <MedicineSearchInput onSelect={handleSelectMedicine} />
            </div>

            {/* Đơn vị tính */}
            <InlineInput
              label="ĐVT *"
              value={row.unit}
              onChange={(e) => setRow((p) => ({ ...p, unit: e.target.value }))}
              placeholder="Đơn vị"
            />

            {/* Số lượng */}
            <InlineInput
              label="Số lượng *"
              value={row.quantity}
              onChange={(e) =>
                setRow((p) => ({ ...p, quantity: e.target.value }))
              }
              placeholder="1"
              type="number"
              noSpinner
            />

            {/* Giá nhập */}
            <InlineInput
              label="Giá nhập *"
              value={row.importPrice}
              onChange={(e) =>
                setRow((p) => ({ ...p, importPrice: e.target.value }))
              }
              placeholder="0"
              type="number"
              noSpinner
            />

            {/* Nút Thêm */}
            <div className="flex flex-col gap-1">
              <span className="text-xs text-transparent select-none">.</span>
              <button
                onClick={handleAddItem}
                className="btn-gradient h-10 px-4 text-sm font-semibold flex items-center gap-2 whitespace-nowrap"
              >
                <FaPlus className="h-3.5 w-3.5" />
                Thêm
              </button>
            </div>
          </div>
        </div>

        {/* Số lô + NSX + HSD */}
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm px-6 py-4">
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-3 items-end">
            {/* Số lô */}
            <InlineInput
              label="Số lô *"
              value={row.batchNumber}
              onChange={handleBatchNumberChange}
              onBlur={handleBatchNumberBlur}
              placeholder="Số lô"
            />

            {/* Ngày sản xuất */}
            <InlineInput
              label={
                row.isOldBatch ? (
                  "Ngày SX (lô cũ)"
                ) : (
                  <>
                    NSX *
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

            {/* Hạn sử dụng */}
            <InlineInput
              label={
                row.isOldBatch ? (
                  "Hạn sử dụng (lô cũ)"
                ) : (
                  <>
                    HSD *
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
          </div>

          {/* Badge lô cũ / lô mới */}
          {row.batchChecked && (
            <div className="mt-3">
              {row.isOldBatch ? (
                <span className="text-xs px-2 py-0.5 rounded-full bg-blue-50 text-blue-600 border border-blue-200">
                  Lô cũ, NSX và HSD đã được điền tự động từ dữ liệu được lưu trữ
                </span>
              ) : (
                <span className="text-xs px-2 py-0.5 rounded-full bg-amber-50 text-amber-600 border border-amber-200">
                  Lô mới, vui lòng nhập NSX và HSD
                </span>
              )}
            </div>
          )}
        </div>

        {/* ── Bảng danh sách thuốc đã thêm ── */}
        <div className="bg-white rounded-xl border border-gray-100 shadow-sm overflow-hidden flex-1">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-blue-600 border-b border-blue-800 text-white text-sm uppercase tracking-wider">
                  <th className="px-4 py-3 font-semibold">Mã Thuốc</th>
                  <th className="px-4 py-3 font-semibold">Tên thuốc</th>
                  <th className="px-4 py-3 font-semibold">ĐVT</th>
                  <th className="px-4 py-3 font-semibold">Số lô</th>
                  <th className="px-4 py-3 font-semibold">NSX</th>
                  <th className="px-4 py-3 font-semibold">HSD</th>
                  <th className="px-4 py-3 font-semibold text-right">SL Nhập</th>
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
                        <span className="text-xs font-mono text-blue-600 bg-blue-50 px-2 py-0.5 rounded border border-blue-100">
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
                        {item.productionDate || "chưa cập nhật"}
                      </td>
                      <td className="px-4 py-3 text-gray-600">
                        {item.expiryDate || "chưa cập nhật"}
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

        {/* Nút hành động */}
        <div className="flex justify-end gap-3">
          <button
            onClick={handleCancel}
            className="btn-cancel px-8 py-2.5 font-semibold text-sm tracking-wide"
          >
            HỦY BỎ
          </button>
          <button
            onClick={handleSubmit}
            className="btn-gradient px-8 py-2.5 font-semibold text-sm tracking-wide"
          >
            LƯU PHIẾU
          </button>
        </div>
      </div>
    </>
  );
}