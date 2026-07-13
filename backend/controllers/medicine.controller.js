const { sequelize } = require("../config/database");
const db = require("../models/index.model");
const {Op} = require("sequelize");
const { generateEmbedding } = require("../service/rag/embeddingService");

const medicineControllers = {
  getAllMedicines: async (req, res) => {
    const { search = "", page = 1, limit = 8, groupId } = req.query;

    const parsedLimit = parseInt(limit, 10);
    const parsedPage = parseInt(page, 10);
    const offset = (parsedPage - 1) * parsedLimit;
    const keyword = search.trim();

    const filter = {};

    if (keyword) {
      filter[Op.or] = [
        { medicineCode: { [Op.like]: `%${keyword}%` } },
        { brandName: { [Op.like]: `%${keyword}%` } },
      ];
    }

    const { count, rows } = await db.Medicine.findAndCountAll({
      where: filter,
      distinct: true,
      limit: parsedLimit,
      offset,
      include: [
        {
          model: db.MedicineGroup,
          as: "medicineGroupInfo",
          where:
            groupId && groupId !== "all" ? { groupId: groupId } : undefined,
          required: !!(groupId && groupId !== "all"),
        },
        {
          model: db.MedicineIngredientDetail,
          as: "ingredientDetailInfo",
          include: [{ model: db.ActiveIngredient, as: "ingredientInfo" }],
        },
        {
          model: db.Batch,
          as: "batchInfo",
          attributes: ["batchId", "stockQuantity"],
        },
      ],
      order: [["brandName", "ASC"]],
    });

    const data = rows.map((medicine) => {
      const plain = medicine.toJSON();
      const totalStock = (plain.batchInfo || []).reduce(
        (sum, batch) => sum + (batch.stockQuantity || 0),
        0,
      );
      return { ...plain, totalStock };
    });

    return res.status(200).json({
      message: "Lấy danh sách thuốc thành công",
      data,
      totalMedicines: count,
      totalPages: Math.ceil(count / parsedLimit),
      currentPage: parsedPage,
    });
  },

  getMedicineById: async (req, res) => {
    const { id } = req.params;

    const medicine = await db.Medicine.findByPk(id, {
      include: [
        {
          model: db.MedicineIngredientDetail,
          as: "ingredientDetailInfo",
          include: [
            {
              model: db.ActiveIngredient,
              as: "ingredientInfo",
            },
          ],
        },
        {
          model: db.MedicineGroup,
          as: "medicineGroupInfo",
        },
        {
          model: db.UsageInstruction,
          as: "usageInstruction",
        },
      ],
    });

    if (!medicine) {
      return res.status(404).json({
        message: "không tìm thấy thuốc",
      });
    }

    return res.status(200).json({
      message: "lấy thông tin thuốc thành công theo id",
      data: medicine,
    });
  },

  createMedicine: async (req, res) => {
    const { groupIds, ingredients, usageData, ...medicineData } = req.body;

    const groups = await db.MedicineGroup.findAll({
      where: {
        groupId: {
          [Op.in]: groupIds,
        },
      },
    });

    if (groups.length !== groupIds.length) {
      return res.status(400).json({
        message: "có nhóm thuốc không tồn tại",
      });
    }

    const ingredientIds = ingredients.map((item) => item.ingredientId);

    const existedIngredients = await db.ActiveIngredient.findAll({
      where: {
        ingredientId: {
          [Op.in]: ingredientIds,
        },
      },
    });

    if (existedIngredients.length !== ingredientIds.length) {
      return res.status(400).json({
        message: "có hoạt chất không tồn tại",
      });
    }

    let imageUrl = "default-medicine.jpg";
    if (req.files?.medicine?.[0]) {
      imageUrl = `/uploads/medicines/${req.files.medicine[0].filename}`;
    }

    let documentUrl =
      req.body.documentPath ||
      (req.files?.document?.[0]
        ? `/uploads/medicines/${req.files.document[0].filename}`
        : null);

    let finalUsageData = usageData || null;

    let textToEmbed = `${medicineData.brandName || ""} ${medicineData.medicineCode || ""}`;
    if (finalUsageData) {
      textToEmbed += ` ${finalUsageData.dosageForm || ""} ${finalUsageData.packaging || ""} ${finalUsageData.uses || ""}  ${finalUsageData.contraindications || ""}  ${finalUsageData.sideEffects || ""}  ${finalUsageData.dosageAdministration || ""} ${finalUsageData.storageCondition || ""} ${finalUsageData.warning || ""}`;
    }
    const vector = await generateEmbedding(textToEmbed.trim());

    const result = await db.sequelize.transaction(async (t) => {
      const newMedicine = await db.Medicine.create(
        { ...medicineData, imageUrl, embeddingVector: vector },
        { transaction: t },
      );

      const medicineId = newMedicine.medicineId;

      await newMedicine.addMedicineGroupInfo(groupIds, { transaction: t });

      const ingredientEntries = ingredients.map((item) => ({
        medicineId,
        ingredientId: item.ingredientId,
        strength: item.strength,
      }));

      await db.MedicineIngredientDetail.bulkCreate(ingredientEntries, {
        transaction: t,
      });

      if (finalUsageData || documentUrl) {
        await db.UsageInstruction.create(
          {
            ...finalUsageData,
            document: documentUrl, // lưu đường dẫn ảnh tờ hướng dẫn
            medicineId,
          },
          { transaction: t },
        );
      }

      return newMedicine;
    });

    const finalMedicine = await db.Medicine.findByPk(result.medicineId, {
      include: [
        { model: db.MedicineGroup, as: "medicineGroupInfo" },
        {
          model: db.MedicineIngredientDetail,
          as: "ingredientDetailInfo",
          include: [{ model: db.ActiveIngredient, as: "ingredientInfo" }],
        },
        { model: db.UsageInstruction, as: "usageInstruction" },
      ],
    });

    return res.status(201).json({
      message: "thêm thuốc thành công",
      data: finalMedicine,
    });
  },

  deleteMedicine: async (req, res) => {
    const { id } = req.params;

    const medicine = await db.Medicine.findByPk(id);

    if (!medicine) {
      return res.status(404).json({
        message: "không tìm thấy thuốc",
      });
    }

    await medicine.destroy();

    return res.status(200).json({
      message: "xóa thuốc thành công",
    });
  },

  updateMedicine: async (req, res) => {
    const { id } = req.params;
    const { groupIds, ingredients, usageData, ...medicineData } = req.body;

    const medicine = await db.Medicine.findByPk(id);

    if (!medicine) {
      return res.status(404).json({
        message: "không tìm thấy thuốc",
      });
    }

    // kiểm tra trùng medicineCode 
    if (
      medicineData.medicineCode &&
      medicineData.medicineCode !== medicine.medicineCode
    ) {
      const existedCode = await db.Medicine.findOne({
        where: { medicineCode: medicineData.medicineCode },
      });
      if (existedCode) {
        return res.status(400).json({
          message: "mã thuốc đã tồn tại",
        });
      }
    }
    // kiểm tra nhóm thuốc 
    if (groupIds !== undefined) {
      const groups = await db.MedicineGroup.findAll({
        where: {
          groupId: {
            [Op.in]: groupIds,
          },
        },
      });

      if (groups.length !== groupIds.length) {
        return res.status(400).json({
          message: "có nhóm thuốc không tồn tại",
        });
      }
    }
    // kiểm tra hoạt chất 
    if (ingredients !== undefined) {
      const ingredientIds = ingredients.map((item) => item.ingredientId);

      const existedIngredients = await db.ActiveIngredient.findAll({
        where: {
          ingredientId: {
            [Op.in]: ingredientIds,
          },
        },
      });

      if (existedIngredients.length !== ingredientIds.length) {
        return res.status(400).json({
          message: "có hoạt chất không tồn tại",
        });
      }
    }

    let imageUrl = medicine.imageUrl;
    if (req.files?.medicine?.[0]) {
      imageUrl = `/uploads/medicines/${req.files.medicine[0].filename}`;
    }

    let documentUrl =
      req.body.documentPath ||
      (req.files?.document?.[0]
        ? `/uploads/medicines/${req.files.document[0].filename}`
        : null);

    let finalUsageData = usageData || null;

    const finalBrandName = medicineData.brandName || medicine.brandName || "";
    const finalCode = medicineData.medicineCode || medicine.medicineCode || "";
    let textToEmbed = `${finalBrandName} ${finalCode}`;

    if (finalUsageData) {
      textToEmbed += ` ${finalUsageData.dosageForm || ""} ${finalUsageData.packaging || ""} ${finalUsageData.uses || ""}  ${finalUsageData.contraindications || ""}  ${finalUsageData.sideEffects || ""}  ${finalUsageData.dosageAdministration || ""} ${finalUsageData.storageCondition || ""} ${finalUsageData.warning || ""}`;
    } else {
      // Trường hợp cập nhật  không sửa Hướng dẫn sử dụng, lấy Hướng dẫn cũ 
      const oldUsage = await db.UsageInstruction.findOne({
        where: { medicineId: medicine.medicineId },
      });
      if (oldUsage) {
        textToEmbed += `${oldUsage.dosageForm || ""} ${oldUsage.packaging || ""} ${oldUsage.uses || ""}  ${oldUsage.contraindications || ""}  ${oldUsage.sideEffects || ""}  ${oldUsage.dosageAdministration || ""} ${oldUsage.storageCondition || ""} ${oldUsage.warning || ""}`;
      }
    }
    const vector = await generateEmbedding(textToEmbed.trim());

    const result = await db.sequelize.transaction(async (t) => {
      await medicine.update(
        {
          ...medicineData,
          imageUrl,
          embeddingVector: vector,
        },
        { transaction: t },
      );

      const medicineId = medicine.medicineId;

      if (groupIds !== undefined) {
        await medicine.setMedicineGroupInfo(groupIds, {
          transaction: t,
        });
      }

      if (ingredients !== undefined) {
        await db.MedicineIngredientDetail.destroy({
          where: { medicineId },
          transaction: t,
        });

        const ingredientEntries = ingredients.map((item) => ({
          medicineId,
          ingredientId: item.ingredientId,
          strength: item.strength,
        }));

        await db.MedicineIngredientDetail.bulkCreate(ingredientEntries, {
          transaction: t,
        });
      }

      if (finalUsageData || documentUrl) {
        const usage = await db.UsageInstruction.findOne({
          where: { medicineId },
          transaction: t,
        });

        const usagePayload = {
          ...finalUsageData,
          ...(documentUrl ? { document: documentUrl } : {}),
        };

        if (usage) {
          await usage.update(usagePayload, { transaction: t });
        } else {
          await db.UsageInstruction.create(
            { ...usagePayload, medicineId },
            { transaction: t },
          );
        }
      }

      return medicine;
    });

    const finalMedicine = await db.Medicine.findByPk(result.medicineId, {
      include: [
        {
          model: db.MedicineGroup,
          as: "medicineGroupInfo",
        },
        {
          model: db.MedicineIngredientDetail,
          as: "ingredientDetailInfo",
          include: [
            {
              model: db.ActiveIngredient,
              as: "ingredientInfo",
            },
          ],
        },
        {
          model: db.UsageInstruction,
          as: "usageInstruction",
        },
      ],
    });

    return res.status(200).json({
      message: "cập nhật thuốc thành công",
      data: finalMedicine,
    });
  },

  changeStatus: async (req, res) => {
    const { id } = req.params;
    const { status } = req.body;

    const medicine = await db.Medicine.findByPk(id);

    if (!medicine) {
      return res.status(404).json({
        message: "không tìm thấy thuốc",
      });
    }

    await medicine.update({
      status,
    });

    return res.status(200).json({
      message: `đã cập nhật trạng thái thành "${status}"`,
      data: medicine,
    });
  },
};

module.exports = medicineControllers;
