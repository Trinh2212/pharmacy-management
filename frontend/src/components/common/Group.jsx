import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axiosClient from "../../api/axiosClient";
import { FiArrowRight } from "react-icons/fi";

const styles = [
  {
    imageUrl:
      "https://cdn.nhathuoclongchau.com.vn/unsafe/96x0/filters:quality(90):format(webp)/smalls/Than_kinh_nao_ae09cbf6e8.png",
    bgColorClass: "bg-blue-50",
  },
  {
    imageUrl:
      "https://cdn.nhathuoclongchau.com.vn/unsafe/96x0/filters:quality(90):format(webp)/smalls/Vitamin_and_Khoang_chat_a92b3b1672.png",
    bgColorClass: "bg-green-50",
  },
  {
    imageUrl:
      "https://cdn.nhathuoclongchau.com.vn/unsafe/96x0/filters:quality(90):format(webp)/smalls/Suc_khoe_tim_mach_e413362a48.png",
    bgColorClass: "bg-rose-50",
  },
  {
    imageUrl:
      "https://cdn.nhathuoclongchau.com.vn/unsafe/96x0/filters:quality(90):format(webp)/smalls/Ho_tro_tieu_hoa_ed4a57d578.png",
    bgColorClass: "bg-orange-50",
  },
  {
    imageUrl:
      "  https://cdn.nhathuoclongchau.com.vn/unsafe/96x0/filters:quality(90):format(webp)/smalls/Tang_suc_de_khang_mien_dich_9926e39ba8.png",
    bgColorClass: "bg-blue-50",
  },

  {
    imageUrl:
      "https://cdn.nhathuoclongchau.com.vn/unsafe/96x0/filters:quality(90):format(webp)/smalls/1_Can_Mua_Thuoc_48x48_a5fde193bc.png",
    bgColorClass: "bg-green-50",
  },
  {
    imageUrl:
      "https://cdn.nhathuoclongchau.com.vn/unsafe/96x0/filters:quality(90):format(webp)/smalls/Icon_cat_lvl2_Giai_phap_lan_da_db544098c9.png",
    bgColorClass: "bg-rose-50",
  },
  {
    imageUrl:
      "https://cdn.nhathuoclongchau.com.vn/unsafe/96x0/filters:quality(90):format(webp)/smalls/Sua_d4a041e21d.png",
    bgColorClass: "bg-orange-50",
  },
];

export function Group() {
  const [groups, setgroups] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchMedicineGroups = async () => {
      try {
        const response = await axiosClient.get("/medicine-groups");

        if (response.data && response.data.data) {
          setgroups(response.data.data);
        }
      } catch (error) {
        console.error("Lỗi khi tải nhóm thuốc:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchMedicineGroups();
  }, []);

  if (loading) {
    return (
      <div className="text-center py-14 text-slate-500">
        Đang tải nhóm thuốc ...
      </div>
    );
  }

  return (
    <section className="mx-auto max-w-7xl px-4 py-4">
      <div className="flex items-end justify-between mb-8">
        <div>
          <h2 className="text-2xl md:text-3xl font-extrabold text-slate-900">
            Nhóm thuốc nổi bật
          </h2>
          <p className="text-sm text-slate-500 mt-1">
            Chọn nhanh nhóm thuốc bạn quan tâm nào -.-
          </p>
        </div>
        <Link
          to="/medicines"
          className="text-sm font-bold text-blue-600 hover:text-blue-800 transition-colors hidden sm:flex items-center gap-1 group"
        >
          Xem tất cả
          <FiArrowRight className="transition-transform duration-300 group-hover:translate-x-1" />
        </Link>
      </div>

      <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-3 md:gap-4">
        {groups.slice(0, 8).map((group, index) => {
          const style = styles[index % styles.length];

          return (
            <Link
              to={`/medicines?groupId=${group.groupId}`}
              key={group.groupId}
              className="group bg-white border border-slate-200 rounded-2xl p-4 flex flex-col items-center text-center hover:shadow-lg hover:border-blue-400 hover:-translate-y-0.5 transition-all duration-300"
              title={group.description}
            >
              <div
                className={`h-16 w-16 rounded-full ${style.bgColorClass} flex items-center justify-center group-hover:scale-110 transition-transform duration-300`}
              >
                <img
                  src={style.imageUrl}
                  alt={group.groupName}
                  className="h-10 w-10 object-contain drop-shadow-sm"
                  loading="lazy"
                />
              </div>
              <div className="mt-3 font-semibold text-sm text-slate-800 line-clamp-2">
                {group.groupName}
              </div>
            </Link>
          );
        })}
      </div>
    </section>
  );
}