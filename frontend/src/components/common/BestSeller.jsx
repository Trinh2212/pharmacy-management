import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { FiArrowRight } from "react-icons/fi";
import { MedicineCard } from "./MedicineCard";
import axiosClient from "../../api/axiosClient";

export function BestSellers() {
  const [medicines, setMedicines] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchBestSellers = async () => {
      try {
        const response = await axiosClient.get("/medicines");
        let medicineList = [];

        if (Array.isArray(response.data)) {
          medicineList = response.data;
        } else if (response.data && Array.isArray(response.data.data)) {
          medicineList = response.data.data;
        } else if (response.data && Array.isArray(response.data.metadata)) {
          medicineList = response.data.metadata;
        } else {
          console.error("Dữ liệu trả về không phải là mảng:", response.data);
          medicineList = [];
        }

        setMedicines(medicineList.slice(0, 8));
      } catch (error) {
        console.error("Lỗi khi fetch dữ liệu BestSellers:", error);
        setMedicines([]);
      } finally {
        setLoading(false);
      }
    };

    fetchBestSellers();
  }, []);

  return (
    <section className="mx-auto max-w-[1250px] px-5 py-12">
      {/* title */}
      <div className="flex items-end justify-between mb-8">
        <div>
          
          <h2 className="text-[#2d4271] text-2xl md:text-3xl font-extrabold tracking-tight">
            Sản Phẩm Bán Chạy
          </h2>
        </div>

        <Link
          to="/medicines"
          className="text-sm font-bold text-blue-600 hover:text-blue-800 transition-colors hidden sm:flex items-center gap-1 group"
        >
          Xem tất cả
          <FiArrowRight className="transition-transform duration-300 group-hover:translate-x-1" />
        </Link>
      </div>

      {loading ? (
        <div className="flex justify-center items-center py-20 text-gray-500">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mr-3"></div>
          Đang tải dữ liệu...
        </div>
      ) : (
        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-5">
          {medicines.map((p) => (
            <MedicineCard key={p.medicineId} p={p} />
          ))}

          {medicines.length === 0 && (
            <div className="col-span-full text-center text-gray-500 py-10">
              Chưa có sản phẩm nào để hiển thị.
            </div>
          )}
        </div>
      )}

      {/* mobile nút xem all  */}
      <div className="mt-8 text-center sm:hidden">
        <Link
          to="/medicines"
          className="inline-flex items-center gap-2 text-sm font-bold text-blue-600 hover:text-blue-800 transition-colors bg-blue-50 px-6 py-3 rounded-full"
        >
          Xem tất cả <FiArrowRight />
        </Link>
      </div>
    </section>
  );
}