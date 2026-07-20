import { useEffect, useState } from "react";
import { useParams, Link } from "react-router-dom";
import axiosClient from "../api/axiosClient";
import { fileUrl } from "../utils/FileUrl";
import { FaLocationDot, FaBarcode, FaBoxesStacked, FaFlask, FaFileLines, FaCircleInfo, FaTriangleExclamation, FaCapsules, FaBoxOpen, FaShieldHalved, FaSnowflake, FaCircleExclamation, FaLayerGroup} from "react-icons/fa6";
import {formatCurrency} from "../utils/Format";

const STATUS_STYLE = {
  "đang cung cấp": "bg-green-50 text-green-600 border-green-200",
  "ngừng cung cấp": "bg-gray-100 text-gray-500 border-gray-200",
  "hết hàng": "bg-red-50 text-red-600 border-red-200",
};

const USAGE_SECTIONS = [
  { key: "dosageForm", label: "Dạng bào chế", icon: FaCapsules },
  { key: "packaging", label: "Quy cách đóng gói", icon: FaBoxOpen },
  { key: "uses", label: "Công dụng", icon: FaCircleInfo },
  { key: "contraindications", label: "Chống chỉ định", icon: FaCircleExclamation },
  { key: "sideEffects", label: "Tác dụng phụ", icon: FaTriangleExclamation },
  { key: "dosageAdministration", label: "Liều dùng & Cách dùng", icon: FaFlask },
  { key: "storageCondition", label: "Bảo quản", icon: FaSnowflake },
  { key: "warning", label: "Cảnh báo - Thận trọng", icon: FaShieldHalved },
];

export default function MedicineDetail() {
  const { id } = useParams();
  const [medicine, setMedicine] = useState(null);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  useEffect(() => {
    let active = true;
    setLoading(true);
    setNotFound(false);

    axiosClient
      .get(`/medicines/medicine-detail/${id}`)
      .then((res) => {
        if (!active) return;
        setMedicine(res.data.data);
      })
      .catch(() => {
        if (active) setNotFound(true);
      })
      .finally(() => {
        if (active) setLoading(false);
      });

    return () => {
      active = false;
    };
  }, [id]);

  if (loading) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="flex items-center gap-2 text-slate-400">
          <span className="h-5 w-5 rounded-full border-2 border-slate-200 border-t-blue-500 animate-spin" />
          <span className="text-sm font-medium">Đang tải thông tin sản phẩm…</span>
        </div>
      </div>
    );
  }

  if (notFound || !medicine) {
    return (
      <div className="min-h-[60vh] flex flex-col items-center justify-center gap-3 text-slate-500">
        <FaTriangleExclamation className="h-8 w-8 text-slate-300" />
        <p className="font-medium">Không tìm thấy thông tin sản phẩm này.</p>
        <Link to="/medicines" className="text-blue-600 text-sm font-semibold hover:underline">
          Quay lại danh sách thuốc
        </Link>
      </div>
    );
  }

  const usage = medicine.usageInstruction;
  const groups = medicine.medicineGroupInfo || [];
  const ingredients = medicine.ingredientDetailInfo || [];
  const statusStyle =
    STATUS_STYLE[medicine.status] || "bg-gray-100 text-gray-500 border-gray-200";

  return (
    <div className="max-w-6xl mx-auto px-4 py-8">
      {/* Ảnh + Thông tin cơ bản */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-10">
        {/* Ảnh sản phẩm */}
        <div className="bg-white rounded-2xl border border-slate-100 shadow-sm p-6 flex items-center justify-center">
          <img
            src={
              fileUrl(medicine.imageUrl) ||
              "/img/default/default-medicine-not-found.jpg"
            }
            alt={medicine.brandName}
            className="max-h-96 w-full object-contain mix-blend-multiply"
          />
        </div>

        {/* Thông tin sản phẩm */}
        <div className="bg-white rounded-2xl border border-slate-100 shadow-sm p-6 flex flex-col gap-5">
          <div>
            <span className="text-xs font-mono text-blue-600 bg-blue-50 px-2 py-0.5 rounded border border-blue-100">
              {medicine.medicineCode}
            </span>
            <h1 className="text-2xl md:text-3xl font-extrabold text-slate-900 mt-2 leading-tight">
              {medicine.brandName}
            </h1>
          </div>

          <div className="flex items-center gap-3 flex-wrap">
            <span
              className={`text-xs font-semibold px-3 py-1 rounded-full border ${statusStyle}`}
            >
              {medicine.status}
            </span>
          </div>

          <div className="text-3xl font-extrabold text-blue-600">
            {formatCurrency(medicine.price)}
            {medicine.unit && (
              <span className="text-base font-medium text-slate-400">
                {" "}
                / {medicine.unit}
              </span>
            )}
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 pt-4 border-t border-slate-100">
            <div className="flex items-start gap-3">
              <FaLocationDot className="h-4 w-4 text-blue-500 mt-1 shrink-0" />
              <div>
                <div className="text-xs text-slate-400">Xuất xứ</div>
                <div className="text-sm font-semibold text-slate-800">
                  {medicine.origin || "Chưa cập nhật"}
                </div>
              </div>
            </div>

            <div className="flex items-start gap-3">
              <FaBoxesStacked className="h-4 w-4 text-blue-500 mt-1 shrink-0" />
              <div>
                <div className="text-xs text-slate-400">Đơn vị</div>
                <div className="text-sm font-semibold text-slate-800">
                  {medicine.unit || "Chưa cập nhật"}
                </div>
              </div>
            </div>

            <div className="flex items-start gap-3 sm:col-span-2">
              <FaBarcode className="h-4 w-4 text-blue-500 mt-1 shrink-0" />
              <div>
                <div className="text-xs text-slate-400">Số đăng ký</div>
                <div className="text-sm font-semibold text-slate-800">
                  {medicine.registrationNumber || "Chưa cập nhật"}
                </div>
              </div>
            </div>
          </div>

          {/* Nhóm thuốc */}
          {groups.length > 0 && (
            <div className="pt-4 border-t border-slate-100">
              <div className="flex items-center gap-1.5 text-xs text-slate-400 mb-2">
                <FaLayerGroup className="h-3.5 w-3.5" />
                Nhóm thuốc
              </div>
              <div className="flex flex-wrap gap-2">
                {groups.map((g) => (
                  <span
                    key={g.groupId}
                    className="text-xs font-medium px-3 py-1 rounded-full bg-blue-50 text-blue-600 border border-blue-100"
                  >
                    {g.groupName}
                  </span>
                ))}
              </div>
            </div>
          )}

          {/* Hoạt chất & hàm lượng */}
          {ingredients.length > 0 && (
            <div className="pt-4 border-t border-slate-100">
              <div className="flex items-center gap-1.5 text-xs text-slate-400 mb-2">
                <FaFlask className="h-3.5 w-3.5" />
                Hoạt chất & hàm lượng
              </div>
              <ul className="flex flex-col gap-1.5">
                {ingredients.map((d, idx) => (
                  <li
                    key={idx}
                    className="flex items-center justify-between text-sm bg-slate-50 rounded-lg px-3 py-2"
                  >
                    <span className="text-slate-700">
                      {d.ingredientInfo?.ingredientName || "—"}
                    </span>
                    {d.strength && (
                      <span className="text-slate-400 text-xs font-medium">
                        {d.strength}
                      </span>
                    )}
                  </li>
                ))}
              </ul>
            </div>
          )}
        </div>
      </div>

      {/* Tờ hướng dẫn sử dụng */}
      {usage && (
        <div className="bg-white rounded-2xl border border-slate-100 shadow-sm p-6 md:p-8">
          <div className="flex items-center gap-2 mb-6 text-blue-600">
            <FaFileLines className="h-5 w-5" />
            <h2 className="text-xl font-bold text-slate-800">
              Hướng dẫn sử dụng
            </h2>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            {/* chỉ hiện nd của các mục có dữ liệu */}
            <div className="lg:col-span-2 flex flex-col gap-5">
              {USAGE_SECTIONS.filter(({ key }) => usage[key]).map(
                ({ key, label, icon: Icon }) => (
                  <div key={key}>
                    <div className="flex items-center gap-2 text-sm font-semibold text-slate-700 mb-1.5">
                      <Icon className="h-4 w-4 text-blue-500 shrink-0" />
                      {label}
                    </div>
                    <p className="text-sm text-slate-600 leading-relaxed whitespace-pre-line pl-6">
                      {usage[key]}
                    </p>
                  </div>
                ),
              )}

              {USAGE_SECTIONS.every(({ key }) => !usage[key]) && (
                <p className="text-sm text-slate-400 italic">
                  Chưa có thông tin hướng dẫn sử dụng chi tiết cho sản phẩm này.
                </p>
              )}
            </div>

            {/* Ảnh tờ hướng dẫn sử dụng */}
            {usage.document && (
              <div className="lg:col-span-1">
                <a
                  href={fileUrl(usage.document)}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="block rounded-xl border border-slate-200 overflow-hidden hover:shadow-md transition"
                >
                  <img
                    src={fileUrl(usage.document)}
                    alt="Tờ hướng dẫn sử dụng"
                    className="w-full object-contain"
                  />
                </a>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
}