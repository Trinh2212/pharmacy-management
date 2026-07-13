import { useState, useRef, useEffect } from "react";
import axiosClient from "../../api/axiosClient";
import { FaTimes, FaPaperPlane } from "react-icons/fa";
import { IoLogoSnapchat } from "react-icons/io";

const ChatbotWidget = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [messages, setMessages] = useState([
    { role: "assistant", content: "Chao xìn! Mình là trợ lý CareMind. Bạn cần tra cứu thông tin hay hướng dẫn sử dụng thuốc gì?" }
  ]);
  const [input, setInput] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const messagesEndRef = useRef(null);

  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages, isLoading]);

  const handleSendMessage = async (e) => {
    e.preventDefault();
    if (!input.trim()) return;

    const userMessage = { role: "user", content: input };
    setMessages((prev) => [...prev, userMessage]);
    setInput("");
    setIsLoading(true);

    try {
      // lấy 5-6 tin nhắn gần nhất làm ngữ cảnh, (chứ trong db không có lưu lịch sử)
      const history = messages.map(msg => ({
        role: msg.role,
        content: msg.content
      }));

      const response = await axiosClient.post("/chatbot", {
        message: userMessage.content,
        history: history.slice(-6)
      });

      setMessages((prev) => [
        ...prev,
        {
          role: "assistant",
          content: response.data.data.reply,
          thinkingType: response.data.data.thinkingType // Lưu thêm trạng thái này vào state
        }
      ]);
    } catch (err) {
      setMessages((prev) => [
        ...prev,
        { role: "assistant", content: "Xin lỗi, hiện tại mình đang có sự cố. Đợi mình một chút và thử lại sau nhé!" }
      ]);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="fixed bottom-6 right-6 z-50">
      {!isOpen && (
        <button
          onClick={() => setIsOpen(true)}
          className="p-4 rounded-full bg-gradient-to-br from-blue-700 to-cyan-500 text-white shadow-lg shadow-blue-600/20 transition-all duration-500 ease-in-out hover:-translate-y-1 hover:shadow-xl hover:shadow-blue-600/40 disabled:opacity-60 disabled:cursor-not-allowed disabled:transform-none flex items-center justify-center"
        >
          <IoLogoSnapchat size={24} />
        </button>
      )}

      {/* Cửa sổ chat */}
      {isOpen && (
        <div className="w-80 sm:w-96 bg-white rounded-2xl shadow-2xl border border-gray-200 overflow-hidden flex flex-col h-[500px]">
          {/* Header */}
          <div className="bg-gradient-to-r from-blue-700 to-cyan-500 text-white px-4 py-3 flex justify-between items-center shadow-md border-b border-white/10">
            <div className="flex items-center gap-2">
              <IoLogoSnapchat size={20} />
              <span className="font-semibold tracking-wide text-white">
                CareMind Chatbot
              </span>
            </div>

            <button
              onClick={() => setIsOpen(false)}
              className="text-white p-1.5 rounded-full transition-colors duration-200 ease-in-out hover:bg-white/20 flex items-center justify-center"
            >
              <FaTimes size={18} />
            </button>
          </div>

          {/* Nội dung chat */}
          <div className="flex-1 overflow-y-auto p-4 bg-gray-50 flex flex-col gap-3">
            {messages.map((msg, index) => (
              <div key={index} className="flex flex-col mb-1">
                {/* Khối nội dung tin nhắn */}
                <div
                  className={`max-w-[85%] p-3 rounded-xl text-sm ${
                    msg.role === "user"
                      ? "bg-gradient-to-br from-blue-700 to-cyan-500 text-white self-end rounded-tr-none shadow-sm"
                      : "bg-white border border-gray-200 text-gray-800 self-start rounded-tl-none whitespace-pre-wrap"
                  }`}
                >
                  {msg.content}
                </div>

                {/* hiển thị nguồn thông tin lấy dữ liệu */}
                {msg.role === "assistant" && msg.thinkingType && (
                  <div className="text-[10px] text-gray-400 mt-1 ml-2 self-start">
                    {msg.thinkingType.includes("slow") ? (
                      <span className="text-emerald-600 font-semibold">
                        Dữ liệu được truy xuất từ cơ sở dữ liệu của nhà thuốc
                      </span>
                    ) : (
                      <span className="text-blue-600 font-semibold">
                        Trả lời nhanh
                      </span>
                    )}
                  </div>
                )}
              </div>
            ))}
            <div ref={messagesEndRef} />
          </div>

          {/* form */}
          <form
            onSubmit={handleSendMessage}
            className="p-3 border-t bg-white flex gap-2"
          >
            <input
              type="text"
              className="flex-1 px-3 py-2 border rounded-xl focus:outline-none focus:border-blue-500 text-sm"
              placeholder="Nhập thông tin cần tra cứu ..."
              value={input}
              onChange={(e) => setInput(e.target.value)}
              disabled={isLoading}
            />
            <button
              type="submit"
              disabled={isLoading || !input.trim()}
              className="bg-gradient-to-r from-blue-700 to-cyan-500 text-white px-4 py-2 rounded-xl transition-all duration-200 flex items-center justify-center hover:opacity-90 active:scale-95 disabled:from-gray-400 disabled:to-gray-400 disabled:cursor-not-allowed disabled:scale-100 disabled:opacity-100"
            >
              <FaPaperPlane size={14} />
            </button>
          </form>
        </div>
      )}
    </div>
  );
};

export default ChatbotWidget;