import { FaSearch } from "react-icons/fa";
import { FaPlus, FaPenToSquare, FaTrashCan, FaEye } from "react-icons/fa6";
import Swal from "sweetalert2";

/**
 * Topbar dùng chung cho các trang quản lý dạng danh sách (Employee, Supplier, ...).
 *
 * Props:
 * - title, subtitle: tiêu đề trang (giữ như cũ)
 * - hasSelection: boolean — đang có 1 dòng được chọn trong bảng hay không
 * - actions: {
 *     onCreate?: () => void,                 // Thêm — luôn chạy được, không cần chọn dòng
 *     onEdit?:   () => void,                 // Sửa — cần hasSelection
 *     onDelete?: () => void,                 // Xóa — cần hasSelection
 *     onView?:   () => void,                 // Xem chi tiết — cần hasSelection
 *   }
 *   Trang nào không cần 1 hành động nào đó (ví dụ Supplier không có Xem/Xóa-khóa)
 *   thì không truyền field đó vào, nút tương ứng sẽ không hiển thị.
 * - onSearch?: (keyword: string) => void     // gõ tìm kiếm, mỗi trang tự lọc dữ liệu của mình
 * - searchValue?: string                     // giá trị hiện tại của ô search (controlled), bắt buộc nếu dùng onSearch
 * - searchPlaceholder?: string
 */
export function Topbar({
  title,
  subtitle,
  hasSelection = false,
  actions = {},
  onSearch,
  searchValue = "",
  searchPlaceholder = "Tìm kiếm…",
}) {
  const { onCreate, onEdit, onDelete, onView } = actions;

  const requireSelection = (handler) => () => {
    if (!hasSelection) {
      Swal.fire("Thông báo", "Vui lòng chọn một dòng để thực hiện hành động này", "warning");
      return;
    }
    handler();
  };

  return (
    <header className="bg-card border-b border-border">
      <div className="flex items-center gap-3 px-6 py-4">

        <div className="flex-1 min-w-0">
          <h1 className="text-xl font-extrabold truncate">{title}</h1>
          {subtitle && (
            <p className="text-sm text-muted-foreground mt-0.5">{subtitle}</p>
          )}
        </div>

        {/* ô tìm kiếm */}
        {onSearch && (
          <div className="hidden md:flex items-center bg-secondary rounded-full px-4 py-2 w-72">
            <FaSearch className="h-4 w-4 text-muted-foreground" />
            <input
              placeholder={searchPlaceholder}
              value={searchValue}
              onChange={(e) => onSearch(e.target.value)}
              className="flex-1 bg-transparent px-3 text-sm outline-none"
            />
          </div>
        )}

        {/* Nhóm hành động */}
        <div className="flex items-center gap-1.5">
          {onCreate && (
            <button
              onClick={onCreate}
              title="Thêm"
              className="h-10 w-10 grid place-items-center rounded-full bg-teal-600 hover:bg-teal-700 text-white transition"
            >
              <FaPlus className="h-4 w-4" />
            </button>
          )}
          {onView && (
            <button
              onClick={requireSelection(onView)}
              title="Xem chi tiết"
              className={`h-10 w-10 grid place-items-center rounded-full transition
                ${hasSelection ? "bg-secondary text-gray-600 hover:bg-gray-200" : "bg-secondary text-gray-400"}`}
            >
              <FaEye className="h-4 w-4" />
            </button>
          )}
          {onEdit && (
            <button
              onClick={requireSelection(onEdit)}
              title="Sửa"
              className={`h-10 w-10 grid place-items-center rounded-full transition
                ${hasSelection ? "bg-secondary text-blue-600 hover:bg-blue-100" : "bg-secondary text-gray-400"}`}
            >
              <FaPenToSquare className="h-4 w-4" />
            </button>
          )}
          {onDelete && (
            <button
              onClick={requireSelection(onDelete)}
              title="Xóa"
              className={`h-10 w-10 grid place-items-center rounded-full transition
                ${hasSelection ? "bg-secondary text-red-600 hover:bg-red-100" : "bg-secondary text-gray-400"}`}
            >
              <FaTrashCan className="h-4 w-4" />
            </button>
          )}
        </div>
      </div>
    </header>
  );
}