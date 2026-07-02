import { FiShield, FiHeart, FiCheckCircle, FiLifeBuoy } from "react-icons/fi";

const features = [
  {
    id: 1,
    icon: <FiShield />,
    title: "Chăm Sóc Bằng Tâm",
    desc: "Lắng nghe và thấu hiểu nhu cầu sức khỏe của mỗi người với sự tận tâm và trách nhiệm.",
  },
  {
    id: 2,
    icon: <FiHeart />,
    title: "Tận Tâm Tư Vấn",
    desc: "Luôn đặt sức khỏe và sự an tâm của bạn lên hàng đầu trong mọi hoạt động tư vấn và hỗ trợ.",
  },
  {
    id: 3,
    icon: <FiLifeBuoy />,
    title: "Đồng Hành Lâu Dài",
    desc: "Không chỉ hỗ trợ hôm nay mà còn hướng đến một hành trình chăm sóc sức khỏe bền vững.",
  },
  {
    id: 4,
    icon: <FiCheckCircle />,
    title: "Nâng Cao Nhận Thức Sức Khỏe",
    desc: "Chia sẻ kiến thức phòng bệnh, chăm sóc sức khỏe và sử dụng thuốc an toàn cho mọi người.",
  },
];

export function Features() {
  return (
    <section className="bg-blue-50 pt-10 pb-20 font-['Inter',system-ui,sans-serif]">
      <div className="max-w-[1250px] mx-auto px-5 py-10">
        <div className="text-center mb-[50px]">
          <h2 className="text-[#2d4271] text-[2.5rem] font-extrabold mb-[15px] tracking-[-0.5px]">
            Vì Sao Khách Hàng Chọn Chúng Tôi?
          </h2>
          <p className="text-[#7f8c8d] text-[1.15rem]">
            Nhà thuốc đạt chuẩn GPP - Chăm sóc sức khỏe toàn diện cho gia đình bạn
          </p>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-[35px] text-center">
          {features.map((feature) => (
            <div
              key={feature.id}
              
              className="bg-white pt-10 pb-10 px-6 rounded-[30px] shadow-[0_20px_40px_rgba(0,0,0,0.06)] transition-all duration-[400ms] ease-[cubic-bezier(0.4,0,0.2,1)] hover:-translate-y-[10px] hover:shadow-[0_20px_40px_rgba(0,0,0,0.12)] group border border-gray-100"
            >
              <div className="w-[80px] h-[80px] mx-auto mb-[25px] rounded-full bg-gradient-to-br from-blue-600/10 to-blue-600/5 border border-blue-600/10 text-blue-600 flex justify-center items-center text-[2.2rem] transition-transform duration-300 group-hover:scale-110">
                {feature.icon}
              </div>

              <h3 className="text-[#2d4271] text-[1.3rem] mb-[15px] font-bold">
                {feature.title}
              </h3>
              <p className="text-[#555] leading-[1.6] text-base">
                {feature.desc}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}