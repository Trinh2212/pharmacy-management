import { useState, useEffect, useMemo, useRef } from "react";
import { Topbar } from "../../components/admin/TopBar";
import axiosClient from "../../api/axiosClient";
import {
  alertSuccess,
  alertError,
  alertWarning,
  alertConfirm,
} from "../../utils/SwalAlert";
import { FaXmark, FaAlignLeft } from "react-icons/fa6";

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

function TextAreaField({ label, name, value, onChange, placeholder = "" }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">
        {label}
      </label>
      <textarea
        name={name}
        value={value}
        onChange={onChange}
        placeholder={placeholder}
        rows={3}
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

const EMPTY_FORM = { groupName: "", description: "" };

export default function MedicineGroup() {
  const [groups, setGroups] = useState([]);
  const [initialLoading, setInitialLoading] = useState(true);
  const [searching, setSearching] = useState(false);
  const [keyword, setKeyword] = useState("");
  const debounceRef = useRef(null);
  const hasLoadedOnce = useRef(false);

  const [selectedId, setSelectedId] = useState(null);
  const selectedGroup = useMemo(
    () => groups.find((g) => g.groupId === selectedId) || null,
    [groups, selectedId],
  );

  const [showCreate, setShowCreate] = useState(false);
  const [createForm, setCreateForm] = useState(EMPTY_FORM);
  const [savingCreate, setSavingCreate] = useState(false);

  const [showEdit, setShowEdit] = useState(false);
  const [editTarget, setEditTarget] = useState(null);
  const [editForm, setEditForm] = useState(EMPTY_FORM);
  const [savingEdit, setSavingEdit] = useState(false);

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
      alertError("Không thể tải danh sách nhóm thuốc");
    } finally {
      hasLoadedOnce.current = true;
      setInitialLoading(false);
      setSearching(false);
    }
  };

  useEffect(() => {
    fetchGroups();
  }, []);

  useEffect(
    () => () => {
      if (debounceRef.current) clearTimeout(debounceRef.current);
    },
    [],
  );

  const handleSearch = (value) => {
    setKeyword(value);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      fetchGroups(value.trim());
    }, 400);
  };

  const toggleSelect = (group) => {
    setSelectedId((prev) => (prev === group.groupId ? null : group.groupId));
  };

  const openCreate = () => {
    setCreateForm(EMPTY_FORM);
    setShowCreate(true);
  };

  const openEditSelected = () => {
    const group = selectedGroup;
    if (!group) return;
    setEditTarget(group);
    setEditForm({
      groupName: group.groupName || "",
      description: group.description || "",
    });
    setShowEdit(true);
  };

  const handleSubmitCreate = async (e) => {
    e.preventDefault();
    const { groupName, description } = createForm;
    if (!groupName) {
      return alertWarning("Vui lòng nhập tên nhóm thuốc (*)");
    }
    setSavingCreate(true);
    try {
      await axiosClient.post("/medicine-groups", { groupName, description });
      alertSuccess("Đã thêm nhóm thuốc mới thành công");
      setShowCreate(false);
      fetchGroups(keyword.trim());
    } catch (err) {
      alertError(err || "thất bại. Không thể thêm nhóm thuốc");
    } finally {
      setSavingCreate(false);
    }
  };

  const handleSubmitEdit = async (e) => {
    e.preventDefault();
    const { groupName, description } = editForm;
    if (!groupName) {
      return alertWarning("Vui lòng nhập tên nhóm thuốc (*)");
    }
    setSavingEdit(true);
    try {
      await axiosClient.put(`/medicine-groups/${editTarget.groupId}`, editForm);
      alertSuccess("Thông tin nhóm thuốc đã được cập nhật!");
      setShowEdit(false);
      fetchGroups(keyword.trim());
    } catch (err) {
      alertError(err || "Không thể cập nhật nhóm thuốc -.-");
    } finally {
      setSavingEdit(false);
    }
  };

  const handleDeleteSelected = async () => {
    const group = selectedGroup;
    if (!group) return;
    const result = await alertConfirm(
      `Nhóm thuốc [${group.groupName}] sẽ bị xóa vĩnh viễn!`,
      "Bạn có chắc chắn?",
      "btn-swal-danger",
    );
    if (result.isConfirmed) {
      try {
        await axiosClient.delete(`/medicine-groups/${group.groupId}`);
        alertSuccess("Nhóm thuốc đã được xóa thành công");
        setSelectedId(null);
        fetchGroups(keyword.trim());
      } catch (err) {
        alertError(err || "Không thể xóa nhóm thuốc này -.-");
      }
    }
  };

  if (initialLoading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600" />
        <span className="ml-2 text-blue-600 font-medium">
          Đang tải dữ liệu...
        </span>
      </div>
    );
  }

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
                  <th className="px-6 py-4 font-semibold"> Nhóm thuốc </th>
                  <th className="px-6 py-4 font-semibold"> Mô tả </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {groups.length === 0 ? (
                  <tr>
                    <td
                      colSpan="2"
                      className="px-6 py-12 text-center text-gray-400"
                    >
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
                        className={`cursor-pointer transition-colors duration-200 select-none border-b border-gray-100
                          ${isSelected ? "bg-blue-100 ring-1 ring-inset ring-blue-50" : "hover:bg-gray-100"}`}
                      >
                        {/* Cột 1: Tên nhóm thuốc */}
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-3">
                            <span className="font-medium text-black">
                              {g.groupName}
                            </span>
                          </div>
                        </td>

                        {/* Cột 2: Mô tả */}
                        <td className="px-6 py-4 text-sm text-gray-800">
                          <div className="flex items-start gap-1.5">
                            <FaAlignLeft className="text-gray-400 shrink-0 mt-0.5" />
                            <span className="line-clamp-2">
                              {g.description || "chưa được cập nhật"}
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

          {groups.length > 0 && (
            <div className="px-6 py-3 border-t border-gray-100 text-sm text-gray-500 bg-gray-50 flex items-center gap-2">
              <span>
                Tổng:{" "}
                <span className="font-semibold text-gray-700">
                  {groups.length}
                </span>{" "}
                nhóm thuốc
              </span>
              {selectedGroup && (
                <span className="text-blue-600">
                  Đang chọn:{" "}
                  <span className="font-semibold">
                    {selectedGroup.groupName}
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

      {/* ── Modal Thêm nhóm thuốc ── */}
      {showCreate && (
        <Modal title="THÊM NHÓM THUỐC MỚI" onClose={() => setShowCreate(false)}>
          <form onSubmit={handleSubmitCreate} className="flex flex-col">
            <div className="px-6 py-5 flex flex-col gap-4">
              <Field
                label="Tên nhóm thuốc (*)"
                name="groupName"
                value={createForm.groupName}
                placeholder="VD: Thuốc giảm đau, hạ sốt"
                onChange={(e) =>
                  setCreateForm((p) => ({ ...p, groupName: e.target.value }))
                }
              />
              <TextAreaField
                label="Mô tả"
                name="description"
                value={createForm.description}
                placeholder="Mô tả ngắn về nhóm thuốc này..."
                onChange={(e) =>
                  setCreateForm((p) => ({ ...p, description: e.target.value }))
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
                label="Tên nhóm thuốc (*)"
                name="groupName"
                value={editForm.groupName}
                onChange={(e) =>
                  setEditForm((p) => ({ ...p, groupName: e.target.value }))
                }
              />
              <TextAreaField
                label="Mô tả"
                name="description"
                value={editForm.description}
                onChange={(e) =>
                  setEditForm((p) => ({ ...p, description: e.target.value }))
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
