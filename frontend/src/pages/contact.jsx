import { useState } from "react";
import { FiMapPin, FiPhone, FiMail, FiClock } from "react-icons/fi";
import CommonLayout from "../layouts/CommonLayout";
import Swal from "sweetalert2";
import emailjs from "@emailjs/browser";

export default function Contact() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    subject: "",
    message: "",
  });

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    Swal.fire({
      title: "Đang gửi tin nhắn...",
      allowOutsideClick: false,
      didOpen: () => {
        Swal.showLoading();
      },
    });

    try {
      await emailjs.send(
        "service_jjfsd03",
        "template_0h8fy0i",
        formData,
        "PqBOpr5y6on47_IeT",
      );

      Swal.fire({
        icon: "success",
        title: "Đã gửi lời nhắn thành công!",
        text: "Hệ thống nhà thuốc đã nhận được thông tin của bạn. Xin cám ơn nhé!",
        confirmButtonColor: "#2563eb",
      });

      // Xóa form
      setFormData({ name: "", email: "", subject: "", message: "" });
    } catch (error) {
      console.error("Lỗi gửi mail:", error);
      Swal.fire({
        icon: "error",
        title: "Gửi thất bại!",
        text: "Đã có lỗi xảy ra trong quá trình gửi mail. Vui lòng thử lại sau.",
        confirmButtonColor: "#ef4444",
      });
    }
  };

  return (
    <CommonLayout>
      <div className="min-h-screen bg-blue-50 font-sans pb-20">
        <div
          className="relative min-h-fit pt-28 pb-16 md:pt-36 md:pb-20 flex items-center justify-center text-center text-white rounded-b-3xl shadow-lg overflow-hidden bg-cover bg-center"
          style={{ backgroundImage: 'url("/img/loginbg.jpg")' }}
        >
          <div className="absolute inset-0 bg-gradient-to-br from-blue-900/80 to-blue-400/60 backdrop-blur-sm"></div>

          <div className="relative z-10 px-6 max-w-4xl mx-auto -translate-y-4 md:-translate-y-6">
            <h1 className="text-4xl md:text-6xl font-black mb-4 drop-shadow-lg tracking-tight">
              Liên Hệ Với Chúng Tôi
            </h1>
            <p className="text-lg md:text-xl font-medium drop-shadow-md text-blue-50">
              Đội ngũ dược sĩ luôn sẵn sàng lắng nghe và hỗ trợ tư vấn sức khỏe
              24/7
            </p>
          </div>
        </div>
        <div className="max-w-7xl mx-auto -mt-20 mb-20 flex flex-col lg:flex-row gap-10 px-5 relative z-10">
          <div className="flex-1 bg-white/40 backdrop-blur-2xl backdrop-saturate-200 border border-white/30 p-12 rounded-3xl shadow-2xl">
            <h2 className="text-black text-3xl font-extrabold mb-5">
              Thông Tin Liên Hệ
            </h2>
            <p className="text-gray-600 mb-10 leading-relaxed text-lg">
              Đừng ngần ngại ghé thăm trực tiếp quầy thuốc hoặc gọi điện cho
              chúng tôi để được tư vấn sử dụng thuốc an toàn, hiệu quả.
            </p>

            <div className="flex gap-6 mb-8 items-start">
              <div className="w-16 h-16 bg-gradient-to-br from-blue-600/10 to-blue-600/5 text-blue-600 rounded-full flex items-center justify-center text-3xl shrink-0 border border-blue-600/10">
                <FiMapPin />
              </div>
              <div>
                <strong className="text-slate-800 text-xl block mb-2 font-bold">
                  Địa chỉ nhà thuốc:
                </strong>
                <p className="text-gray-600 m-0 text-base">
                  Khu II, Đại học Cần Thơ, 3/2, P.Ninh Kiều, TP.Cần Thơ
                </p>
              </div>
            </div>

            <div className="flex gap-6 mb-8 items-start">
              <div className="w-16 h-16 bg-gradient-to-br from-blue-600/10 to-blue-600/5 text-blue-600 rounded-full flex items-center justify-center text-3xl shrink-0 border border-blue-600/10">
                <FiPhone />
              </div>
              <div>
                <strong className="text-slate-800 text-xl block mb-2 font-bold">
                  SDT liên hệ:
                </strong>
                <p className="text-gray-600 m-0 text-base">0974378809</p>
              </div>
            </div>

            <div className="flex gap-6 mb-8 items-start">
              <div className="w-16 h-16 bg-gradient-to-br from-blue-600/10 to-blue-600/5 text-blue-600 rounded-full flex items-center justify-center text-3xl shrink-0 border border-blue-600/10">
                <FiMail />
              </div>
              <div>
                <strong className="text-slate-800 text-xl block mb-2 font-bold">
                  Email:
                </strong>
                <p className="text-gray-600 m-0 text-base">
                  caremind@gmail.com
                </p>
              </div>
            </div>

            <div className="flex gap-6 items-start">
              <div className="w-16 h-16 bg-gradient-to-br from-blue-600/10 to-blue-600/5 text-blue-600 rounded-full flex items-center justify-center text-3xl shrink-0 border border-blue-600/10">
                <FiClock />
              </div>
              <div>
                <strong className="text-slate-800 text-xl block mb-2 font-bold">
                  Giờ mở cửa:
                </strong>
                <p className="text-gray-600 m-0 text-base">
                  Thứ 2 - Chủ Nhật: 07:00 - 22:00
                </p>
              </div>
            </div>
          </div>

          <div className="flex-1 lg:w-3/5 bg-white/50 backdrop-blur-2xl backdrop-saturate-200 border border-white/40 p-12 rounded-3xl shadow-2xl">
            <h2 className="text-black text-3xl font-extrabold mb-8">
              Gửi Lời Nhắn
            </h2>

            <form onSubmit={handleSubmit}>
              <div className="mb-6">
                <input
                  type="text"
                  name="name"
                  value={formData.name}
                  onChange={handleChange}
                  placeholder="Họ tên của bạn"
                  className="w-full py-4 px-5 bg-white/40 border border-black/10 rounded-xl text-base transition-all duration-300 shadow-inner focus:outline-none focus:border-blue-500 focus:bg-white/90 focus:ring-4 focus:ring-blue-500/20"
                  required
                />
              </div>
              <div className="mb-6">
                <input
                  type="email"
                  name="email"
                  value={formData.email}
                  onChange={handleChange}
                  placeholder="Địa chỉ Email"
                  className="w-full py-4 px-5 bg-white/40 border border-black/10 rounded-xl text-base transition-all duration-300 shadow-inner focus:outline-none focus:border-blue-500 focus:bg-white/90 focus:ring-4 focus:ring-blue-500/20"
                  required
                />
              </div>
              <div className="mb-6">
                <input
                  type="text"
                  name="subject"
                  value={formData.subject}
                  onChange={handleChange}
                  placeholder="Tiêu đề"
                  className="w-full py-4 px-5 bg-white/40 border border-black/10 rounded-xl text-base transition-all duration-300 shadow-inner focus:outline-none focus:border-blue-500 focus:bg-white/90 focus:ring-4 focus:ring-blue-500/20"
                  required
                />
              </div>
              <div className="mb-6">
                <textarea
                  name="message"
                  value={formData.message}
                  onChange={handleChange}
                  rows="5"
                  placeholder="Nội dung cần tư vấn..."
                  className="w-full py-4 px-5 bg-white/40 border border-black/10 rounded-xl text-base transition-all duration-300 shadow-inner focus:outline-none focus:border-blue-500 focus:bg-white/90 focus:ring-4 focus:ring-blue-500/20 resize-none"
                  required
                ></textarea>
              </div>
              <button
                type="submit"
                className="w-full p-5 bg-gradient-to-br from-blue-600 to-blue-700 text-white border-none rounded-xl text-xl font-extrabold cursor-pointer transition-all duration-500 ease-in-out shadow-lg shadow-blue-600/20 hover:-translate-y-1 hover:shadow-xl hover:shadow-blue-600/40"
              >
                GỬI LỜI NHẮN
              </button>
            </form>
          </div>
        </div>

        {/* Bản đồ Google Maps */}
        <div className="max-w-7xl mx-auto mb-6 px-5">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2777.8136845404006!2d105.7680350086029!3d10.029938972481562!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0895a51d60719%3A0x9d76b0035f6d53d0!2zxJDhuqFpIGjhu41jIEPhuqduIFRoxqE!5e1!3m2!1svi!2s!4v1782226323231!5m2!1svi!2s"
            className="w-full block rounded-3xl shadow-2xl border border-white/30 h-96 lg:h-[28rem]"
            allowFullScreen=""
            loading="lazy"
            referrerPolicy="no-referrer-when-downgrade"
          ></iframe>
        </div>
      </div>
    </CommonLayout>
  );
}
