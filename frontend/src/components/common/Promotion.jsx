import { FiCheckCircle, FiHeart, FiShield } from "react-icons/fi";

export function Promotions() {
  return (
    <section className="mx-auto max-w-[1250px] px-5 py-12">
      <div className="grid grid-cols-1 md:grid-cols-3 gap-5">
        {/*  */}
        <div className="relative overflow-hidden rounded-2xl p-6 bg-gradient-to-br from-blue-500 to-cyan-500 text-white shadow-md hover:shadow-lg transition-shadow duration-300">
          <FiShield className="absolute -top-2 -right-2 h-28 w-28 opacity-20" />
          <div className="relative flex flex-col h-full justify-between">
            <div>
              <div className="text-xs uppercase tracking-widest opacity-90 font-semibold">
                Cam kết uy tín
              </div>
              <h3 className="mt-2 text-xl font-extrabold leading-snug">
                Chính Hãng 100%
              </h3>
              <p className="mt-1.5 text-sm opacity-90">
                Toàn bộ sản phẩm đều được nhập khẩu và phân phối chính thức, đầy đủ hóa đơn và rõ ràng nguồn gốc xuất xứ.
              </p>
            </div>
            <div className="mt-5">
              <span className="inline-block bg-white/20 backdrop-blur-sm text-white px-4 py-1.5 rounded-full text-xs font-semibold">
                Đạt chuẩn GPP
              </span>
            </div>
          </div>
        </div>
        {/*  */}
        <div className="relative overflow-hidden rounded-2xl p-6 bg-gradient-to-br from-rose-500 to-pink-500 text-white shadow-md hover:shadow-lg transition-shadow duration-300">
          <FiHeart className="absolute -top-2 -right-2 h-28 w-28 opacity-20" />
          <div className="relative flex flex-col h-full justify-between">
            <div>
              <div className="text-xs uppercase tracking-widest opacity-90 font-semibold">
                Phương châm hoạt động
              </div>
              <h3 className="mt-2 text-xl font-extrabold leading-snug">
                Tận Tâm Vì Sức Khỏe
              </h3>
              <p className="mt-1.5 text-sm opacity-90">
                Đội ngũ dược sĩ chuyên môn cao luôn sẵn sàng lắng nghe, tư vấn đúng thuốc, đúng liều lượng và đúng cách.
              </p>
            </div>
            <div className="mt-5">
              <span className="inline-block bg-white/20 backdrop-blur-sm text-white px-4 py-1.5 rounded-full text-xs font-semibold">
                Vì tâm
              </span>
            </div>
          </div>
        </div>
        {/* */}
        <div className="relative overflow-hidden rounded-2xl p-6 bg-gradient-to-br from-emerald-500 to-teal-500 text-white shadow-md hover:shadow-lg transition-shadow duration-300">
          <FiCheckCircle className="absolute -top-2 -right-2 h-28 w-28 opacity-20" />
          <div className="relative flex flex-col h-full justify-between">
            <div>
              <div className="text-xs uppercase tracking-widest opacity-90 font-semibold">
                Chính sách khách hàng
              </div>
              <h3 className="mt-2 text-xl font-extrabold leading-snug">
                Giá Cả Bình Ổn
              </h3>
              <p className="mt-1.5 text-sm opacity-90">
                Chúng tôi cam kết cung cấp các sản phẩm với mức giá hợp lý trên thị trường
              </p>
            </div>
            <div className="mt-5">
              <span className="inline-block bg-white/20 backdrop-blur-sm text-white px-4 py-1.5 rounded-full text-xs font-semibold">
                An tâm mua sắm
              </span>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}