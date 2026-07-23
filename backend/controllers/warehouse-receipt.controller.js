const db = require("../models/index.model");
const { sequelize } = require("../config/database");
const { Op } = require("sequelize");

const warehouseReceiptControllers = {
  createReceipt: async (req, res) => {
    const { receiptCode, receiptDate, supplierId, details } = req.body;
    const employeeId = req.employee.employeeId;

    if (!employeeId) {
      return res.status(401).json({
        message: "Không xác định được nhân viên thực hiện, vui lòng đăng nhập lại",
      });
    }

    const errors = [];
    const codeExisted = await db.WarehouseReceipt.findOne({
      where: { receiptCode },
    });
    if (codeExisted) {
      return res.status(409).json({ message: `Mã phiếu nhập "${receiptCode}" đã tồn tại` });
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

    const seenLines = new Set(); // set này ghi các lô thuốc trong phiếu
    details.forEach((line, idx) => {
      const lineNo = idx + 1;

      if (!medicineMap.has(line.medicineId)) {
        errors.push(
          `Dòng ${lineNo}: không tìm thấy thuốc (medicineId=${line.medicineId})`,
        );
        return;
      }

      const dedupKey = `${line.medicineId}_${line.batchNumber.toLowerCase()}`;
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

    const totalPrice = details.reduce(
      (sum, d) => sum + d.importQuantity * d.importPrice,
      0,
    );

    let createdReceiptId;
    try {
      createdReceiptId = await sequelize.transaction(async (t) => {
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

        for (let idx = 0; idx < details.length; idx++) {
          const line = details[idx];
          const lineNo = idx + 1;

          let batch = await db.Batch.findOne({
            where: {
              medicineId: line.medicineId,
              batchNumber: line.batchNumber,
            },
            transaction: t,
            lock: t.LOCK.UPDATE,
          });

          if (batch) {
            // Lô cũ, cộng dồn stockQuantity, vẫn giữ NSX, HSD
            await batch.increment("stockQuantity", {
              by: line.importQuantity,
              transaction: t,
            });
          } else {
            // Lô mới -> validate NSX/HSD (throw để rollback + trả lỗi rõ ràng)
            if (!line.productionDate) {
              throw new Error(
                `Dòng ${lineNo}: lô "${line.batchNumber}" là lô mới, cần nhập ngày sản xuất`,
              );
            }
            if (!line.expiryDate) {
              throw new Error(
                `Dòng ${lineNo}: lô "${line.batchNumber}" là lô mới, cần nhập hạn sử dụng`,
              );
            }
            if (new Date(line.expiryDate) <= new Date(line.productionDate)) {
              throw new Error(
                `Dòng ${lineNo}: lô "${line.batchNumber}": hạn sử dụng phải sau ngày sản xuất`,
              );
            }

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
    } catch (err) {
      return res.status(400).json({ message: err.message || "Lỗi khi tạo phiếu nhập" });
    }

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

    return res.status(201).json({ message: "Tạo phiếu nhập thành công", data: fullReceipt });
  },

  updateReceipt: async (req, res) => {
    const receiptId = req.params.id;
    const { receiptCode, receiptDate, supplierId, details } = req.body;

    const receipt = await db.WarehouseReceipt.findByPk(receiptId, {
      include: [
        {
          model: db.WarehouseReceiptDetail,
          as: "detailInfo",
          include: [{ model: db.Batch, as: "batchInfo" }],
        },
      ],
    });

    if (!receipt) {
      return res.status(404).json({ message: "Không tìm thấy phiếu nhập" });
    }

    // Đổi mã phiếu. check trùng với phiếu khác trừ nó ra
    if (receiptCode !== receipt.receiptCode) {
      const codeExisted = await db.WarehouseReceipt.findOne({
        where: { receiptCode, receiptId: { [Op.ne]: receiptId } },
      });
      if (codeExisted) {
        return res.status(409).json({ message: `Mã phiếu nhập "${receiptCode}" đã tồn tại` });
      }
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

    const errors = [];
    const seenLines = new Set();

    details.forEach((line, idx) => {
      const lineNo = idx + 1;

      if (!medicineMap.has(line.medicineId)) {
        errors.push(
          `Dòng ${lineNo}: không tìm thấy thuốc (medicineId=${line.medicineId})`,
        );
        return;
      }

      const dedupKey = `${line.medicineId}_${line.batchNumber.toLowerCase()}`;
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

    // Khóa chính của WarehouseReceiptDetail là (receiptId, batchId) -> mỗi lô chỉ
    // xuất hiện tối đa 1 lần trong 1 phiếu, nên có thể xác định "danh tính" của
    // 1 dòng chi tiết chỉ bằng batchId, không cần thêm 1 id riêng.
    const existingByBatchId = new Map(
      receipt.detailInfo.map((d) => [d.batchId, d]),
    );

    const lineResolutions = [];
    for (let idx = 0; idx < details.length; idx++) {
      const line = details[idx];
      const lineNo = idx + 1;

      const targetBatch = await db.Batch.findOne({
        where: { medicineId: line.medicineId, batchNumber: line.batchNumber },
      });

      // Chỉ cần NSX/HSD nếu lô đích chưa tồn tại trong DB
      if (!targetBatch) {
        if (!line.productionDate) {
          lineResolutions.push({
            error: `Dòng ${lineNo}: lô "${line.batchNumber}" là lô mới, cần nhập ngày sản xuất`,
          });
          continue;
        }
        if (!line.expiryDate) {
          lineResolutions.push({
            error: `Dòng ${lineNo}: lô "${line.batchNumber}" là lô mới, cần nhập hạn sử dụng`,
          });
          continue;
        }
        if (new Date(line.expiryDate) <= new Date(line.productionDate)) {
          lineResolutions.push({
            error: `Dòng ${lineNo}: lô "${line.batchNumber}": hạn sử dụng phải sau ngày sản xuất`,
          });
          continue;
        }
      } else if (line.productionDate && line.expiryDate) {
        // Lô đã tồn tại nhưng người dùng vẫn gửi kèm NSX/HSD (sửa lại lô cũ)
        // -> validate luôn thứ tự ngày ở đây, tránh throw muộn bên trong transaction
        if (new Date(line.expiryDate) <= new Date(line.productionDate)) {
          lineResolutions.push({
            error: `Dòng ${lineNo}: lô "${line.batchNumber}": hạn sử dụng phải sau ngày sản xuất`,
          });
          continue;
        }
      }

      lineResolutions.push({ line, targetBatch });
    }

    const resolutionErrors = lineResolutions
      .filter((r) => r.error)
      .map((r) => r.error);
    if (resolutionErrors.length > 0) {
      return res.status(400).json({ message: "Dữ liệu không hợp lệ", errors: resolutionErrors });
    }

    const totalPrice = details.reduce(
      (sum, d) => sum + d.importQuantity * d.importPrice,
      0,
    );

    try {
      await sequelize.transaction(async (t) => {
        // batchId nào vẫn còn được dùng lại sau khi sửa
        const keptBatchIds = new Set();

        // giữ nguyên lô cũ (chỉnh SL/giá/NSX/HSD) hoặc là dòng mới
        for (const { line, targetBatch } of lineResolutions) {
          const existingDetail = targetBatch
            ? existingByBatchId.get(targetBatch.batchId)
            : null;

          if (existingDetail) {
            // Dòng vẫn dùng đúng lô đã có -> chỉnh chênh lệch SL/giá, và NSX/HSD nếu có sửa
            keptBatchIds.add(targetBatch.batchId);
            const qtyDelta =
              line.importQuantity - existingDetail.importQuantity;

            const batch = await db.Batch.findByPk(targetBatch.batchId, {
              transaction: t,
              lock: t.LOCK.UPDATE,
            });

            if (qtyDelta !== 0) {
              if (batch.stockQuantity + qtyDelta < 0) {
                throw new Error(
                  `Tồn kho lô "${batch.batchNumber}" sẽ bị âm, vui lòng kiểm tra lại số lượng`,
                );
              }
              await batch.increment("stockQuantity", {
                by: qtyDelta,
                transaction: t,
              });
            }

            if (line.productionDate && line.expiryDate) {
              await batch.update(
                {
                  productionDate: line.productionDate,
                  expiryDate: line.expiryDate,
                },
                { transaction: t },
              );
            }

            await existingDetail.update(
              {
                importQuantity: line.importQuantity,
                importPrice: line.importPrice,
              },
              { transaction: t },
            );
            continue;
          }

          // Dòng mới đối với phiếu này (lô có thể đã tồn tại từ phiếu khác, hoặc hoàn toàn mới)
          let destBatch;
          if (targetBatch) {
            destBatch = await db.Batch.findByPk(targetBatch.batchId, {
              transaction: t,
              lock: t.LOCK.UPDATE,
            });
            await destBatch.increment("stockQuantity", {
              by: line.importQuantity,
              transaction: t,
            });

            if (line.productionDate && line.expiryDate) {
              await destBatch.update(
                {
                  productionDate: line.productionDate,
                  expiryDate: line.expiryDate,
                },
                { transaction: t },
              );
            }
          } else {
            destBatch = await db.Batch.create(
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
              batchId: destBatch.batchId,
              importQuantity: line.importQuantity,
              importPrice: line.importPrice,
            },
            { transaction: t },
          );
        }

        // Lô trước có giờ không còn -> hoàn tồn kho + xóa dòng
        for (const oldDetail of receipt.detailInfo) {
          if (keptBatchIds.has(oldDetail.batchId)) continue;

          const batch = await db.Batch.findByPk(oldDetail.batchId, {
            transaction: t,
            lock: t.LOCK.UPDATE,
          });
          if (batch) {
            if (batch.stockQuantity - oldDetail.importQuantity < 0) {
              throw new Error(
                `Không thể cập nhật: tồn kho lô "${batch.batchNumber}" sẽ bị âm`,
              );
            }
            await batch.decrement("stockQuantity", {
              by: oldDetail.importQuantity,
              transaction: t,
            });
          }
          await oldDetail.destroy({ transaction: t });
        }

        // update thông tin phiếu
        await receipt.update(
          {
            receiptCode,
            receiptDate: receiptDate || receipt.receiptDate,
            supplierId,
            totalPrice,
          },
          { transaction: t },
        );
      });
    } catch (err) {
      return res.status(400).json({ message: err.message || "Lỗi khi cập nhật phiếu nhập" });
    }

    const fullReceipt = await db.WarehouseReceipt.findByPk(receiptId, {
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

    return res.status(200).json({ message: "Cập nhật phiếu nhập thành công", data: fullReceipt });
  },

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

  cancelReceipt: async (req, res) => {
    const receiptId = req.params.id;

    const receipt = await db.WarehouseReceipt.findByPk(receiptId, {
      include: [
        {
          model: db.WarehouseReceiptDetail,
          as: "detailInfo",
          include: [{ model: db.Batch, as: "batchInfo" }],
        },
      ],
    });

    if (!receipt) {
      return res.status(404).json({ message: "Không tìm thấy phiếu nhập" });
    }

    try {
      await sequelize.transaction(async (t) => {
        for (const detail of receipt.detailInfo) {
          const batch = await db.Batch.findByPk(detail.batchId, {
            transaction: t,
            lock: t.LOCK.UPDATE,
          });
          if (batch) {
            if (batch.stockQuantity - detail.importQuantity < 0) {
              throw new Error(
                `Dữ liệu tồn kho của lô "${batch.batchNumber}" không khớp, không thể hủy phiếu. Vui lòng kiểm tra lại các phiếu nhập liên quan tới lô này`,
              );
            }
            await batch.decrement("stockQuantity", {
              by: detail.importQuantity,
              transaction: t,
            });
          }
          await detail.destroy({ transaction: t });
        }

        await receipt.destroy({ transaction: t });
      });
    } catch (err) {
      return res.status(400).json({ message: err.message});
    }

    return res.status(200).json({ message: "Đã hủy phiếu nhập thành công" });
  },
};

module.exports = warehouseReceiptControllers;