import { Outlet } from "react-router-dom";
import Header from "../components/common/Header";
import Footer from "../components/common/Footer";
import ChatbotWidget from "../components/common/chatbot";

export default function CommonLayout() {
  return (
    <div className="min-h-screen flex flex-col bg-gradient-to-br from-blue-100 via-sky-50 to-blue-50 text-slate-900 selection:bg-blue-500 selection:text-white">
      <Header />
      <main className="flex-1">
        <Outlet />
      </main>
      <Footer />
      <ChatbotWidget />
    </div>
  );
}
