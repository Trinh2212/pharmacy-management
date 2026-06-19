import Header from "../components/common/Header";
import Footer from "../components/common/Footer";

export default function CommonLayout({ children }) {
    return (
      <div className="min-h-screen flex flex-col bg-white">
        <Header />
        <main className="flex-1">{children}</main>
        <Footer />
      </div>
    );
}
