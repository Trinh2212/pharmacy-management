const aiAgentService = require("../service/aiAgentService");

const chatbotController = {
  chat: async (req, res) => {
      const { message, history } = req.body;

      if (!message) {
        return res.status(400).json({ message: "Vui lòng nhập tin nhắn." });
      }

      const response = await aiAgentService.processUserMessage(
        message,
        history || [],
      );

      return res.status(200).json({
        message: "Thành công",
        data: response, // reply, thinkingType, toolUsed 
      });
  },
};

module.exports = chatbotController;
