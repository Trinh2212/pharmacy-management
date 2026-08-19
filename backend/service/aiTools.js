const { Op } = require("sequelize");
const db = require("../models/index.model");

// hàm hỗ trợ cho tool chi tiết và hdsd
const findMedicineByNameHelper = async (medicineName) => {
  if (!medicineName) return null;

  const keyword = medicineName.trim();

  const includeOptions = [
    {
      model: db.MedicineGroup,
      as: "medicineGroupInfo",
    },
    {
      model: db.UsageInstruction,
      as: "usageInstruction",
    },
    {
      model: db.MedicineIngredientDetail,
      as: "ingredientDetailInfo",
      include: [{ model: db.ActiveIngredient, as: "ingredientInfo" }],
    },
    {
      model: db.Batch,
      as: "batchInfo",
    },
  ];

  // Ưu tiên khớp tuyệt đối tên thuốc trước để nó tránh trả sai thuốc khi có tên gần giống nhau
  let medicine = await db.Medicine.findOne({
    where: { brandName: keyword },
    include: includeOptions,
  });

  // Nếu không có khớp tuyệt đối, fallback sang khớp gần đúng
  // Ưu tiên tên ngắn nhất trước gần đúng với keyword người dùng nhập
  if (!medicine) {
    medicine = await db.Medicine.findOne({
      where: { brandName: { [Op.like]: `%${keyword}%` } },
      order: [
        [db.sequelize.fn("LENGTH", db.sequelize.col("brandName")), "ASC"],
      ],
      include: includeOptions,
    });
  }

  return medicine ? medicine.toJSON() : null;
};

const formatPrice = (price) => {
  if (!price) return "Đang cập nhật";
  return parseInt(price, 10).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
};


const pharmacyTools = {
  executeSearchMedicine: async (args) => {
    try {
      console.log("[TOOL EXECUTION] search_medicine:", args);
      const { query, medicineGroup, maxPrice } = args || {};

      if (!query && !medicineGroup) {
        return { status: "error", message: "Vui lòng nhập thông tin bạn muốn tra cứu (VD: tên thuốc, hoạt chất, nhóm thuốc)" };
      }

      // gọi RAG Semantic Search trước
      const { semanticSearchMedicine } = require("./rag/retrievalService");
      let medicines = await semanticSearchMedicine(query || "", { maxPrice, medicineGroup }, 5);

      // Fallback: Nếu RAG chưa có vector data thì dùng Fuzzy Search truyền thống của MySQL
      if (!medicines || medicines.length === 0) {
        console.log("[TOOL] Fallback Fuzzy Search MySQL...");
        const keyword = (query || "").trim();
        const groupKeyword = (medicineGroup && medicineGroup.trim()) || keyword;

        const commonFilter = { status: "đang cung cấp" };
        if (maxPrice) {
          commonFilter.price = { [Op.lte]: parseFloat(maxPrice) };
        }

        // tra theo nhóm thuốc trước (khớp groupName với medicineGroup hoặc chính keyword)
        let rows = await db.Medicine.findAll({
          where: commonFilter,
          limit: 5,
          order: [["brandName", "ASC"]],
          include: [
            {
              model: db.MedicineGroup,
              as: "medicineGroupInfo",
              where: { groupName: { [Op.like]: `%${groupKeyword}%` } },
              required: true,
            },
          ],
        });

        //  Nếu không ra theo nhóm, fallback tra theo tên/mã thuốc như cũ
        if (rows.length === 0) {
          rows = await db.Medicine.findAll({
            where: {
              ...commonFilter,
              [Op.or]: [
                { medicineCode: { [Op.like]: `%${keyword}%` } },
                { brandName: { [Op.like]: `%${keyword}%` } },
              ],
            },
            limit: 5,
            order: [["brandName", "ASC"]],
            include: [{ model: db.MedicineGroup, as: "medicineGroupInfo" }],
          });
        }

        medicines = rows.map(r => r.toJSON());
      }

      if (medicines.length === 0) {
        return {
          status: "not_found",
          message: `Chưa tìm thấy thuốc hoặc thông tin liên quan đến "${query}" trong hệ thống.`,
        };
      }
      return {
        status: "success",
        message: "Tìm kiếm thành công.",
        data: {
          query: query || medicineGroup,
          results: medicines.map((m) => ({
            code: m.medicineCode,
            name: m.brandName,
            origin: m.origin || "Việt Nam",
            unit: m.unit || "chưa cập nhật",
            price: formatPrice(m.price) + " VNĐ",
            status: m.status,
          })),
        }
      };
    } catch (error) {
      console.error("[TOOL ERROR] search_medicine:", error);
      return { status: "error", message: "Lỗi hệ thống khi tra cứu dữ liệu thuốc." };
    }
  },

  executeGetMedicineDetails: async (args) => {
    try {
      console.log("[TOOL EXECUTION] get_medicine_details:", args);
      const { medicineName } = args || {};

      if (!medicineName) {
        return { status: "error", message: "Vui lòng cung cấp tên thuốc." };
      }

      const medicine = await findMedicineByNameHelper(medicineName);

      if (!medicine) {
        return { status: "not_found", message: `Không tìm thấy thuốc "${medicineName}" trên hệ thống.` };
      }

      const totalStock = (medicine.batchInfo || []).reduce((sum, b) => sum + (b.stockQuantity || 0), 0);

      return {
        status: "success",
        message: "Lấy chi tiết thuốc thành công.",
        data: {
          code: medicine.medicineCode,
          name: medicine.brandName,
          origin: medicine.origin,
          price: formatPrice(medicine.price) + " VNĐ",
          unit: medicine.unit,
          status: medicine.status,
          totalStock: totalStock,
          groups: (medicine.medicineGroupInfo || []).map(g => g.groupName).join(", ") || "Chưa cập nhật",
          ingredients: (medicine.ingredientDetailInfo || []).map(ing => ({
            name: ing.ingredientInfo?.ingredientName || "Chưa cập nhật",
            strength: ing.strength || "Chưa cập nhật"
          }))
        },
      };
    } catch (error) {
      console.error("[TOOL ERROR] get_medicine_details:", error);
      return { status: "error", message: "Lỗi hệ thống khi trích xuất chi tiết thuốc." };
    }
  },

  executeGetUsageInstructions: async (args) => {
    try {
      console.log("[TOOL EXECUTION] get_usage_instructions:", args);
      const { medicineName } = args || {};

      if (!medicineName) {
        return { status: "error", message: "Vui lòng cung cấp tên thuốc." };
      }

      const medicine = await findMedicineByNameHelper(medicineName);

      if (!medicine) {
        return { status: "not_found", message: `Không tìm thấy thuốc "${medicineName}" để xem hướng dẫn.` };
      }

      const usage = medicine.usageInstruction;

      if (!usage) {
        return {
          status: "not_found",
          message: `Thuốc ${medicine.brandName} hiện chưa được cập nhật tờ hướng dẫn sử dụng chi tiết chi tiết.`,
        };
      }

      return {
        status: "success",
        message: "Lấy hướng dẫn sử dụng thành công.",
        data: {
          medicineName: medicine.brandName,
          instructions: {
            dosageForm: usage.dosageForm || "Chưa cập nhật",
            packaging: usage.packaging || "Chưa cập nhật",
            uses: usage.uses || "Chưa cập nhật",
            contraindications:
              usage.contraindications || "Không có chống chỉ định đặc biệt",
            sideEffects:
              usage.sideEffects || "Chưa ghi nhận tác dụng phụ nguy hiểm",
            dosageAdministration:
              usage.dosageAdministration || "Chưa cập nhật liều dùng",
            storageCondition: usage.storageCondition || "Nơi khô ráo, thoáng mát",
            warning: usage.warning || "Không có cảnh báo đặc biệt",
          }
        },
      };
    } catch (error) {
      console.error("[TOOL ERROR] get_usage_instructions:", error);
      return { status: "error", message: "Lỗi khi truy vấn bảng hướng dẫn sử dụng." };
    }
  },

  executeSearchIngredient: async (args) => {
    try {
      console.log("[TOOL EXECUTION] search_ingredient:", args);
      const { ingredientName } = args || {};

      if (!ingredientName) {
        return { status: "error", message: "Vui lòng cung cấp tên hoạt chất." };
      }

      const keyword = ingredientName.trim();

      const matches = await db.MedicineIngredientDetail.findAll({
        limit: 5,
        include: [
          {
            model: db.ActiveIngredient,
            as: "ingredientInfo",
            where: { ingredientName: { [Op.like]: `%${keyword}%` } },
          },
          {
            model: db.Medicine,
            as: "medicineInfo",
          },
        ],
      });

      if (matches.length === 0) {
        return {
          status: "not_found",
          message: `Không tìm thấy sản phẩm thuốc nào chứa hoạt chất "${ingredientName}".`,
        };
      }

      return {
        status: "success",
        message: "Tìm kiếm hoạt chất thành công.",
        data: {
          ingredientName: ingredientName,
          results: matches.map(m => ({
            code: m.medicineInfo?.medicineCode,
            name: m.medicineInfo?.brandName,
            unit: m.medicineInfo?.unit,
            price: formatPrice(m.medicineInfo?.price) + " VNĐ",
            strength: m.strength
          }))
        }
      };
    } catch (error) {
      console.error("[TOOL ERROR] search_ingredient:", error);
      return { status: "error", message: "Lỗi khi tìm kiếm theo cấu trúc hoạt chất." };
    }
  },
};

module.exports = pharmacyTools;