import { FaEnvelope, FaPhoneAlt, FaMapMarkerAlt } from "react-icons/fa";

export default function Footer() {
  return (
    <footer className="mt-24 bg-slate-900 text-slate-100">
      <div className="mx-auto max-w-7xl px-4 py-14 grid gap-10 md:grid-cols-3">
        {/* Cột 1: Giới thiệu */}
        <div>
          <div className="flex items-center gap-2 mb-4">
            <div className="h-10 w-10 overflow-hidden rounded-xl shadow-md bg-white">
              <img
                src="img/logo.png"
                alt="CareMind Pharma"
                className="h-full w-full object-contain"
              />
            </div>

            <div>
              <div className="font-extrabold text-white text-lg">
                CareMind Pharma
              </div>

              <div className="text-[10px] uppercase tracking-wider opacity-60">
                Nhà thuốc tận tâm
              </div>
            </div>
          </div>

          <p className="text-sm opacity-75 leading-relaxed text-justify">
            CareMind Pharma luôn sẵn sàng đồng hành cùng bạn bằng sự chăm sóc
            tận tâm, tư vấn tận tình và đảm bảo chất lượng vì sự an tâm sức
            khỏe.
          </p>
        </div>

        {/* Cột 2: Miễn trừ trách nhiệm */}
        <div>
          <h4 className="text-white font-semibold mb-4">
            Miễn trừ trách nhiệm
          </h4>

          <p className="text-sm opacity-75 leading-relaxed text-justify">
            Website này là đồ án môn học. Mọi thông tin chỉ mang tính chất tham
            khảo, chưa qua kiểm chứng thông tin và không có giá trị áp dụng thực tế.
          </p>
        </div>

        {/* Cột 3: Liên hệ */}
        <div>
          <h4 className="text-white font-semibold mb-4">Liên hệ</h4>

          <ul className="space-y-3 text-sm opacity-85">
            <li className="flex gap-2">
              <FaPhoneAlt className="h-4 w-4 mt-0.5 text-blue-400 shrink-0" />
              0974.378.809
            </li>

            <li className="flex gap-2">
              <FaEnvelope className="h-4 w-4 mt-0.5 text-blue-400 shrink-0" />
              caremind@gmail.com
            </li>

            <li className="flex gap-2 text-justify">
              <FaMapMarkerAlt className="h-4 w-4 mt-0.5 text-blue-400 shrink-0" />
              <span>
                Khu II, Đại học Cần Thơ, 3/2, P.Ninh Kiều, TP. Cần Thơ
              </span>
            </li>
          </ul>
        </div>
      </div>

      <div className="border-t border-white/10">
        <div className="mx-auto max-w-7xl px-4 py-5 text-center text-xs opacity-60">
          <span>
            © {new Date().getFullYear()} CareMind Pharma. Đồ án niên luận KHMT.
          </span>
        </div>
      </div>
    </footer>
  );
}
