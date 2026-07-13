const aiAgentService = require("../service/aiAgentService");

const chatbotController = {
  chat: async (req, res) => {
    try {
      const { message, history } = req.body;

      if (!message) {
        return res.status(400).json({ message: "Vui lòng nhập tin nhắn." });
      }

      // Gọi logic AI bạn đã viết
      const response = await aiAgentService.processUserMessage(
        message,
        history || [],
      );

      return res.status(200).json({
        message: "Thành công",
        data: response, // Gồm { reply, thinkingType, toolUsed }
      });
    } catch (error) {
      console.error("[Chatbot Controller Error]", error);
      return res
        .status(500)
        .json({ message: "Lỗi server khi xử lý tin nhắn." });
    }
  },
};

module.exports = chatbotController;
