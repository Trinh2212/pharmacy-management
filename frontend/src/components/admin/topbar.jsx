import { FaSearch} from "react-icons/fa";

export function Topbar({ title, subtitle }) {
  return (
    <header className="bg-card border-b border-border">
      <div className="flex items-center gap-4 px-6 py-4">
        
        <div className="flex-1 min-w-0">
          <h1 className="text-xl font-extrabold truncate">{title}</h1>
          {subtitle && (
            <p className="text-sm text-muted-foreground mt-0.5">{subtitle}</p>
          )}
        </div>

        {/* ô tìm kiếm */}
        <div className="hidden md:flex items-center bg-secondary rounded-full px-4 py-2 w-72">
          <FaSearch className="h-4 w-4 text-muted-foreground" />
          <input
            placeholder="Tìm kiếm…"
            className="flex-1 bg-transparent px-3 text-sm outline-none"
          />
        </div>
        {/* Avatar Admin */}
        <div className="h-10 w-10 rounded-full bg-gradient-hero grid place-items-center text-primary-foreground font-bold">
          A
        </div>
      </div>
    </header>
  );
}
