import { useState, useEffect, useCallback } from "react";
import { FaChevronDown } from "react-icons/fa";
import { useSearchParams } from "react-router-dom";
import { MedicineCard } from "../components/common/MedicineCard";
import axiosClient from "../api/axiosClient";

export default function Medicines() {
  
  const [searchParams, setSearchParams] = useSearchParams();
  const searchTerm = searchParams.get("search") || "";
  const selectedGroup = searchParams.get("groupId") || "all";
  const currentPage = Number(searchParams.get("page")) || 1;

  const [medicines, setMedicines] = useState([]);
  const [groups, setGroups] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [totalMedicines, setTotalMedicines] = useState(0);
  const [totalPages, setTotalPages] = useState(1);

  useEffect(() => {
    const fetchGroups = async () => {
      try {
        const groupsRes = await axiosClient.get("/medicine-groups");
        setGroups(groupsRes.data?.data || []);
      } catch (error) {
        console.error("Lỗi fetch groups:", error);
      }
    };
    fetchGroups();
  }, []);

  const fetchMedicines = useCallback(async () => {
    try {
      setIsLoading(true);
      const params = {
        page: currentPage,
        limit: 20,
        search: searchTerm,
        groupId: selectedGroup !== "all" ? selectedGroup : "",
      };

      const res = await axiosClient.get("/medicines", { params });

      setMedicines(res.data?.data || []);
      setTotalPages(res.data?.totalPages || 1);
      setTotalMedicines(res.data?.totalMedicines || 0);
    } catch (error) {
      console.error("Lỗi fetch medicines:", error);
      setMedicines([]);
    } finally {
      setIsLoading(false);
    }
  }, [currentPage, searchTerm, selectedGroup]);

  useEffect(() => {
    fetchMedicines();
  }, [fetchMedicines]);

  const handleGroupChange = (groupId) => {
    const newParams = new URLSearchParams(searchParams);

    if (groupId === "all") {
      newParams.delete("groupId");
    } else {
      newParams.set("groupId", groupId);
    }

    newParams.set("page", "1"); //reset về trang 1
    setSearchParams(newParams); //update lại url
  };

  const handlePageChange = (newPage) => {
    const newParams = new URLSearchParams(searchParams);
    newParams.set("page", newPage);
    setSearchParams(newParams);
  };

  return (
    <>
      {/* Tiêu đề */}
      <div className="bg-gray-50 border-b border-gray-200">
        <div className="mx-auto max-w-7xl px-4 py-8 md:py-10">
          <h1 className="text-2xl md:text-4xl font-extrabold text-gray-900">
            Tất cả thuốc
          </h1>
          <p className="text-gray-500 text-sm mt-1">
            Danh mục tất cả sản phẩm mà chúng tôi cung cấp
          </p>
        </div>
      </div>

      <div className="mx-auto max-w-7xl px-4 pb-10 pt-4 lg:py-10 grid lg:grid-cols-[240px_1fr] gap-6 lg:gap-8">
        {/* Dropdown mobile */}
        <div className="lg:hidden sticky top-[112px] z-30 bg-white py-3 border-b border-gray-200 -mx-4 px-4 shadow-sm">
          <div className="relative">
            <select
              value={selectedGroup}
              onChange={(e) => handleGroupChange(e.target.value)}
              className="w-full bg-gray-50 border border-gray-300 text-gray-950 text-sm rounded-xl focus:ring-blue-500 focus:border-blue-500 block p-3 pr-10 appearance-none font-semibold transition-all"
            >
              <option value="all">Tất cả danh mục</option>
              {groups.map((c) => (
                <option key={c.groupId} value={c.groupId}>
                  {c.groupName}
                </option>
              ))}
            </select>
            <div className="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500">
              <FaChevronDown className="h-3.5 w-3.5 text-gray-500 transition-transform" />
            </div>
          </div>
        </div>

        {/* desktop danh mục trái */}
        <aside className="hidden lg:block bg-white border border-gray-200 rounded-2xl p-5 h-fit sticky top-32">
          <h3 className="font-bold text-gray-900 mb-3">Danh mục</h3>
          <ul className="space-y-1">
            <li>
              <button
                onClick={() => handleGroupChange("all")}
                className={`w-full text-left px-3 py-2 rounded-lg text-sm transition-colors ${
                  selectedGroup === "all"
                    ? "bg-blue-600 text-white"
                    : "text-gray-700 hover:bg-gray-100"
                }`}
              >
                Tất cả
              </button>
            </li>
            {groups.map((c) => (
              <li key={c.groupId}>
                <button
                  onClick={() => handleGroupChange(String(c.groupId))}
                  className={`w-full text-left px-3 py-2 rounded-lg text-sm transition-colors ${
                    selectedGroup === String(c.groupId)
                      ? "bg-blue-600 text-white"
                      : "text-gray-700 hover:bg-gray-100"
                  }`}
                >
                  {c.groupName}
                </button>
              </li>
            ))}
          </ul>
        </aside>

        <div>
          <div className="mb-4 lg:mb-6 text-xs md:text-sm text-gray-500">
            Hiển thị <strong>{totalMedicines}</strong> sản phẩm
            {searchTerm && <span> cho từ khóa "{searchTerm}"</span>}
          </div>

          {isLoading ? (
            <div className="flex items-center justify-center py-20 text-gray-500 text-sm">
              <div className="animate-spin rounded-full h-6 w-6 border-b-2 border-blue-600 mr-3"></div>
              Đang tải dữ liệu...
            </div>
          ) : (
            <>
              <div className="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-3 sm:gap-5">
                {medicines.map((p) => (
                  <MedicineCard key={p.medicineId} p={p} />
                ))}

                {medicines.length === 0 && (
                  <div className="col-span-full py-14 text-center text-gray-500 bg-white rounded-2xl border border-gray-100">
                    Không tìm thấy thuốc nào phù hợp.
                  </div>
                )}
              </div>

              {/* Phân trang */}
              {totalPages > 1 && (
                <div className="mt-10 flex items-center justify-center space-x-2">
                  <button
                    disabled={currentPage <= 1}
                    onClick={() => handlePageChange(currentPage - 1)}
                    className="px-3 py-2 border border-gray-300 rounded-lg text-xs md:text-sm disabled:opacity-50"
                  >
                    Trang trước
                  </button>
                  <span className="px-3 py-2 text-xs md:text-sm font-medium">
                    Trang {currentPage} / {totalPages}
                  </span>
                  <button
                    disabled={currentPage >= totalPages}
                    onClick={() => handlePageChange(currentPage + 1)}
                    className="px-3 py-2 border border-gray-300 rounded-lg text-xs md:text-sm disabled:opacity-50"
                  >
                    Trang sau
                  </button>
                </div>
              )}
            </>
          )}
        </div>
      </div>
    </>
  );
}