import { useState, useEffect, useRef, useCallback } from "react";
import { FiSearch, FiX } from "react-icons/fi";
import axiosClient from "../../api/axiosClient";

const inputClass = "w-full py-3 px-4 bg-slate-50 border border-slate-200 rounded-xl text-slate-900 text-sm focus:outline-none focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-500/20 transition-all";
const labelClass = "block text-sm font-bold text-slate-700 mb-2";

// Debounce dùng chung cho ô tìm kiếm.
const useDebouncedValue = (value, delay = 350) => {
  const [debounced, setDebounced] = useState(value);
  useEffect(() => {
    const timer = setTimeout(() => setDebounced(value), delay);
    return () => clearTimeout(timer);
  }, [value, delay]);
  return debounced;
};

const SearchMultiSelect = ({
  label,
  placeholder,
  apiUrl,
  idKey,
  nameKey,
  selected,
  onChange,
  renderExtra,
}) => {
  const [search, setSearch] = useState("");
  const [results, setResults] = useState([]);
  const [searchLoading, setSearchLoading] = useState(false);
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const debouncedSearch = useDebouncedValue(search);
  const boxRef = useRef(null);

  const fetchResults = useCallback(
    async (keyword) => {
      setSearchLoading(true);
      try {
        const res = await axiosClient.get(apiUrl, {
          params: { search: keyword },
        });
        setResults(res.data?.data || []);
      } catch (error) {
        console.error(
          `Tìm ${label} lỗi:`,
          error.response?.data || error.message,
        );
        setResults([]);
      } finally {
        setSearchLoading(false);
      }
    },
    [apiUrl, label],
  );

  useEffect(() => {
    fetchResults(debouncedSearch);
  }, [debouncedSearch, fetchResults]);

  useEffect(() => {
    const handleClickOutside = (e) => {
      if (boxRef.current && !boxRef.current.contains(e.target)) {
        setDropdownOpen(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  const handleSelect = (item) => {
    if (!selected.some((s) => s[idKey] === item[idKey])) {
      onChange([...selected, item]);
    }
    setSearch("");
    setDropdownOpen(false);
  };

  const handleRemove = (id) => {
    onChange(selected.filter((s) => s[idKey] !== id));
  };

return (
    <div className="mb-8" ref={boxRef}>
      <label className={labelClass}>{label}</label>
      <div className="relative">
        <FiSearch className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 w-4 h-4" />
        <input
          type="text"
          value={search}
          onChange={(e) => {
            setSearch(e.target.value);
            setDropdownOpen(true);
          }}
          onFocus={() => setDropdownOpen(true)}
          placeholder={placeholder}
          className={`${inputClass} pl-10`}
        />
        {dropdownOpen && (
          <div className="absolute z-10 mt-2 w-full bg-white border border-slate-200 rounded-xl shadow-lg max-h-56 overflow-y-auto">
            {searchLoading ? (
              <div className="p-4 text-sm text-slate-400 text-center">Đang tìm...</div>
            ) : results.length === 0 ? (
              <div className="p-4 text-sm text-slate-400 text-center">Không tìm thấy kết quả phù hợp.</div>
            ) : (
              results.map((item) => {
                const isSelected = selected.some((s) => s[idKey] === item[idKey]);
                return (
                  <button
                    type="button"
                    key={item[idKey]}
                    onClick={() => handleSelect(item)}
                    disabled={isSelected}
                    className={`w-full text-left px-4 py-3 text-sm border-b border-slate-100 last:border-b-0 transition-colors ${
                      isSelected
                        ? "text-slate-300 cursor-not-allowed bg-slate-50"
                        : "text-slate-700 hover:bg-blue-50"
                    }`}
                  >
                    {item[nameKey]}
                    {isSelected && <span className="ml-2 text-xs italic">(đã chọn)</span>}
                  </button>
                );
              })
            )}
          </div>
        )}
      </div>

      {selected.length > 0 && (
        <div className={renderExtra ? "space-y-2 mt-3" : "flex flex-wrap gap-2 mt-3"}>
          {selected.map((item) =>
            renderExtra ? (
              <div
                key={item[idKey]}
                className="flex items-center gap-3 p-3 rounded-xl border bg-blue-50 border-blue-300"
              >
                <button
                  type="button"
                  onClick={() => handleRemove(item[idKey])}
                  className="text-slate-400 hover:text-red-500"
                  title="Bỏ chọn"
                >
                  <FiX className="w-4 h-4" />
                </button>
                <span className="flex-1 text-sm font-medium text-slate-700">{item[nameKey]}</span>
                {renderExtra(item, (value) =>
                  onChange(
                    selected.map((s) =>
                      s[idKey] === item[idKey] ? { ...s, ...value } : s,
                    ),
                  ),
                )}
              </div>
            ) : (
              <span
                key={item[idKey]}
                className="flex items-center gap-2 px-4 py-2 rounded-full text-sm font-medium bg-blue-600 text-white"
              >
                {item[nameKey]}
                <button
                  type="button"
                  onClick={() => handleRemove(item[idKey])}
                  className="hover:text-blue-200"
                >
                  <FiX className="w-3.5 h-3.5" />
                </button>
              </span>
            ),
          )}
        </div>
      )}
    </div>
  );
};

export default SearchMultiSelect;