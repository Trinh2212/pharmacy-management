import { useState, useEffect, useMemo, useRef } from "react";
import { Topbar } from "../../components/admin/topbar";
import axiosClient from "../../api/axiosClient";
import Swal from "sweetalert2";
import { FaXmark, FaLayerGroup, FaAlignLeft } from "react-icons/fa6";

// ── Shared sub-components ─────────────────────────────────────────────────────
function Field({ label, name, value, onChange, type = "text", placeholder = "" }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">{label}</label>
      <input
        type={type}
        name={name}
        value={value}
        onChange={onChange}
        placeholder={placeholder}
        className="w-full px-3 py-2 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-teal-500"
      />
    </div>
  );
}

function TextAreaField({ label, name, value, onChange, placeholder = "" }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">{label}</label>
      <textarea
        name={name}
        value={value}
        onChange={onChange}
        placeholder={placeholder}
        rows={3}
        className="w-full px-3 py-2 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-teal-500 resize-none"
      />
    </div>
  );
}

function Modal({ title, onClose, children }) {
  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm px-4 py-6"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-xl w-full max-w-lg flex flex-col"
        style={{ maxHeight: "calc(100vh - 48px)" }}
        onClick={(e) => e.stopPropagation()}
      >
        <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between shrink-0">
          <h3 className="text-xl font-bold text-teal-700">{title}</h3>
          <button onClick={onClose} className="p-1 text-gray-400 hover:text-gray-600 transition">
            <FaXmark className="h-5 w-5" />
          </button>
        </div>
        <div className="flex flex-col overflow-y-auto">
          {children}
        </div>
      </div>
    </div>
  );
}

const EMPTY_FORM = { groupName: "", description: "" };

// ── Main component ────────────────────────────────────────────────────────────
export default function MedicineGroup() {
  const [groups, setGroups] = useState([]);
  // initialLoading: chỉ true ở lần tải đầu tiên — quyết định có hiện spinner toàn trang hay không.
  // searching: true khi đang gọi lại API do gõ search — KHÔNG che toàn trang, để input không bị mất focus/giá trị.
  const [initialLoading, setInitialLoading] = useState(true);
  const [searching, setSearching]           = useState(false);
  const [keyword, setKeyword]               = useState("");
  const debounceRef = useRef(null);
  const hasLoadedOnce = useRef(false);

  // Dòng đang được chọn (radio-style: chỉ 1 dòng tại 1 thời điểm)
  const [selectedId, setSelectedId] = useState(null);
  const selectedGroup = useMemo(
    () => groups.find((g) => g.groupId === selectedId) || null,
    [groups, selectedId]
  );

  // Modal create
  const [showCreate, setShowCreate]     = useState(false);
  const [createForm, setCreateForm]     = useState(EMPTY_FORM);
  const [savingCreate, setSavingCreate] = useState(false);

  // Modal edit
  const [showEdit, setShowEdit]     = useState(false);
  const [editTarget, setEditTarget] = useState(null); // nhóm thuốc đang sửa
  const [editForm, setEditForm]     = useState(EMPTY_FORM);
  const [savingEdit, setSavingEdit] = useState(false);

  // search: gửi thẳng cho backend qua query param, FE không tự lọc dữ liệu
  const fetchGroups = async (search = "") => {
    try {
      if (!hasLoadedOnce.current) {
        setInitialLoading(true);
      } else {
        setSearching(true);
      }
      const res = await axiosClient.get("/medicine-groups", {
        params: search ? { search } : undefined,
      });
      setGroups(res.data.data);
    } catch {
      Swal.fire("Lỗi", "Không thể tải danh sách nhóm thuốc", "error");
    } finally {
      hasLoadedOnce.current = true;
      setInitialLoading(false);
      setSearching(false);
    }
  };

  useEffect(() => { fetchGroups(); }, []);

  // Dọn debounce timer khi unmount
  useEffect(() => () => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
  }, []);

  // Gõ tìm kiếm -> debounce 400ms rồi gọi lại API với keyword, không lọc ở FE.
  // setKeyword chạy ngay lập tức để ô input hiển thị đúng ký tự vừa gõ (controlled input),
  // chỉ việc GỌI API là được debounce.
  const handleSearch = (value) => {
    setKeyword(value);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      fetchGroups(value.trim());
    }, 400);
  };

  // Click vào 1 dòng để chọn / bấm lại để bỏ chọn
  const toggleSelect = (group) => {
    setSelectedId((prev) => (prev === group.groupId ? null : group.groupId));
  };

  // ── Open modals ─────────────────────────────────────────────────────────────
  const openCreate = () => {
    setCreateForm(EMPTY_FORM);
    setShowCreate(true);
  };

  const openEditSelected = () => {
    const group = selectedGroup;
    if (!group) return;
    setEditTarget(group);
    setEditForm({
      groupName:   group.groupName   || "",
      description: group.description || "",
    });
    setShowEdit(true);
  };

  // ── Submit create ───────────────────────────────────────────────────────────
  const handleSubmitCreate = async (e) => {
    e.preventDefault();
    const { groupName, description } = createForm;
    if (!groupName) {
      return Swal.fire("Cảnh báo", "Vui lòng nhập tên nhóm thuốc (*)", "warning");
    }
    setSavingCreate(true);
    try {
      await axiosClient.post("/medicine-groups", { groupName, description });
      Swal.fire({ icon: "success", title: "Thành công", text: "Đã thêm nhóm thuốc mới!", timer: 1800, showConfirmButton: false });
      setShowCreate(false);
      fetchGroups(keyword.trim());
    } catch (err) {
      Swal.fire("Lỗi", err.response?.data?.message || "Không thể thêm nhóm thuốc", "error");
    } finally {
      setSavingCreate(false);
    }
  };

  // ── Submit edit ─────────────────────────────────────────────────────────────
  const handleSubmitEdit = async (e) => {
    e.preventDefault();
    const { groupName, description } = editForm;
    if (!groupName) {
      return Swal.fire("Cảnh báo", "Vui lòng nhập tên nhóm thuốc (*)", "warning");
    }
    setSavingEdit(true);
    try {
      await axiosClient.put(`/medicine-groups/${editTarget.groupId}`, editForm);
      Swal.fire({ icon: "success", title: "Đã lưu", text: "Thông tin nhóm thuốc đã được cập nhật!", timer: 1800, showConfirmButton: false });
      setShowEdit(false);
      fetchGroups(keyword.trim());
    } catch (err) {
      Swal.fire("Lỗi", err.response?.data?.message || "Không thể cập nhật", "error");
    } finally {
      setSavingEdit(false);
    }
  };

  // ── Delete (chỉ dòng đang chọn) ─────────────────────────────────────────────
  const handleDeleteSelected = async () => {
    const group = selectedGroup;
    if (!group) return;
    const result = await Swal.fire({
      title: "Bạn có chắc chắn?",
      html: `Nhóm thuốc <b>${group.groupName}</b> sẽ bị xóa vĩnh viễn!`,
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#ef4444",
      cancelButtonColor: "#6b7280",
      confirmButtonText: "Vâng, xóa đi!",
      cancelButtonText: "Hủy",
    });
    if (result.isConfirmed) {
      try {
        await axiosClient.delete(`/medicine-groups/${group.groupId}`);
        Swal.fire({ icon: "success", title: "Đã xóa!", text: "Nhóm thuốc đã được xóa.", timer: 1800, showConfirmButton: false });
        setSelectedId(null);
        fetchGroups(keyword.trim());
      } catch (err) {
        Swal.fire("Lỗi", err.response?.data?.message || "Không thể xóa nhóm thuốc này", "error");
      }
    }
  };

  // ── Loading lần đầu ───────────────────────────────────────────────────────
  if (initialLoading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-teal-600" />
        <span className="ml-2 text-teal-600 font-medium">Đang tải dữ liệu...</span>
      </div>
    );
  }

  // ── Render ──────────────────────────────────────────────────────────────────
  return (
    <>
      <Topbar
        title="Quản lý nhóm thuốc"
        subtitle="Danh sách nhóm thuốc"
        hasSelection={!!selectedGroup}
        onSearch={handleSearch}
        searchValue={keyword}
        searchPlaceholder="Tìm theo tên nhóm thuốc…"
        actions={{
          onCreate: openCreate,
          onEdit:   openEditSelected,
          onDelete: handleDeleteSelected,
        }}
      />

      <div className="p-6 bg-gray-50 min-h-screen">
        <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-100 text-gray-600 text-sm uppercase tracking-wider">
                  <th className="px-6 py-4 font-semibold">Nhóm thuốc</th>
                  <th className="px-6 py-4 font-semibold">Mô tả</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {groups.length === 0 ? (
                  <tr>
                    <td colSpan="2" className="px-6 py-12 text-center text-gray-400">
                      Không tìm thấy nhóm thuốc phù hợp!
                    </td>
                  </tr>
                ) : (
                  groups.map((g) => {
                    const isSelected = g.groupId === selectedId;
                    return (
                      <tr
                        key={g.groupId}
                        onClick={() => toggleSelect(g)}
                        className={`cursor-pointer transition select-none
                          ${isSelected ? "bg-teal-50 ring-1 ring-inset ring-teal-300" : "hover:bg-gray-50"}`}
                      >
                        {/* Cột 1: Tên nhóm thuốc */}
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-3">
                            <div className="w-10 h-10 rounded-full bg-teal-50 border border-teal-100 flex items-center justify-center text-teal-600 shrink-0">
                              <FaLayerGroup />
                            </div>
                            <span className="font-medium text-gray-900">{g.groupName}</span>
                          </div>
                        </td>

                        {/* Cột 2: Mô tả */}
                        <td className="px-6 py-4 text-sm text-gray-600">
                          <div className="flex items-start gap-1.5">
                            <FaAlignLeft className="text-gray-400 shrink-0 mt-0.5" />
                            <span className="line-clamp-2">{g.description || "—"}</span>
                          </div>
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>

          {groups.length > 0 && (
            <div className="px-6 py-3 border-t border-gray-100 text-sm text-gray-500 bg-gray-50 flex items-center gap-2">
              <span>
                Tổng: <span className="font-semibold text-gray-700">{groups.length}</span> nhóm thuốc
              </span>
              {selectedGroup && (
                <span className="text-teal-600">
                  · Đang chọn: <span className="font-semibold">{selectedGroup.groupName}</span>
                </span>
              )}
              {searching && (
                <span className="flex items-center gap-1.5 text-gray-400">
                  <span className="h-3 w-3 rounded-full border-2 border-gray-300 border-t-teal-500 animate-spin" />
                  Đang tìm kiếm...
                </span>
              )}
            </div>
          )}
        </div>
      </div>

      {/* ── Modal Thêm nhóm thuốc ── */}
      {showCreate && (
        <Modal title="THÊM NHÓM THUỐC MỚI" onClose={() => setShowCreate(false)}>
          <form onSubmit={handleSubmitCreate} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <Field
                label="Tên nhóm thuốc (*)" name="groupName"
                value={createForm.groupName} placeholder="VD: Thuốc giảm đau, hạ sốt"
                onChange={(e) => setCreateForm((p) => ({ ...p, groupName: e.target.value }))}
              />
              <TextAreaField
                label="Mô tả" name="description"
                value={createForm.description} placeholder="Mô tả ngắn về nhóm thuốc này..."
                onChange={(e) => setCreateForm((p) => ({ ...p, description: e.target.value }))}
              />
            </div>
            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50 flex justify-end gap-3">
              <button type="button" onClick={() => setShowCreate(false)} className="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 text-sm font-medium transition">
                Hủy
              </button>
              <button type="submit" disabled={savingCreate} className="px-4 py-2 bg-teal-600 hover:bg-teal-700 text-white rounded-lg text-sm font-medium transition disabled:opacity-60">
                {savingCreate ? "Đang thêm..." : "Thêm nhóm thuốc"}
              </button>
            </div>
          </form>
        </Modal>
      )}

      {/* ── Modal Sửa nhóm thuốc ── */}
      {showEdit && editTarget && (
        <Modal title="CẬP NHẬT NHÓM THUỐC" onClose={() => setShowEdit(false)}>
          <form onSubmit={handleSubmitEdit} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <Field
                label="Tên nhóm thuốc (*)" name="groupName"
                value={editForm.groupName}
                onChange={(e) => setEditForm((p) => ({ ...p, groupName: e.target.value }))}
              />
              <TextAreaField
                label="Mô tả" name="description"
                value={editForm.description}
                onChange={(e) => setEditForm((p) => ({ ...p, description: e.target.value }))}
              />
            </div>
            <div className="px-6 py-4 border-t border-gray-100 bg-gray-50 flex justify-end gap-3">
              <button type="button" onClick={() => setShowEdit(false)} className="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 text-sm font-medium transition">
                Hủy
              </button>
              <button type="submit" disabled={savingEdit} className="px-4 py-2 bg-teal-600 hover:bg-teal-700 text-white rounded-lg text-sm font-medium transition disabled:opacity-60">
                {savingEdit ? "Đang lưu..." : "Lưu thay đổi"}
              </button>
            </div>
          </form>
        </Modal>
      )}
    </>
  );
}