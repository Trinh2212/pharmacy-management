const db = require("../models/index.model");
const { Op } = require("sequelize");

//lấy mốc tg
function getDateBoundaries() {
  const today = new Date();
  today.setHours(0, 0, 0, 0);

  const thresholdDate = new Date(today);
  thresholdDate.setDate(thresholdDate.getDate() + 30);

  return { today, thresholdDate };
}

function checkBatchStatus(expiryDate, today, thresholdDate) {
  const expiry = new Date(expiryDate);
  if (expiry < today) return "expired";
  if (expiry <= thresholdDate) return "expiring";
  return "normal";
}

const batchControllers = {
  getAllBatches: async (req, res) => {
    const { search = "", status = "all", medicineId, page = 1, limit = 10 } = req.query;

    const parsedLimit = parseInt(limit, 10);
    const parsedPage = parseInt(page, 10);
    const offset = (parsedPage - 1) * parsedLimit;
    const keyword = search.trim();

    const { today, thresholdDate } = getDateBoundaries();

    const filter = {};

    if (medicineId) {
      filter.medicineId = medicineId;
    }
    //lọc theo status
    if (status === "expired") {
      filter.expiryDate = { [Op.lt]: today };
    } else if (status === "expiring") {
      filter.expiryDate = { [Op.gte]: today, [Op.lte]: thresholdDate };
    }

    if (keyword) {
      const matchedMedicines = await db.Medicine.findAll({
        where: {
          [Op.or]: [
            { brandName: { [Op.like]: `%${keyword}%` } },
            { medicineCode: { [Op.like]: `%${keyword}%` } },
          ],
        },
        attributes: ["medicineId"],
      });
      const matchedMedicineIds = matchedMedicines.map((m) => m.medicineId);

      filter[Op.or] = [
        { batchNumber: { [Op.like]: `%${keyword}%` } },
        ...(matchedMedicineIds.length
          ? [{ medicineId: { [Op.in]: matchedMedicineIds } }]
          : []),
      ];
    }

    const { count, rows } = await db.Batch.findAndCountAll({
      where: filter,
      distinct: true,
      limit: parsedLimit,
      offset,
      order: [["expiryDate", "ASC"]],
      include: [
        {
          model: db.Medicine,
          as: "medicineInfo",
          attributes: ["medicineId", "medicineCode", "brandName", "unit"],
        },
      ],
    });

    const data = rows.map((row) => {
      const plain = row.toJSON();
      return {
        ...plain,
        batchStatus: checkBatchStatus(plain.expiryDate, today, thresholdDate),
      };
    });

    return res.status(200).json({
      message: "Lấy danh sách lô thuốc thành công",
      data,
      totalBatches: count,
      totalPages: Math.ceil(count / parsedLimit),
      currentPage: parsedPage,
    });
  },

  // dùng cho dashboard
  getBatchStats: async (req, res) => {
    const { today, thresholdDate } = getDateBoundaries();

    const [totalBatches, expiredCount, expiringCount, nearestBatches] =
      await Promise.all([
        db.Batch.count(),
        db.Batch.count({ where: { expiryDate: { [Op.lt]: today } } }),
        db.Batch.count({
          where: { expiryDate: { [Op.gte]: today, [Op.lte]: thresholdDate } },
        }),
        db.Batch.findAll({
          where: { expiryDate: { [Op.lte]: thresholdDate } },
          order: [["expiryDate", "ASC"]],
          limit: 5,
          include: [
            {
              model: db.Medicine,
              as: "medicineInfo",
              attributes: ["medicineCode", "brandName"],
            },
          ],
        }),
      ]);

    const nearest = nearestBatches.map((row) => {
      const plain = row.toJSON();
      return {
        ...plain,
        batchStatus: checkBatchStatus(plain.expiryDate, today, thresholdDate),
      };
    });

    return res.status(200).json({
      message: "Lấy thống kê lô thuốc thành công",
      data: {
        totalBatches,
        expiredCount,
        expiringCount,
        nearestBatches: nearest,
      },
    });
  },

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

    // exists=true lô cũ, frontend tự điền productionDate + expiryDate
    // exists=false lô mới, nhân viên nhập tay
    return res.json({ exists: !!batch, batch: batch || null });
  },
};

module.exports = batchControllers;