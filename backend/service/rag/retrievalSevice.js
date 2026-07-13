const { Op } = require("sequelize");
const db = require("../../models/index.model");
const { generateEmbedding } = require("./embeddingService");

// tính độ tương đồng giữa 2 vector
const cosineSimilarity = (vecA, vecB) => {
  if (!vecA || !vecB || vecA.length !== vecB.length) {
    return 0;
  }

  let dotProduct = 0,
    normA = 0,
    normB = 0;

  for (let i = 0; i < vecA.length; i++) {
    dotProduct += vecA[i] * vecB[i];
    normA += vecA[i] * vecA[i];
    normB += vecB[i] * vecB[i];
  }

  const denominator = Math.sqrt(normA) * Math.sqrt(normB);
  return denominator === 0 ? 0 : dotProduct / denominator;
};

/**
 * @param {string} query - Tên thuốc, hoạt chất, hoặc triệu chứng
 * @param {object} filters - { maxPrice, minPrice, medicineGroup, approval }
 * @param {number} topK - Số kết quả trả về
 */
const semanticSearchMedicine = async (query, filters = {}, topK = 5) => {
  try {
    console.log(`[PHARMACY RAG] Truy vấn: "${query}" | Filters:`, filters);

    const dbQuery = {};

    if (filters.approval !== false) {
      dbQuery.status = "đang cung cấp";
    }

    if (filters.maxPrice || filters.minPrice) {
      dbQuery.price = {};
      if (filters.maxPrice)
        dbQuery.price[Op.lte] = parseFloat(filters.maxPrice);
      if (filters.minPrice)
        dbQuery.price[Op.gte] = parseFloat(filters.minPrice);
    }

    // Fetch candidate medicines từ DB
    let candidateRows = await db.Medicine.findAll({
      where: dbQuery,
      include: [
        {
          model: db.MedicineGroup,
          as: "medicineGroupInfo",
          ...(filters.medicineGroup && {
            where: {
              groupName: {
                [Op.like]: `%${filters.medicineGroup}%`,
              },
            },
            required: true, 
          }),
        },
        { model: db.UsageInstruction, as: "usageInstruction" },
        {
          model: db.MedicineIngredientDetail,
          as: "ingredientDetailInfo",
          include: [{ model: db.ActiveIngredient, as: "ingredientInfo" }],
        },
      ],
    });

    let candidateMedicines = candidateRows.map((row) => row.toJSON());

    console.log(`[PHARMACY RAG] Tìm thấy ${candidateMedicines.length} thuốc thỏa filter cứng.`);

    if (candidateMedicines.length === 0) {
      return []; 
    }

    if (!query || query.trim() === "") {
      return candidateMedicines.slice(0, topK).map((m) => {
        delete m.embeddingVector;
        return m;
      });
    }

    const normalizedQuery = query.toLowerCase().trim();

    const exactMatches = [];
    const remainingMedicines = [];

    for (const medicine of candidateMedicines) {
      const brandName = (medicine.brandName || "").toLowerCase();
      if (
        brandName.includes(normalizedQuery) ||
        (brandName.length >= 3 && normalizedQuery.includes(brandName))
      ) {
        exactMatches.push({ ...medicine, relevanceScore: 1.0 });
      } else {
        remainingMedicines.push(medicine);
      }
    }

    if (exactMatches.length > 0) {
      console.log(`[PHARMACY RAG] (Hybrid) Tìm thấy ${exactMatches.length} thuốc khớp chính xác tên.`);
      return exactMatches.slice(0, topK).map((m) => {
        delete m.embeddingVector;
        return m;
      });
    }

    console.log(`[PHARMACY RAG] Không tìm thấy tên thuốc chính xác, chuyển sang tìm kiếm ngữ nghĩa...`);
    const queryVector = await generateEmbedding(query);

    if (!queryVector) {
      console.warn("[PHARMACY RAG] Không thể sinh embedding cho query. Trả kết quả mặc định.");
      return candidateMedicines.slice(0, topK).map((m) => {
        delete m.embeddingVector;
        return m;
      });
    }

    const scoredMedicines = remainingMedicines.map((medicine) => {
      let vector = null;

      if (medicine.embeddingVector) {
        vector = typeof medicine.embeddingVector === "string"
            ? JSON.parse(medicine.embeddingVector)
            : medicine.embeddingVector;
      }

      const score = vector && vector.length > 0 ? cosineSimilarity(queryVector, vector) : 0;

      delete medicine.embeddingVector; // Dọn dẹp dữ liệu trước khi trả về
      return { ...medicine, relevanceScore: score };
    });

    const relevantMedicines = scoredMedicines.filter((m) => m.relevanceScore >= 0.75);
    relevantMedicines.sort((a, b) => b.relevanceScore - a.relevanceScore);

    console.log(`[PHARMACY RAG] Trích xuất được ${relevantMedicines.length} thuốc liên quan (Score >= 0.75).`);

    return relevantMedicines.slice(0, topK);
  } catch (error) {
    console.error("[PHARMACY RAG ERROR]", error);
    return [];
  }
};

module.exports = {
  semanticSearchMedicine,
  cosineSimilarity,
};