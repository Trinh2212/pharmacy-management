const db = require("../models/index.model");
const { sequelize } = require("../config/database");
const { Op } = require("sequelize");

const warehouseReceiptControllers = {
  createReceipt: async (req, res) => {
    const { receiptCode, receiptDate, supplierId, details } = req.body;
    const employeeId = req.employee?.employeeId;

    if (!employeeId) {
      return res.status(401).json({
        message:
          "Không xác định được nhân viên thực hiện, vui lòng đăng nhập lại",
      });
    }

    const errors = [];

    const codeTaken = await db.WarehouseReceipt.findOne({
      where: { receiptCode },
    });
    if (codeTaken) {
      return res
        .status(409)
        .json({ message: `Mã phiếu nhập "${receiptCode}" đã tồn tại` });
    }

    const supplier = await db.Supplier.findByPk(supplierId);
    if (!supplier) {
      return res.status(404).json({ message: "Không tìm thấy nhà cung cấp" });
    }

    const medicineIds = [...new Set(details.map((d) => d.medicineId))];
    const medicines = await db.Medicine.findAll({
      where: { medicineId: { [Op.in]: medicineIds } },
    });
    const medicineMap = new Map(medicines.map((m) => [m.medicineId, m]));

    const seenLines = new Set();
    details.forEach((line, idx) => {
      const lineNo = idx + 1;

      if (!medicineMap.has(line.medicineId)) {
        errors.push(
          `Dòng ${lineNo}: không tìm thấy thuốc (medicineId=${line.medicineId})`,
        );
        return;
      }

      const dedupKey = `${line.medicineId}__${line.batchNumber.toLowerCase()}`;
      if (seenLines.has(dedupKey)) {
        errors.push(
          `Dòng ${lineNo}: trùng lô thuốc với dòng khác trong phiếu, vui lòng check lại`,
        );
      }
      seenLines.add(dedupKey);
    });

    if (errors.length > 0) {
      return res.status(400).json({ message: "Dữ liệu không hợp lệ", errors });
    }

    const lineResolutions = await Promise.all(
      details.map(async (line) => {
        const existingBatch = await db.Batch.findOne({
          where: { medicineId: line.medicineId, batchNumber: line.batchNumber },
        });

        if (!existingBatch) {
          if (!line.productionDate) {
            return {
              error: `Lô "${line.batchNumber}" là lô mới, cần nhập ngày sản xuất`,
            };
          }
          if (!line.expiryDate) {
            return {
              error: `Lô "${line.batchNumber}" là lô mới, cần nhập hạn sử dụng`,
            };
          }
          if (new Date(line.expiryDate) <= new Date(line.productionDate)) {
            return {
              error: `Lô "${line.batchNumber}": hạn sử dụng phải sau ngày sản xuất`,
            };
          }
        }

        return { line, existingBatch };
      }),
    );

    const resolutionErrors = lineResolutions
      .filter((r) => r.error)
      .map((r) => r.error);
    if (resolutionErrors.length > 0) {
      return res
        .status(400)
        .json({ message: "Dữ liệu không hợp lệ", errors: resolutionErrors });
    }

    const totalPrice = details.reduce(
      (sum, d) => sum + d.importQuantity * d.importPrice,
      0,
    );

    const createdReceiptId = await sequelize.transaction(async (t) => {
      const receipt = await db.WarehouseReceipt.create(
        {
          receiptCode,
          receiptDate: receiptDate || undefined,
          supplierId,
          employeeId,
          totalPrice,
        },
        { transaction: t },
      );

      for (const resolved of lineResolutions) {
        const { line, existingBatch } = resolved;
        let batch = existingBatch;

        if (batch) {
          // Lô cũ, cộng dồn stockQuantity,  vẫn giữ productionDate / expiryDate
          await batch.increment("stockQuantity", {
            by: line.importQuantity,
            transaction: t,
          });
        } else {
          // Lô mới thì tạo mới
          batch = await db.Batch.create(
            {
              medicineId: line.medicineId,
              batchNumber: line.batchNumber,
              productionDate: line.productionDate,
              expiryDate: line.expiryDate,
              stockQuantity: line.importQuantity,
            },
            { transaction: t },
          );
        }

        await db.WarehouseReceiptDetail.create(
          {
            receiptId: receipt.receiptId,
            batchId: batch.batchId,
            importQuantity: line.importQuantity,
            importPrice: line.importPrice,
          },
          { transaction: t },
        );
      }

      return receipt.receiptId;
    });

    const fullReceipt = await db.WarehouseReceipt.findByPk(createdReceiptId, {
      include: [
        { model: db.Supplier, as: "supplierInfo" },
        { model: db.Employee, as: "employeeInfo" },
        {
          model: db.WarehouseReceiptDetail,
          as: "detailInfo",
          include: [
            {
              model: db.Batch,
              as: "batchInfo",
              include: [{ model: db.Medicine, as: "medicineInfo" }],
            },
          ],
        },
      ],
    });

    return res
      .status(201)
      .json({ message: "Tạo phiếu nhập thành công", data: fullReceipt });
  },

  // GET /api/warehouse-receipts?page=1&limit=10
  getAllReceipts: async (req, res) => {
    const { search = "", page = 1, limit = 10 } = req.query;

    const parsedLimit = parseInt(limit, 10);
    const parsedPage = parseInt(page, 10);
    const offset = (parsedPage - 1) * parsedLimit;
    const keyword = search.trim();

    const filter = {};

    if (keyword) {
      filter.receiptCode = { [Op.like]: `%${keyword}%` };
    }

    const { count, rows } = await db.WarehouseReceipt.findAndCountAll({
      where: filter,
      distinct: true,
      limit: parsedLimit,
      offset,
      order: [["receiptId", "DESC"]],
      include: [
        { model: db.Supplier, as: "supplierInfo" },
        { model: db.Employee, as: "employeeInfo" },
      ],
    });

    return res.status(200).json({
      message: "Lấy danh sách phiếu nhập thành công",
      data: rows,
      totalReceipts: count,
      totalPages: Math.ceil(count / parsedLimit),
      currentPage: parsedPage,
    });
  },

  // GET /api/warehouse-receipts/:id
  getReceiptById: async (req, res) => {
    const receipt = await db.WarehouseReceipt.findByPk(req.params.id, {
      include: [
        { model: db.Supplier, as: "supplierInfo" },
        { model: db.Employee, as: "employeeInfo" },
        {
          model: db.WarehouseReceiptDetail,
          as: "detailInfo",
          include: [
            {
              model: db.Batch,
              as: "batchInfo",
              include: [{ model: db.Medicine, as: "medicineInfo" }],
            },
          ],
        },
      ],
    });

    if (!receipt) {
      return res.status(404).json({ message: "Không tìm thấy phiếu nhập" });
    }

    return res.json({ data: receipt });
  },

  // GET /api/warehouse-receipts/check-code?code=PN0001
  checkReceiptCode: async (req, res) => {
    const { code } = req.query;
    const existing = await db.WarehouseReceipt.findOne({
      where: { receiptCode: code },
    });
    return res.json({ exists: !!existing });
  },

  getImportCostTrend: async (req, res) => {
    const months = parseInt(req.query.months, 10) || 6;

    const fromDate = new Date();
    fromDate.setMonth(fromDate.getMonth() - (months - 1));
    fromDate.setDate(1);
    fromDate.setHours(0, 0, 0, 0);

    const results = await db.WarehouseReceipt.findAll({
      attributes: [
        [
          sequelize.fn("DATE_FORMAT", sequelize.col("receipt_date"), "%Y-%m"),
          "month",
        ],
        [sequelize.fn("SUM", sequelize.col("total_price")), "totalCost"],
      ],
      where: { receiptDate: { [Op.gte]: fromDate } },
      group: ["month"],
      order: [[sequelize.literal("month"), "ASC"]],
      raw: true,
    });

    return res.status(200).json({
      message: "Lấy dữ liệu chi phí nhập thuốc theo thời gian thành công",
      data: results,
    });
  },
};

module.exports = warehouseReceiptControllers;
