import { Link } from "react-router-dom";
import { FiEye } from "react-icons/fi";

export function MedicineCard({ p }) {
  return (
    <div className="group bg-white border border-gray-200 rounded-2xl overflow-hidden hover:shadow-lg hover:border-blue-300 hover:-translate-y-1 transition-all duration-300 flex flex-col">
      {/* KHU VỰC HÌNH ẢNH */}
      <div className="relative aspect-square bg-gray-50 overflow-hidden flex items-center justify-center p-4">
        <img
          src={p.imageUrl || "/placeholder-medicine.png"}
          alt={p.brandName}
          loading="lazy"
          className="h-full w-full object-contain mix-blend-multiply group-hover:scale-105 transition-transform duration-500"
        />

        {/* Hiển thị trạng thái (nếu hết hàng hoặc ngừng cung cấp) */}
        {p.status === "hết hàng" && (
          <span className="absolute top-3 right-3 bg-red-500 text-white text-[10px] uppercase font-bold px-2.5 py-1 rounded-md tracking-wider shadow-sm">
            Hết hàng
          </span>
        )}
        {p.status === "ngừng cung cấp" && (
          <span className="absolute top-3 right-3 bg-gray-500 text-white text-[10px] uppercase font-bold px-2.5 py-1 rounded-md tracking-wider shadow-sm">
            Ngừng bán
          </span>
        )}
      </div>

      {/* KHU VỰC THÔNG TIN */}
      <div className="p-5 flex-1 flex flex-col">
        {/* Đơn vị tính */}
        <div className="text-[12px] uppercase tracking-wider text-blue-500 font-bold mb-1.5">
          {p.unit}
        </div>

        {/* Tên thương hiệu thuốc */}
        <h3 className="font-bold text-[15px] text-gray-900 leading-snug line-clamp-2">
          {p.brandName}
        </h3>

        {/* Dòng hiển thị Xuất xứ */}
        <div className="text-[13px] text-gray-500 mt-1.5 mb-2">
          Xuất xứ:{" "}
          <span className="font-semibold text-gray-700">
            {p.origin || "Chưa cập nhật"}
          </span>
        </div>

        {/* Khu vực Giá và Nút hành động */}
        <div className="mt-auto pt-4 border-t border-gray-100">
          <div className="flex items-baseline gap-2 mb-3">
            <span className="text-blue-600 font-extrabold text-lg">
              {/* Định dạng giá */}
              {p.price > 0
                ? Number(p.price).toLocaleString("vi-VN") + "đ"
                : "Liên hệ"}
            </span>
          </div>

          {/* Nút Xem chi tiết */}
          <Link
            to={`/medicineDetail/${p.medicineId}`}
            className="w-full bg-blue-50 text-blue-600 hover:bg-blue-600 hover:text-white rounded-xl py-2.5 text-sm font-bold flex items-center justify-center gap-2 transition-colors duration-300"
          >
            <FiEye className="text-lg" /> Xem chi tiết
          </Link>
        </div>
      </div>
    </div>
  );
}
