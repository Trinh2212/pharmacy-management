import { FiGift } from "react-icons/fi";

export function Promotions() {
  return (
    <section className="mx-auto max-w-7xl px-4 py-10">
      <div className="grid md:grid-cols-3 gap-4">
        {/* Khối quảng cáo 1: Màu Xanh dương */}
        <div className="relative overflow-hidden rounded-2xl p-6 bg-gradient-to-br from-blue-500 to-cyan-500 text-white shadow-md hover:shadow-xl transition-all duration-300 group cursor-pointer">
          <FiGift className="absolute -top-2 -right-2 h-28 w-28 opacity-20 group-hover:scale-110 transition-transform duration-300" />
          <div className="relative">
            <div className="text-xs uppercase tracking-widest opacity-90 font-semibold">
              Khuyến mãi
            </div>
            <h3 className="mt-2 text-xl font-extrabold leading-snug">
              Freeship Toàn Quốc
            </h3>
            <p className="mt-1.5 text-sm opacity-90">
              Cho đơn hàng thuốc từ 300.000đ
            </p>
            <button className="mt-4 bg-white text-blue-600 px-4 py-2 rounded-full text-sm font-bold hover:bg-gray-50 transition-colors shadow-sm">
              Khám phá →
            </button>
          </div>
        </div>

        {/* Khối quảng cáo 2: Màu Hồng đỏ */}
        <div className="relative overflow-hidden rounded-2xl p-6 bg-gradient-to-br from-rose-500 to-pink-500 text-white shadow-md hover:shadow-xl transition-all duration-300 group cursor-pointer">
          <FiGift className="absolute -top-2 -right-2 h-28 w-28 opacity-20 group-hover:scale-110 transition-transform duration-300" />
          <div className="relative">
            <div className="text-xs uppercase tracking-widest opacity-90 font-semibold">
              Khuyến mãi
            </div>
            <h3 className="mt-2 text-xl font-extrabold leading-snug">
              Mua 1 Tặng 1
            </h3>
            <p className="mt-1.5 text-sm opacity-90">
              Áp dụng cho các sản phẩm Vitamin
            </p>
            <button className="mt-4 bg-white text-rose-600 px-4 py-2 rounded-full text-sm font-bold hover:bg-gray-50 transition-colors shadow-sm">
              Khám phá →
            </button>
          </div>
        </div>

        {/* Khối quảng cáo 3: Màu Xanh ngọc */}
        <div className="relative overflow-hidden rounded-2xl p-6 bg-gradient-to-br from-emerald-500 to-teal-500 text-white shadow-md hover:shadow-xl transition-all duration-300 group cursor-pointer">
          <FiGift className="absolute -top-2 -right-2 h-28 w-28 opacity-20 group-hover:scale-110 transition-transform duration-300" />
          <div className="relative">
            <div className="text-xs uppercase tracking-widest opacity-90 font-semibold">
              Khuyến mãi
            </div>
            <h3 className="mt-2 text-xl font-extrabold leading-snug">
              Tích Điểm Hoàn Tiền
            </h3>
            <p className="mt-1.5 text-sm opacity-90">
              Hoàn ngay 5% cho thành viên VIP
            </p>
            <button className="mt-4 bg-white text-emerald-600 px-4 py-2 rounded-full text-sm font-bold hover:bg-gray-50 transition-colors shadow-sm">
              Khám phá →
            </button>
          </div>
        </div>
      </div>
    </section>
  );
}