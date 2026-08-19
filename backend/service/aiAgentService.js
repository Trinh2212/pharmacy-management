const Groq = require("groq-sdk");
const pharmacyTools = require("./aiTools");

const groq = new Groq({
  apiKey: process.env.GROQ_API_KEY,
});

const { systemInstruction } = require("./prompts");

const tools = [
  {
    type: "function",
    function: {
      name: "search_medicine",
      description:
        "Tìm kiếm thuốc theo tên thuốc và nhóm thuốc. Trả về danh sách thuốc liên quan.",
      parameters: {
        type: "object",
        properties: {
          query: {
            type: "string",
            description:
              "Tên thuốc(VD: 'Amoxicillin', 'thuốc hạ sốt')",
          },
          medicineGroup: {
            type: "string",
            description:
              "Nhóm thuốc chính xác của thuốc được lưu trữ.",
          },
        },
        required: ["query"],
      },
    },
  },
  {
    type: "function",
    function: {
      name: "get_medicine_details",
      description: "Lấy thông tin chi tiết một thuốc cụ thể: mã thuốc, xuất xứ, giá, đơn vị, trạng thái, tồn kho, nhóm thuốc và THÀNH PHẦN HOẠT CHẤT (dùng khi khách hỏi thuốc X chứa hoạt chất/thành phần gì).",
      parameters: {
        type: "object",
        properties: {
          medicineName: {
            type: "string",
            description:
              "Tên thuốc chính xác mà khách hàng muốn tìm. Không tự suy diễn và không bịa thuốc khác.",
          },
        },
        required: ["medicineName"],
      },
    },
  },
  {
    type: "function",
    function: {
      name: "get_usage_instructions",
      description:
        "Lấy hướng dẫn sử dụng chi tiết: dạng bào chế, quy cách đóng gói, công dụng, chống chỉ định, tác dụng phụ, liều dùng & cách dùng, bảo quản , cảnh báo - thận trọng",
      parameters: {
        type: "object",
        properties: {
          medicineName: {
            type: "string",
            description: "Tên thuốc chính xác cần xem hướng dẫn",
          },
        },
        required: ["medicineName"],
      },
    },
  },
  {
    type: "function",
    function: {
      name: "search_ingredient",
      description:
        "Tìm thuốc chứa hoạt chất cụ thể (VD: 'Paracetamol', 'Ibuprofen', 'Vitamin C')",
      parameters: {
        type: "object",
        properties: {
          ingredientName: {
            type: "string",
            description: "Tên hoạt chất (VD: 'Paracetamol', 'Amoxicillin')",
          },
        },
        required: ["ingredientName"],
      },
    },
  },
];

const toGroqMessages = (chatHistory) => {
  return chatHistory
    .filter(
      (m) => m.role === "user" || m.role === "assistant",
    )
    .slice(-6)
    .map((m) => ({
      role: m.role === "assistant" ? "assistant" : m.role,
      content: m.content || "",
    }));
};

const executeTool = async (toolName, toolArgs, userId) => {
  console.log(`[PHARMACY TOOL] ${toolName}`, toolArgs);

  switch (toolName) {
    case "search_medicine":
      return await pharmacyTools.executeSearchMedicine(toolArgs);
    case "get_medicine_details":
      return await pharmacyTools.executeGetMedicineDetails(toolArgs);
    case "get_usage_instructions":
      return await pharmacyTools.executeGetUsageInstructions(toolArgs);
    case "search_ingredient":
      return await pharmacyTools.executeSearchIngredient(toolArgs);
    default:
      console.warn(`[PHARMACY] Tool không tồn tại: ${toolName}`);
      return { error: `Công cụ '${toolName}' không hỗ trợ.` };
  }
};


//  xử lý user message
const pharmacyAiAgentService = {
  processUserMessage: async (userMessage, chatHistory = [], userId = null) => {
    try {
      const groqMessages = [
        { role: "system", content: systemInstruction },
        ...toGroqMessages(chatHistory),
        { role: "user", content: userMessage },
      ];

      console.log(
        `[PHARMACY AI] Processing message from user ${userId}: "${userMessage}"`,
      );

      const completion = await groq.chat.completions.create({
        model: "openai/gpt-oss-120b",
        messages: groqMessages,
        tools: tools,
        tool_choice: "auto",
        temperature: 0.1,
        max_tokens: 2048,
      });

      const assistantMessage = completion.choices[0].message;
      console.log(assistantMessage)

      // Kiểm tra nếu AI gọi tool
      if (
        assistantMessage.tool_calls &&
        assistantMessage.tool_calls.length > 0
      ) {
        // Thêm tin nhắn của assistant chứa toàn bộ tool_calls vào history
        groqMessages.push({
          role: "assistant",
          content: assistantMessage.content || "",
          tool_calls: assistantMessage.tool_calls,
        });

        // Xử lý song song tất cả các tool calls bằng Promise.all
        const toolPromises = assistantMessage.tool_calls.map(async (toolCall) => {
          const toolName = toolCall.function.name;

          let toolArgs = {};
          try {
            toolArgs = JSON.parse(toolCall.function.arguments || "{}");
          } catch (parseError) {
            console.error(`[PHARMACY AI] Lỗi parse JSON arguments cho tool ${toolName}:`, parseError);
          }

          console.log(`[PHARMACY AI] Gọi tool: ${toolName}`, toolArgs);

          // Thực thi tool
          const toolResult = await executeTool(toolName, toolArgs, userId);

          // Trả về object định dạng chuẩn của "tool" message
          return {
            role: "tool",
            tool_call_id: toolCall.id,
            name: toolName,
            content: JSON.stringify(toolResult),
          };
        });

        const toolResponses = await Promise.all(toolPromises);

        // Gắn tất cả kết quả của các tool vào lịch sử chat
        groqMessages.push(...toolResponses);

        // Get final response từ AI
        const finalCompletion = await groq.chat.completions.create({
          model: "openai/gpt-oss-120b",
          messages: groqMessages,
          temperature: 0.5,
          max_tokens: 2048,
        });

        const finalReply = finalCompletion.choices[0].message.content;

        return {
          reply: finalReply,
          thinkingType: "slow (tool used)",
          toolUsed: assistantMessage.tool_calls.map(t => t.function.name).join(", "),
        };
      }

      // No tool called - fast thinking
      console.log("[PHARMACY AI] Fast thinking (no tool)");
      return {
        reply: assistantMessage.content,
        thinkingType: "fast",
        toolUsed: null,
      };
    } catch (error) {
      console.error("[PHARMACY AI SERVICE ERROR]", error);

      if (error?.error?.error?.code === "tool_use_failed") {
        const raw = error.error.error.failed_generation || "";
        const match = raw.match(/<function=(\w+)(\{.*\})<\/function>/);
        if (match) {
          const recoveredToolName = match[1];
          let recoveredArgs = {};
          try {
            recoveredArgs = JSON.parse(match[2]);
          } catch (_) { }

          console.log(
            `[PHARMACY AI] Tự phục hồi tool: ${recoveredToolName}`,
            recoveredArgs,
          );
          const toolResult = await executeTool(
            recoveredToolName,
            recoveredArgs,
            userId,
          );

          const finalCompletion = await groq.chat.completions.create({
            model: "openai/gpt-oss-120b",
            messages: [
              { role: "system", content: systemInstruction },
              { role: "user", content: userMessage },
              {
                role: "assistant",
                content: `Đã tra cứu bằng ${recoveredToolName}.`,
              },
              {
                role: "tool",
                tool_call_id: "recovered_call",
                name: recoveredToolName,
                content: JSON.stringify(toolResult),
              },
            ],
            temperature: 0.5,
            max_tokens: 2048,
          });

          return {
            reply: finalCompletion.choices[0].message.content,
            thinkingType: "slow (recovered)",
            toolUsed: recoveredToolName,
          };
        }
      }

      if (error.status === 429) {
        return {
          reply:
            "Hệ thống đang có sự cố rồi, Bạn chờ mình xíu rồi nhắn lại nhé",
          thinkingType: "rate_limit",
        };
      }

      if (error.status === 401 || error.status === 403) {
        return {
          reply:
            "Hệ thống đang bảo trì, Bạn liên hệ nhà thuốc để được hỗ trợ nhé",
          thinkingType: "auth_error",
        };
      }

      return {
        reply: "Hệ thống đang có sự cố rồi, Bạn chờ mình xíu rồi nhắn lại nhé -.-",
        thinkingType: "error",
      };
    }
  },
};

module.exports = pharmacyAiAgentService;
