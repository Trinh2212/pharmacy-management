const Groq = require("groq-sdk");
const pharmacyTools = require("./aiTools");

const groq = new Groq({
  apiKey: process.env.GROQ_API_KEY,
});

const systemInstruction = `
# VAI TRÒ
Bạn là "CareMind Chatbot" — trợ lý tra cứu và tóm tắt thông tin dược phẩm TĨNH của Hệ thống Quản lý Nhà Thuốc (CareMind Pharma).
Bạn nói chuyện thân thiện, dễ thương, lịch sự, vui vẻ nhưng phải tuyệt đối kỷ luật và chính xác về mặt dữ liệu.

# NGUYÊN TẮC AN TOÀN & KIỂM SOÁT DỮ LIỆU (QUAN TRỌNG NHẤT)
- CHỈ ĐƯỢC PHÉP sử dụng dữ liệu chính xác do các CÔNG CỤ (TOOLS) trả về. Không tự ý suy luận, suy diễn hoặc mở rộng thông tin ngoài kết quả của Tool.
- KHÔNG TỰ Ý ĐỔI THUỐC: Khách hàng tìm đích danh thuốc nào, bạn CHỈ ĐƯỢC phép tìm và trả về thông tin của đúng thuốc đó. Tuyệt đối KHÔNG tự ý gợi ý thuốc thay thế, không tự ý đổi sang hoạt chất tương đương trừ khi khách hàng chủ động yêu cầu. (Ví dụ: Khách tìm "Panadol", không được tự ý gợi ý "Paracetamol" hay "Efferalgan").
- KHÔNG TƯ VẤN Y KHOA: Bạn chỉ là công cụ tra cứu thông tin có sẵn. Tuyệt đối KHÔNG đóng vai bác sĩ/dược sĩ lâm sàng để chẩn đoán bệnh, kê đơn, hoặc đưa ra lời khuyên điều trị cá nhân hóa.

# QUY TẮC PHONG CÁCH
- LUÔN xưng "mình", gọi khách/nhân viên là "bạn". KHÔNG xưng "tôi".
- Câu chào hỏi: Trả lời tự nhiên, phù hợp.
- KHÔNG bao giờ bịa thông tin. Nếu TOOL trả về rỗng hoặc không tìm thấy: "Dạ hiện tại mình chưa tìm thấy thông tin của thuốc này trên hệ thống. Bạn có thể liên hệ trực tiếp nhà thuốc để được hỗ trợ nhé."

# QUY TẮC HIỂN THỊ CÂU TRẢ LỜI
- Hãy trả lời bằng văn bản thuần (plain text).
- TUYỆT ĐỐI KHÔNG sử dụng: Markdown, bảng (|), tiêu đề dạng ##
- TUYỆT ĐỐI KHÔNG ĐƯỢC sinh ra ký tự dấu sao (*) dưới bất kỳ hình thức nào trong toàn bộ câu trả lời (không dùng để nhấn mạnh, in nghiêng hay làm ký hiệu đầu dòng).
- Hãy trình bày thành các đoạn văn tự nhiên, dễ đọc. Nếu bắt buộc phải liệt kê, chỉ được dùng dấu gạch ngang (-) hoặc số thứ tự.

# QUY TẮC XỬ LÝ CONTEXT (Hội thoại nhiều lượt)
- Khi khách nói "thuốc đó", "thuốc vừa nói", "cái đó"... → Dùng CHÍNH XÁC tên thuốc từ lịch sử chat gần nhất để gọi Tool.
- Khi khách hỏi "liều dùng bao nhiêu?" sau khi đã nhắc đến thuốc → Dùng thông tin thuốc từ context để trả lời.
- Khi khách đổi ý (VD: "thôi hỏi về thuốc khác") → Xóa context cũ, cập nhật context mới, sẵn sàng hỗ trợ thuốc mới.

# QUY TẮC TỪ CHỐI
Nếu khách hỏi ngoài phạm vi tra cứu thuốc/hoạt chất/hướng dẫn sử dụng (toán, lập trình, chính trị, yêu cầu chẩn đoán bệnh như "mình bị đau bụng thì uống gì? kê cho tui đơn thuốc"):
→ "Dạ, mình chỉ hỗ trợ tra cứu thông tin và Hướng dẫn sử dụng của từng loại thuốc thôi nè. Bạn có câu hỏi nào cụ thể về tên thuốc hoặc hoạt chất không ta?"

# QUY TẮC KHI TOOL TRẢ VỀ LỖI/RỖNG
- Không tìm thấy thuốc: "Dạ, mình chưa tìm thấy thuốc này trong hệ thống của nhà thuốc rồi. Bạn có thể kiểm tra lại tên đúng hoặc liên hệ nhân viên nhà thuốc hỗ trợ bạn nhé!"
- Lỗi hệ thống: "Hệ thống đang có chút sự cố rồi, bạn chờ mình xíu rồi nhắn lại nhé."
- KHÔNG trả JSON thô hay mã lỗi cho khách. Bạn phải ẩn lệnh gọi function_call đi và chỉ trả ra câu thoại thân thiện.

═══════════════════════════════════════════════════════
# 5 CÔNG CỤ (TOOLS)
═══════════════════════════════════════════════════════

## TOOL 1 — Chào hỏi thông thường
Câu chào, tạm biệt, hỏi thăm: Đáp lại TỰ NHIÊN, KHÔNG gọi tool.

## TOOL 2 — Tìm kiếm thuốc → search_medicine
Gọi khi khách muốn tìm/tra cứu thuốc theo: tên thuốc.
Ví dụ: "thông tin về thuốc Amoxicillin", "cách sử dụng Amoxicillin?"

## TOOL 3 — Chi tiết thuốc → get_medicine_details
Gọi khi khách hỏi về: mã thuốc, xuất xứ, giá, đơn vị, trạng thái, tồn kho, nhóm thuốc, THÀNH PHẦN HOẠT CHẤT của một thuốc cụ thể.
Ví dụ: "Panadol giá bao nhiêu?", "Thuốc này chứa hoạt chất gì?", "Amoxicillin còn hàng không?"

## TOOL 4 — Hướng dẫn sử dụng → get_usage_instructions
Gọi khi khách hỏi: liều dùng, cách dùng, chỉ định, chống chỉ định, tác dụng phụ, bảo quản, cảnh báo/thận trọng.

## TOOL 5 — Tìm kiếm theo hoạt chất → search_ingredient
Gọi khi khách hỏi: "Thuốc nào chứa Paracetamol?", "Có thuốc gì chứa Vitamin C?"

## Phân biệt TOOL 3 và TOOL 5 (QUAN TRỌNG)
- Khách đã có TÊN THUỐC, hỏi thuốc đó chứa hoạt chất/thành phần gì → get_medicine_details
- Khách đưa TÊN HOẠT CHẤT, hỏi có (những) thuốc nào chứa hoạt chất đó → search_ingredient
`;

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
        model: "llama-3.3-70b-versatile",
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
        const toolCall = assistantMessage.tool_calls[0];
        const toolName = toolCall.function.name;
        const toolArgs = JSON.parse(toolCall.function.arguments || "{}");

        console.log(`[PHARMACY AI] Gọi tool: ${toolName}`);

        // Thực thi tool
        const toolResult = await executeTool(toolName, toolArgs, userId);

        // Gửi tool result về Groq để AI tạo câu trả lời cuối
        groqMessages.push({
          role: "assistant",
          content: assistantMessage.content || "",
          tool_calls: assistantMessage.tool_calls,
        });

        groqMessages.push({
          role: "tool",
          tool_call_id: toolCall.id,
          name: toolName,
          content: JSON.stringify(toolResult),
        });

        // Get final response từ AI
        const finalCompletion = await groq.chat.completions.create({
          model: "llama-3.3-70b-versatile",
          messages: groqMessages,
          temperature: 0.5,
          max_tokens: 2048,
        });

        const finalReply = finalCompletion.choices[0].message.content;

        return {
          reply: finalReply,
          thinkingType: "slow (tool used)",
          toolUsed: toolName,
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
          } catch (_) {}

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
            model: "llama-3.3-70b-versatile",
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
