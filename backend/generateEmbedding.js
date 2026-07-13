require("dotenv").config();
const db = require("./models/index.model");
const { generateEmbedding } = require("./service/rag/embeddingService");
const { Op } = require("sequelize");

async function generateAllEmbeddings() {
  try {
    await db.sequelize.authenticate();
    console.log("Kết nối database thành công. Đang tải dữ liệu...");

    const medicines = await db.Medicine.findAll({
      where: {
        [Op.or]: [{ embeddingVector: null }, { embeddingVector: "" }],
      },
      include: [
        {
          model: db.UsageInstruction,
          as: "usageInstruction",
        },
      ],
    });

    if (medicines.length === 0) {
      console.log(
        "Tất cả thuốc trong cơ sở dữ liệu đã có Embedding Vector!",
      );
      return;
    }

    console.log(
      `Tìm thấy ${medicines.length} thuốc cần tạo Vector. Bắt đầu xử lý...`,
    );

    let successCount = 0;
    let failCount = 0;

    for (let i = 0; i < medicines.length; i++) {
      const med = medicines[i];

      let textToEmbed = `${med.brandName || ""} ${med.medicineCode || ""}`;

      if (med.usageInstruction) {
        textToEmbed += ` ${med.usageInstruction.dosageForm || ""} ${med.usageInstruction.packaging || ""} ${med.usageInstruction.uses || ""}  ${med.usageInstruction.contraindications || ""}  ${med.usageInstruction.sideEffects || ""}  ${med.usageInstruction.dosageAdministration || ""} ${med.usageInstruction.storageCondition || ""} ${med.usageInstruction.warning || ""}`;
      }

      console.log(
        `[${i + 1}/${medicines.length}] Đang tạo vector cho: ${med.brandName}...`,
      );

      const vector = await generateEmbedding(textToEmbed.trim());

      if (vector && vector.length > 0) {
        med.embeddingVector = vector;
        await med.save();
        successCount++;
        console.log(`  -> Thành công!`);
      } else {
        failCount++;
        console.error(`  -> Thất bại khi tạo vector cho: ${med.brandName}`);
      }
    }

    console.log("TIẾN TRÌNH HOÀN TẤT!");
    console.log(` Thành công: ${successCount}`);
    console.log(` Thất bại : ${failCount}`);
  } catch (error) {
    console.error(" Đã xảy ra lỗi nghiêm trọng:", error);
  } finally {
    await db.sequelize.close();
    process.exit(0);
  }
}

generateAllEmbeddings();