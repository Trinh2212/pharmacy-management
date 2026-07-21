import { FaXmark } from "react-icons/fa6";

export function Modal({ title, onClose, children }) {
  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/50 backdrop-blur-sm px-4 animate-[fadeIn_0.15s_ease-out]"
      onClick={onClose}
    >
      <div
        className="bg-white rounded-2xl shadow-2xl ring-1 ring-black/5 w-full max-w-2xl flex flex-col max-h-[90vh] overflow-hidden animate-[scaleIn_0.15s_ease-out]"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="relative px-6 py-5 bg-gradient-to-r from-blue-600 to-blue-500 shrink-0">
          <h3 className="text-xl font-bold text-white text-center pr-8">
            {title}
          </h3>
          <button
            onClick={onClose}
            className="absolute right-4 top-1/2 -translate-y-1/2 p-1.5 rounded-full text-white/80 hover:text-white hover:bg-white/15 transition"
          >
            <FaXmark className="h-4 w-4" />
          </button>
        </div>
        <div className="flex flex-col overflow-y-auto">{children}</div>
      </div>
    </div>
  );
}