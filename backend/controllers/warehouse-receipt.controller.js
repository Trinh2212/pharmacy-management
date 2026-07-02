const db = require("../models/index.model");
const { sequelize } = require("../config/database");
const { Op } = require("sequelize");

const warehouseReceiptControllers = {

  createReceipt: async (req, res) => {
    const { receiptCode, receiptDate, supplierId, details } = req.body;
    const employeeId = req.user?.employeeId;

    if (!employeeId) {
      return res.status(401).json({ message: "Không xác định được nhân viên thực hiện, vui lòng đăng nhập lại" });
    }

    // ── PHASE 1: VALIDATE NGHIỆP VỤ (cần query DB)
    const errors = [];

    // 1a. Mã phiếu trùng không?
    const codeTaken = await WarehouseReceipt.findOne({ where: { receiptCode } });
    if (codeTaken) {
      return res.status(409).json({ message: `Mã phiếu nhập "${receiptCode}" đã tồn tại` });
    }

    // 1b. Nhà cung cấp tồn tại không?
    const supplier = await Supplier.findByPk(supplierId);
    if (!supplier) {
      return res.status(404).json({ message: "Không tìm thấy nhà cung cấp" });
    }

    // 1c. Tất cả medicineId trong details có tồn tại không?
    const medicineIds = [...new Set(details.map((d) => d.medicineId))];
    const medicines = await Medicine.findAll({ where: { medicineId: { [Op.in]: medicineIds } } });
    const medicineMap = new Map(medicines.map((m) => [m.medicineId, m]));

    // 1d. Kiểm tra trùng dòng trong cùng phiếu (cùng medicineId + batchNumber)
    const seenLines = new Set();
    details.forEach((line, idx) => {
      const lineNo = idx + 1;

      if (!medicineMap.has(line.medicineId)) {
        errors.push(`Dòng ${lineNo}: không tìm thấy thuốc (medicineId=${line.medicineId})`);
        return;
      }

      const dedupKey = `${line.medicineId}__${line.batchNumber.toLowerCase()}`;
      if (seenLines.has(dedupKey)) {
        errors.push(`Dòng ${lineNo}: trùng lô thuốc với dòng khác trong phiếu, vui lòng gộp lại`);
      }
      seenLines.add(dedupKey);
    });

    if (errors.length > 0) {
      return res.status(400).json({ message: "Dữ liệu không hợp lệ", errors });
    }

    // 1e. Với mỗi lô: xác định mới/cũ — lô mới bắt buộc có productionDate + expiryDate
    const lineResolutions = await Promise.all(
      details.map(async (line) => {
        const existingBatch = await Batch.findOne({
          where: { medicineId: line.medicineId, batchNumber: line.batchNumber },
        });

        if (!existingBatch) {
          if (!line.productionDate) {
            return { error: `Lô "${line.batchNumber}" là lô mới, cần nhập ngày sản xuất` };
          }
          if (!line.expiryDate) {
            return { error: `Lô "${line.batchNumber}" là lô mới, cần nhập hạn sử dụng` };
          }
          if (new Date(line.expiryDate) <= new Date(line.productionDate)) {
            return { error: `Lô "${line.batchNumber}": hạn sử dụng phải sau ngày sản xuất` };
          }
        }

        return { line, existingBatch };
      })
    );

    const resolutionErrors = lineResolutions.filter((r) => r.error).map((r) => r.error);
    if (resolutionErrors.length > 0) {
      return res.status(400).json({ message: "Dữ liệu không hợp lệ", errors: resolutionErrors });
    }

    // ── PHASE 2: GHI DỮ LIỆU TRONG TRANSACTION ─────────────────────────────
    const totalPrice = details.reduce((sum, d) => sum + d.importQuantity * d.importPrice, 0);

    const createdReceiptId = await sequelize.transaction(async (t) => {
      const receipt = await WarehouseReceipt.create(
        { receiptCode, receiptDate: receiptDate || undefined, supplierId, employeeId, totalPrice },
        { transaction: t }
      );

      for (const resolved of lineResolutions) {
        const { line, existingBatch } = resolved;
        let batch = existingBatch;

        if (batch) {
          // Lô cũ → chỉ cộng dồn stockQuantity, KHÔNG đổi productionDate / expiryDate
          await batch.increment("stockQuantity", { by: line.importQuantity, transaction: t });
        } else {
          // Lô mới → tạo mới
          batch = await Batch.create(
            {
              medicineId: line.medicineId,
              batchNumber: line.batchNumber,
              productionDate: line.productionDate,
              expiryDate: line.expiryDate,
              stockQuantity: line.importQuantity,
            },
            { transaction: t }
          );
        }

        await WarehouseReceiptDetail.create(
          {
            receiptId: receipt.receiptId,
            batchId: batch.batchId,
            importQuantity: line.importQuantity,
            importPrice: line.importPrice,
          },
          { transaction: t }
        );
      }

      return receipt.receiptId;
    });

    const fullReceipt = await WarehouseReceipt.findByPk(createdReceiptId, {
      include: [
        { model: Supplier, as: "supplierInfo" },
        { model: Employee, as: "employeeInfo" },
        {
          model: WarehouseReceiptDetail,
          as: "detailInfo",
          include: [{ model: Batch, as: "batchInfo", include: [{ model: Medicine, as: "medicineInfo" }] }],
        },
      ],
    });

    return res.status(201).json({ message: "Tạo phiếu nhập thành công", data: fullReceipt });
  },

  // GET /api/warehouse-receipts?page=1&limit=10
  getAllReceipts: async (req, res) => {
    const page = Math.max(parseInt(req.query.page) || 1, 1);
    const limit = Math.max(parseInt(req.query.limit) || 10, 1);
    const offset = (page - 1) * limit;

    const { count, rows } = await WarehouseReceipt.findAndCountAll({
      limit,
      offset,
      order: [["receiptId", "DESC"]],
      include: [
        { model: Supplier, as: "supplierInfo" },
        { model: Employee, as: "employeeInfo" },
      ],
    });

    return res.json({
      data: rows,
      pagination: { page, limit, total: count, totalPages: Math.ceil(count / limit) },
    });
  },

  // GET /api/warehouse-receipts/:id
  getReceiptById: async (req, res) => {
    const receipt = await WarehouseReceipt.findByPk(req.params.id, {
      include: [
        { model: Supplier, as: "supplierInfo" },
        { model: Employee, as: "employeeInfo" },
        {
          model: WarehouseReceiptDetail,
          as: "detailInfo",
          include: [{ model: Batch, as: "batchInfo", include: [{ model: Medicine, as: "medicineInfo" }] }],
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
    const existing = await WarehouseReceipt.findOne({ where: { receiptCode: code } });
    return res.json({ exists: !!existing });
  },
};

module.exports = warehouseReceiptControllers;