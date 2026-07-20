export function formatPrice(value) {
  const n = Number(value);
  if (value === null || value === undefined || value === "" || Number.isNaN(n)) {
    return "Liên hệ";
  }
  return n.toLocaleString("vi-VN") + "đ";
}

export function formatCurrency(value) {
  const n = Number(value);
  if (!value && value !== 0) return "";
  if (Number.isNaN(n)) return "";
  return n.toLocaleString("vi-VN") + "đ";
}

export function formatMonthLabel(monthStr) {
  if (!monthStr) return "";
  const [year, month] = monthStr.split("-");
  return `${month}/${year}`;
}

export function todayISO() {
  return new Date().toISOString().slice(0, 10); // YYYY-MM-DD
}

export function formatDate(value) {
  return value ? new Date(value).toLocaleDateString("vi-VN") : "đang cập nhật";
}
