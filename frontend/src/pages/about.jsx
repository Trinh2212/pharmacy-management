import { FiTarget, FiHeart, FiShield } from "react-icons/fi";
export default function About() {
  return (
    <>
      <div className="w-full bg-gradient-to-br from-blue-50 to-indigo-50 font-sans min-h-screen pb-20">
        <div
          className="relative min-h-fit pt-28 pb-16 md:pt-36 md:pb-20 flex items-center justify-center text-center text-white rounded-b-3xl shadow-lg overflow-hidden bg-cover bg-center"
          style={{ backgroundImage: 'url("/img/loginbg.jpg")' }}
        >
          <div className="absolute inset-0 bg-gradient-to-br from-blue-900/80 to-blue-400/60 backdrop-blur-sm"></div>

          <div className="relative z-10 px-6 max-w-4xl mx-auto">
            <h1 className="text-4xl md:text-6xl font-black mb-4 drop-shadow-lg tracking-tight">
              Về Nhà Thuốc CareMind
            </h1>
            <p className="text-lg md:text-2xl font-medium drop-shadow-md text-blue-50">
              Hành trình tận tâm chăm sóc sức khỏe cho mọi gia đình
            </p>
          </div>
        </div>

        <div className="max-w-7xl mx-auto px-6 pt-20 lg:pt-32">
          <section className="flex flex-col lg:flex-row gap-12 lg:gap-20 items-center mb-24 lg:mb-32">
            <div className="flex-1 w-full">
              <h2 className="text-blue-900 text-3xl md:text-5xl font-extrabold mb-6">
                Câu Chuyện Của Chúng Tôi
              </h2>
              <p className="text-lg leading-relaxed text-slate-700 mb-5 text-justify">
                Chỉ vừa được thành lập gần đây trong năm 2026,{" "}
                <strong className="text-blue-800">Nhà Thuốc CareMind</strong> ra
                đời với sứ mệnh mang đến cho cộng đồng những sản phẩm y tế chất
                lượng cao, cùng dịch vụ chăm sóc sức khỏe chuẩn mực và đáng tin
                cậy.
              </p>
              <p className="text-lg leading-relaxed text-slate-700 text-justify">
                Chúng tôi không chỉ là nơi cung cấp thuốc đơn thuần, mà còn mong
                muốn trở thành người bạn đồng hành cùng sức khỏe của bạn. Tại
                đây, bạn sẽ luôn nhận được sự lắng nghe, tư vấn đúng bệnh, đúng
                thuốc từ đội ngũ dược sĩ chuyên môn cao, đảm bảo an toàn tuyệt
                đối cho bản thân và gia đình.
              </p>
            </div>

            <div className="flex-1 w-full group">
              <img
                src="/img/about.jpg"
                alt="Không gian nhà thuốc CareMind"
                className="w-full h-80 md:h-auto min-h-[400px] object-cover rounded-3xl shadow-xl transition-all duration-500 ease-in-out group-hover:-translate-y-3 group-hover:scale-[1.02] group-hover:shadow-2xl"
              />
            </div>
          </section>

          <section>
            <h2 className="text-center text-blue-900 text-3xl md:text-4xl lg:text-5xl font-extrabold mb-16 tracking-tight">
              Giá trị cốt lỗi
            </h2>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 lg:gap-10">
              <div className="bg-white/40 backdrop-blur-xl border border-white/50 p-10 rounded-3xl text-center transition-all duration-300 hover:-translate-y-3 hover:bg-white/60 hover:shadow-xl hover:border-white/80 shadow-md">
                <div className="text-4xl text-blue-500 mb-6 p-5 bg-blue-100/50 inline-flex rounded-full border border-blue-200">
                  <FiTarget />
                </div>
                <h3 className="text-slate-800 text-2xl font-extrabold mb-4">
                  Theo đuổi sự xuất sắc
                </h3>
                <p className="text-slate-600 leading-relaxed text-base">
                  Luôn hướng tới mục tiêu tư vấn đúng người, đúng bệnh. Cung cấp
                  các sản phẩm và giải pháp y tế phù hợp cho từng cá nhân.
                </p>
              </div>

              <div className="bg-white/40 backdrop-blur-xl border border-white/50 p-10 rounded-3xl text-center transition-all duration-300 hover:-translate-y-3 hover:bg-white/60 hover:shadow-xl hover:border-white/80 shadow-md">
                <div className="text-4xl text-blue-500 mb-6 p-5 bg-blue-100/50 inline-flex rounded-full border border-blue-200">
                  <FiHeart />
                </div>
                <h3 className="text-slate-800 text-2xl font-extrabold mb-4">
                  Giá trị từ tâm
                </h3>
                <p className="text-slate-600 leading-relaxed text-base">
                  Nỗ lực, tận tâm & khao khát tìm kiếm những sản phẩm chất
                  lượng. Đồng thời, Giá trị từ tâm giúp gắn kết với nhau hơn.
                </p>
              </div>

              <div className="bg-white/40 backdrop-blur-xl border border-white/50 p-10 rounded-3xl text-center transition-all duration-300 hover:-translate-y-3 hover:bg-white/60 hover:shadow-xl hover:border-white/80 shadow-md">
                <div className="text-4xl text-blue-500 mb-6 p-5 bg-blue-100/50 inline-flex rounded-full border border-blue-200">
                  <FiShield />
                </div>
                <h3 className="text-slate-800 text-2xl font-extrabold mb-4">
                  Chính trực
                </h3>
                <p className="text-slate-600 leading-relaxed text-base">
                  Đặt sự trung thực và minh bạch làm nền tảng trong mọi lời nói
                  và hành động, trách nhiệm. Chúng tôi tin rằng chỉ có minh bạch
                  và chân thực mới tạo dựng được niềm tin lâu dài và giá trị
                  vững bền.
                </p>
              </div>
            </div>
          </section>
        </div>
      </div>
    </>
  );
}