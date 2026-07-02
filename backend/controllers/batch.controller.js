const db = require("../models/index.model");

const batchControllers = {
  //lấy batch theo medicine
  getBatchesByMedicine: async (req, res) => {
    const { medicineId } = req.params;

    const medicine = await db.Medicine.findByPk(medicineId);
    if (!medicine) {
      return res.status(404).json({ message: "Không tìm thấy thuốc" });
    }

    const batches = await db.Batch.findAll({
      where: { medicineId },
      order: [["expiryDate", "ASC"]],
      attributes: [
        "batchId",
        "batchNumber",
        "productionDate",
        "expiryDate",
        "stockQuantity",
      ],
    });

    return res.json({ data: batches });
  },

  // GET /api/batches/check?medicineId=1&batchNumber=LOT001
  checkBatch: async (req, res) => {
    const { medicineId, batchNumber } = req.query;

    const batch = await db.Batch.findOne({
      where: { medicineId, batchNumber },
      attributes: [
        "batchId",
        "batchNumber",
        "productionDate",
        "expiryDate",
        "stockQuantity",
      ],
    });

    // exists=true  → lô cũ, frontend tự điền productionDate + expiryDate
    // exists=false → lô mới, nhân viên nhập tay
    return res.json({ exists: !!batch, batch: batch || null });
  },
};

module.exports = batchControllers;