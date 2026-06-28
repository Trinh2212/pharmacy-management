import { useEffect, useMemo, useRef, useState } from "react";
import { FiLoader, FiDroplet } from "react-icons/fi";
import axiosClient from "../api/axiosClient";

const ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ#".split("");

function stripDiacritics(str = "") {
  return str
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/đ/gi, "d")
    .toUpperCase();
}

function getFirstLetter(name = "") {
  const clean = stripDiacritics(name).trim();
  const first = clean.charAt(0);
  return /[A-Z]/.test(first) ? first : "#";
}

export default function IngredientsPage() {
  const [ingredients, setIngredients] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const sectionRefs = useRef({});

  useEffect(() => {
    let active = true;
    setLoading(true);
    setError(null);

    axiosClient
      .get("/active-ingredients")
      .then((res) => {
        if (!active) return;
        setIngredients(res?.data.data || []);
      })
      .catch(() => {
        if (!active) return;
        setError("Không tải được danh sách hoạt chất. Vui lòng thử lại.");
      })
      .finally(() => {
        if (!active) return;
        setLoading(false);
      });

    return () => {
      active = false;
    };
  }, []);

  // Nhóm hoạt chất theo chữ cái đầu (đã sort A-Z từ backend, giữ nguyên thứ tự)
  const groups = useMemo(() => {
    console.log("1. Giá trị của ingredients:", ingredients);
    console.log("2. Kiểu dữ liệu (type):", typeof ingredients);
    console.log("3. Có phải là mảng không?:", Array.isArray(ingredients));
    const map = {};
    for (const item of ingredients) {
      const letter = getFirstLetter(item.ingredientName);
      if (!map[letter]) map[letter] = [];
      map[letter].push(item);
    }
    return map;
  }, [ingredients]);

  const availableLetters = useMemo(() => {
    return Object.keys(groups).sort((a, b) => {
      if (a === "#") return 1;
      if (b === "#") return -1;
      return a.localeCompare(b);
    });
  }, [groups]);

  const scrollToLetter = (letter) => {
    sectionRefs.current[letter]?.scrollIntoView({
      behavior: "smooth",
      block: "start",
    });
  };

  return (
    <div className="mx-auto max-w-6xl px-6 py-8">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <h1 className="text-2xl font-bold tracking-tight text-slate-900">
            Danh mục hoạt chất
          </h1>
          <p className="mt-1 text-sm text-slate-500">
            Sắp xếp theo thứ tự bảng chữ cái
          </p>
        </div>
        {!loading && !error && (
          <span className="rounded-full bg-teal-50 px-3 py-1 text-xs font-medium text-teal-700">
            {ingredients.length} hoạt chất
          </span>
        )}
      </div>

      {loading && (
        <div className="flex items-center justify-center gap-2 py-24 text-slate-400">
          <FiLoader className="h-5 w-5 animate-spin" />
          <span className="text-sm">Đang tải danh sách…</span>
        </div>
      )}

      {!loading && error && (
        <div className="rounded-xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm text-rose-700">
          {error}
        </div>
      )}

      {!loading && !error && ingredients.length === 0 && (
        <div className="rounded-xl border border-dashed border-slate-200 bg-slate-50 px-4 py-16 text-center">
          <FiDroplet className="mx-auto mb-3 h-8 w-8 text-slate-300" />
          <p className="text-sm font-medium text-slate-600">
            Chưa có hoạt chất nào
          </p>
        </div>
      )}

      {!loading && !error && ingredients.length > 0 && (
        <div className="flex gap-8">
          {/* Nội dung chính: nhóm theo chữ cái */}
          <div className="flex-1 space-y-10">
            {availableLetters.map((letter) => (
              <section
                key={letter}
                ref={(el) => (sectionRefs.current[letter] = el)}
                id={`letter-${letter}`}
                className="scroll-mt-20"
              >
                <div className="mb-3 flex items-center gap-3">
                  <span className="flex h-8 w-8 items-center justify-center rounded-lg bg-slate-900 text-sm font-bold text-white">
                    {letter}
                  </span>
                  <div className="h-px flex-1 bg-slate-200" />
                </div>

                <ul className="grid grid-cols-1 gap-2 sm:grid-cols-2">
                  {groups[letter].map((item) => (
                    <li
                      key={item.ingredientId}
                      className="rounded-lg border border-slate-100 bg-white px-4 py-3 font-medium text-slate-800"
                    >
                      {item.ingredientName}
                    </li>
                  ))}
                </ul>
              </section>
            ))}
          </div>

          {/* Mục lục A-Z bám dính bên phải, bấm để nhảy tới nhóm chữ tương ứng */}
          <aside className="hidden w-12 shrink-0 lg:block">
            <div className="sticky top-24 flex flex-col items-center gap-0.5 rounded-full border border-slate-100 bg-white py-3 shadow-sm">
              {ALPHABET.map((letter) => {
                const isAvailable = availableLetters.includes(letter);
                return (
                  <button
                    key={letter}
                    disabled={!isAvailable}
                    onClick={() => scrollToLetter(letter)}
                    className={`flex h-6 w-6 items-center justify-center rounded-full text-[11px] font-semibold transition ${
                      isAvailable
                        ? "text-slate-600 hover:bg-teal-100 hover:text-teal-700"
                        : "text-slate-200"
                    }`}
                  >
                    {letter}
                  </button>
                );
              })}
            </div>
          </aside>
        </div>
      )}
    </div>
  );
}
