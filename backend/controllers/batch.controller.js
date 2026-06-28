const sequelize = require("../config/database");
const db = require("../models/index.model");

const batchControllers = {
    getAllBatch: async (req, res) => {
        const {search = ""} = req.query
        const keyword = search.trim();

        
    } ,

    createBatch : async ({
    medicineId,
    batchNumber,
    productionDate,
    expiryDate,
    importQuantity,
    }, transaction = null) => {
    // Tìm lô thuốc
    const batch = await Batch.findOne({
        where: {
        medicineId,
        batchNumber,
        },
        transaction,
    });

    // Nếu đã tồn tại -> cập nhật số lượng
    if (batch) {
        batch.stockQuantity += Number(importQuantity);

        await batch.save({ transaction });

        return batch;
    }

    // Nếu chưa tồn tại -> tạo mới
    const newBatch = await Batch.create(
        {
        medicineId,
        batchNumber,
        productionDate,
        expiryDate,
        stockQuantity: importQuantity,
        },
        {
        transaction,
        }
    );

    return newBatch;
    },
};

module.exports = batchControllers;