import { Link } from "react-router-dom";
import { FiEye } from "react-icons/fi";
import {fileUrl} from "../../utils/FileUrl";
import { formatPrice } from "../../utils/Format";

export function MedicineCard({ p }) {
  return (
    <div className="group bg-white border border-gray-200 rounded-2xl overflow-hidden hover:shadow-lg hover:border-blue-300 hover:-translate-y-1 transition-all duration-300 flex flex-col">
      {/* img */}
      <div className="relative aspect-square bg-gray-50 overflow-hidden flex items-center justify-center p-4">
        <img
          src={
            fileUrl(p.imageUrl) || "/img/default/default-medicine-not-found.jpg"
          }
          alt={p.brandName}
          loading="lazy"
          className="h-full w-full object-contain mix-blend-multiply group-hover:scale-105 transition-transform duration-500"
        />
        {p.status === "ngừng cung cấp" && (
          <span className="absolute top-3 right-3 bg-gray-500 text-white text-[10px] uppercase font-bold px-2.5 py-1 rounded-md tracking-wider shadow-sm">
            Ngừng bán
          </span>
        )}
      </div>

      {/* info */}
      <div className="p-5 flex-1 flex flex-col">
        <div className="text-[12px] uppercase tracking-wider text-blue-500 font-bold mb-1.5">
          {p.unit}
        </div>

        <h3 className="font-bold text-[15px] text-gray-900 leading-snug line-clamp-2">
          {p.brandName}
        </h3>

        <div className="text-[13px] text-gray-500 mt-1.5 mb-2">
          Xuất xứ:{" "}
          <span className="font-semibold text-gray-700">
            {p.origin || "Chưa cập nhật"}
          </span>
        </div>

        <div className="mt-auto pt-4 border-t border-gray-100">
          <div className="flex items-baseline gap-2 mb-3">
            <span className="text-blue-600 font-extrabold text-lg">
              {formatPrice(p.price)}
            </span>
          </div>

          <Link
            to={`/medicine-detail/${p.medicineId}`}
            className="group w-full bg-blue-50 text-blue-600 rounded-xl py-2.5 text-sm font-bold flex items-center justify-center gap-2 transition-none duration-0 hover:bg-gradient-to-r hover:from-blue-600 hover:to-cyan-500 hover:text-white hover:shadow-lg hover:shadow-blue-600/20 active:scale-[0.98]"
          >
            <FiEye className="text-lg text-blue-600 transition-none duration-0 group-hover:text-white" />
            <span>Xem chi tiết</span>
          </Link>
        </div>
      </div>
    </div>
  );
}
