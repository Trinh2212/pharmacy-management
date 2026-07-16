import { useState, useEffect, useMemo, useRef } from "react";
import { Topbar } from "../../components/admin/topbar";
import axiosClient from "../../api/axiosClient";
import { alertSuccess, alertError, alertWarning, alertConfirm } from "../../utils/SwalAlert";
import { FaXmark, FaFlask } from "react-icons/fa6";

function Field({
  label,
  name,
  value,
  onChange,
  type = "text",
  placeholder = "",
}) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">
        {label}
      </label>
      <input
        type={type}
        name={name}
        value={value}
        onChange={onChange}
        placeholder={placeholder}
        className="form-base"
      />
    </div>
  );
}

function Modal({ title, onClose, children }) {
  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm px-4"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-xl w-full max-w-lg flex flex-col max-h-[90vh]"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between shrink-0">
          <div className="w-5"></div>{" "}
          <h3 className="text-xl font-bold text-slate-800 text-center">
            {title}
          </h3>
          <button
            onClick={onClose}
            className="p-1 text-gray-400 hover:text-gray-600 transition"
          >
            <FaXmark className="h-5 w-5" />
          </button>
        </div>
        <div className="flex flex-col overflow-y-auto">{children}</div>
      </div>
    </div>
  );
}

const EMPTY_FORM = { ingredientName: "" };

export default function Ingredient() {
  const [ingredients, setIngredients] = useState([]);
  const [initialLoading, setInitialLoading] = useState(true);
  const [searching, setSearching]           = useState(false);
  const [keyword, setKeyword]               = useState("");
  const debounceRef = useRef(null);
  const hasLoadedOnce = useRef(false);

  const [selectedId, setSelectedId] = useState(null);
  const selectedIngredient = useMemo(
    () => ingredients.find((i) => i.ingredientId === selectedId) || null,
    [ingredients, selectedId]
  );

  const [showCreate, setShowCreate]     = useState(false);
  const [createForm, setCreateForm]     = useState(EMPTY_FORM);
  const [savingCreate, setSavingCreate] = useState(false);

  const [showEdit, setShowEdit]     = useState(false);
  const [editTarget, setEditTarget] = useState(null);
  const [editForm, setEditForm]     = useState(EMPTY_FORM);
  const [savingEdit, setSavingEdit] = useState(false);

  const fetchIngredients = async (search = "") => {
    try {
      if (!hasLoadedOnce.current) {
        setInitialLoading(true);
      } else {
        setSearching(true);
      }
      const res = await axiosClient.get("/active-ingredients", {
        params: search ? { search } : undefined,
      });
      setIngredients(res.data.data);
    } catch {
      alertError("Không thể tải danh sách hoạt chất");
    } finally {
      hasLoadedOnce.current = true;
      setInitialLoading(false);
      setSearching(false);
    }
  };

  useEffect(() => { fetchIngredients(); }, []);

  useEffect(() => () => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
  }, []);

  const handleSearch = (value) => {
    setKeyword(value);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      fetchIngredients(value.trim());
    }, 400);
  };

  const toggleSelect = (ingredient) => {
    setSelectedId((prev) => (prev === ingredient.ingredientId ? null : ingredient.ingredientId));
  };

  const openCreate = () => {
    setCreateForm(EMPTY_FORM);
    setShowCreate(true);
  };

  const openEditSelected = () => {
    const ingredient = selectedIngredient;
    if (!ingredient) return;
    setEditTarget(ingredient);
    setEditForm({
      ingredientName: ingredient.ingredientName || "",
    });
    setShowEdit(true);
  };

  const handleSubmitCreate = async (e) => {
    e.preventDefault();
    const { ingredientName } = createForm;
    if (!ingredientName) {
      return alertWarning("Vui lòng nhập tên hoạt chất (*)");
    }
    setSavingCreate(true);
    try {
      await axiosClient.post("/active-ingredients", { ingredientName });
      alertSuccess("Đã thêm hoạt chất mới thành công");
      setShowCreate(false);
      fetchIngredients(keyword.trim());
    } catch (err) {
      alertError(err || "thất bại. Không thể thêm hoạt chất -.-");
    } finally {
      setSavingCreate(false);
    }
  };

  const handleSubmitEdit = async (e) => {
    e.preventDefault();
    const { ingredientName } = editForm;
    if (!ingredientName) {
      return alertWarning("Vui lòng nhập tên hoạt chất (*)");
    }
    setSavingEdit(true);
    try {
      await axiosClient.put(
        `/active-ingredients/${editTarget.ingredientId}`,
        editForm,
      );
      alertSuccess("Thông tin hoạt chất đã được cập nhật rồi");
      setShowEdit(false);
      fetchIngredients(keyword.trim());
    } catch (err) {
      alertError(err || "Không thể cập nhật thông tin hoạt chất");
    } finally {
      setSavingEdit(false);
    }
  };

  const handleDeleteSelected = async () => {
    const ingredient = selectedIngredient;
    if (!ingredient) return;
    const result = await alertConfirm(
      `Hoạt chất [${ingredient.ingredientName}] sẽ bị xóa vĩnh viễn!`,
      "Bạn có chắc chắn?",
      "btn-swal-danger",
    );
    if (result.isConfirmed) {
      try {
        await axiosClient.delete(
          `/active-ingredients/${ingredient.ingredientId}`,
        );
        alertSuccess("Hoạt chất đã được xóa thành công");
        setSelectedId(null);
        fetchIngredients(keyword.trim());
      } catch (err) {
        alertError( err || "Không thể xóa hoạt chất này. Có thể hoạt chất đang được dùng trong một số loại thuốc.",);
      }
    }
  };

  if (initialLoading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600" />
        <span className="ml-2 text-teal-600 font-medium">Đang tải dữ liệu...</span>
      </div>
    );
  }

  return (
    <>
      <Topbar
        title="Quản lý hoạt chất"
        subtitle="Danh sách hoạt chất"
        hasSelection={!!selectedIngredient}
        onSearch={handleSearch}
        searchValue={keyword}
        searchPlaceholder="Tìm theo tên hoạt chất…"
        actions={{
          onCreate: openCreate,
          onEdit: openEditSelected,
          onDelete: handleDeleteSelected,
        }}
      />

      <div className="p-6 min-h-screen">
        <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-blue-600 border-b border-blue-800 text-white text-sm uppercase tracking-wider">
                  <th className="px-6 py-4 font-semibold">Hoạt chất</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {ingredients.length === 0 ? (
                  <tr>
                    <td className="px-6 py-12 text-center text-gray-400">
                      Không tìm thấy hoạt chất phù hợp!
                    </td>
                  </tr>
                ) : (
                  ingredients.map((i) => {
                    const isSelected = i.ingredientId === selectedId;
                    return (
                      <tr
                        key={i.ingredientId}
                        onClick={() => toggleSelect(i)}
                        className={`cursor-pointer transition-colors duration-200 select-none border-b border-gray-100
                          ${isSelected ? "bg-blue-100 ring-1 ring-inset ring-blue-50" : "hover:bg-gray-100"}`}
                      >
                        {/* Cột 1: Tên hoạt chất */}
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-3">
                            <div className="w-10 h-10 rounded-full bg-blue-50 border border-blue-100 flex items-center justify-center text-blue-600 shrink-0">
                              <FaFlask />
                            </div>
                            <span className="font-medium text-black">
                              {i.ingredientName}
                            </span>
                          </div>
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>

          {ingredients.length > 0 && (
            <div className="px-6 py-3 border-t border-gray-100 text-sm text-gray-500 bg-gray-50 flex items-center gap-2">
              <span>
                Tổng:{" "}
                <span className="font-semibold text-gray-700">
                  {ingredients.length}
                </span>{" "}
                hoạt chất
              </span>
              {selectedIngredient && (
                <span className="text-blue-600">
                  Đang chọn:{" "}
                  <span className="font-semibold">
                    {selectedIngredient.ingredientName}
                  </span>
                </span>
              )}
              {searching && (
                <span className="flex items-center gap-1.5 text-gray-400">
                  <span className="h-3 w-3 rounded-full border-2 border-gray-300 border-t-blue-500 animate-spin" />
                  Đang tìm kiếm...
                </span>
              )}
            </div>
          )}
        </div>
      </div>

      {/* ── Modal Thêm hoạt chất ── */}
      {showCreate && (
        <Modal title="THÊM HOẠT CHẤT MỚI" onClose={() => setShowCreate(false)}>
          <form onSubmit={handleSubmitCreate} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <Field
                label="Tên hoạt chất (*)"
                name="ingredientName"
                value={createForm.ingredientName}
                placeholder="VD: Paracetamol"
                onChange={(e) =>
                  setCreateForm((p) => ({
                    ...p,
                    ingredientName: e.target.value,
                  }))
                }
              />
            </div>
            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50 flex justify-end gap-3">
              <button
                type="button"
                onClick={() => setShowCreate(false)}
                className="btn-cancel px-4 py-2 text-sm font-medium"
              >
                Hủy
              </button>
              <button
                type="submit"
                disabled={savingCreate}
                className="btn-gradient px-4 py-2 text-sm font-medium"
              >
                {savingCreate ? "Đang thêm..." : "Thêm hoạt chất"}
              </button>
            </div>
          </form>
        </Modal>
      )}

      {/* ── Modal Sửa hoạt chất ── */}
      {showEdit && editTarget && (
        <Modal title="CẬP NHẬT HOẠT CHẤT" onClose={() => setShowEdit(false)}>
          <form onSubmit={handleSubmitEdit} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <Field
                label="Tên hoạt chất (*)"
                name="ingredientName"
                value={editForm.ingredientName}
                onChange={(e) =>
                  setEditForm((p) => ({ ...p, ingredientName: e.target.value }))
                }
              />
            </div>
            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50 flex justify-end gap-3">
              <button
                type="button"
                onClick={() => setShowEdit(false)}
                className="btn-cancel px-4 py-2 text-sm font-medium"
              >
                Hủy
              </button>
              <button
                type="submit"
                disabled={savingEdit}
                className="btn-gradient px-4 py-2 text-sm font-medium"
              >
                {savingEdit ? "Đang lưu..." : "Lưu thay đổi"}
              </button>
            </div>
          </form>
        </Modal>
      )}
    </>
  );
}