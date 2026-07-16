const Joi = require("joi");

const detailSchema = Joi.object({
  medicineId: Joi.number().integer().positive().required().messages({
    "number.base": "Medicine id không hợp lệ",
    "number.integer": "Medicine id không hợp lệ",
    "number.positive": "Medicine id không hợp lệ",
    "any.required": "Vui lòng nhập medicine id",
  }),

  batchNumber: Joi.string().trim().max(50).required().messages({
    "string.base": "Số lô không hợp lệ",
    "string.empty": "Vui lòng nhập số lô",
    "string.max": "Số lô không quá 50 ký tự",
    "any.required": "Vui lòng nhập số lô",
  }),

  // optional — lô mới hay cũ chỉ biết sau khi query DB, controller xử lý tiếp
  productionDate: Joi.date().iso().optional().messages({
    "date.base": "Ngày sản xuất không hợp lệ",
    "date.format": "Ngày sản xuất phải theo định dạng YYYY-MM-DD",
  }),

  expiryDate: Joi.date().iso().optional().messages({
    "date.base": "Hạn sử dụng không hợp lệ",
    "date.format": "Hạn sử dụng phải theo định dạng YYYY-MM-DD",
  }),

  importQuantity: Joi.number().integer().min(1).required().messages({
    "number.base": "Số lượng nhập không hợp lệ",
    "number.integer": "Số lượng nhập không hợp lệ nguyên",
    "number.min": "Số lượng nhập phải >= 1",
    "any.required": "Vui lòng nhập số lượng nhập ",
  }),

  importPrice: Joi.number().min(0).required().messages({
    "number.base": "Giá nhập không hợp lệ",
    "number.min": "Giá nhập không được âm",
    "any.required": "Vui lòng nhập giá nhập ",
  }),
});

const warehouseValidation = {
  // POST /api/warehouse-receipts
  createReceipt: Joi.object({
    receiptCode: Joi.string().trim().max(20).required().messages({
      "string.base": "Mã phiếu nhập không hợp lệ",
      "string.empty": "Vui lòng nhập mã phiếu nhập",
      "string.max": "Mã phiếu nhập không quá 20 ký tự",
      "any.required": "Vui lòng nhập mã phiếu nhập",
    }),

    receiptDate: Joi.date().iso().optional().messages({
      "date.base": "Ngày nhập không hợp lệ",
      "date.format": "Ngày nhập không hợp lệ",
    }),

    supplierId: Joi.number().integer().positive().required().messages({
      "number.base": "supplierId không hợp lệ",
      "number.integer": "supplierId không hợp lệ",
      "number.positive": "Vui lòng chọn nhà cung cấp hợp lệ",
      "any.required": "Vui lòng chọn nhà cung cấp",
    }),

    details: Joi.array().items(detailSchema).min(1).required().messages({
      "array.base": "Danh sách thuốc nhập không hợp lệ",
      "array.min": "Phiếu nhập phải có ít nhất 1 dòng thuốc",
      "any.required": "Vui lòng nhập danh sách thuốc nhập",
    }),
  }),
  updateReceipt: Joi.object({
    receiptCode: Joi.string().trim().max(20).required().messages({
      "string.base": "Mã phiếu nhập không hợp lệ",
      "string.empty": "Vui lòng nhập mã phiếu nhập",
      "string.max": "Mã phiếu nhập không quá 20 ký tự",
      "any.required": "Vui lòng nhập mã phiếu nhập",
    }),

    receiptDate: Joi.date().iso().optional().messages({
      "date.base": "Ngày nhập không hợp lệ",
      "date.format": "Ngày nhập không hợp lệ",
    }),

    supplierId: Joi.number().integer().positive().required().messages({
      "number.base": "supplierId không hợp lệ",
      "number.integer": "supplierId không hợp lệ nguyên",
      "number.positive": "Vui lòng chọn nhà cung cấp hợp lệ",
      "any.required": "Vui lòng chọn nhà cung cấp",
    }),

    details: Joi.array().items(detailSchema).min(1).required().messages({
      "array.base": "Danh sách thuốc nhập không hợp lệ",
      "array.min": "Phiếu nhập phải có ít nhất 1 dòng thuốc",
      "any.required": "Vui lòng nhập danh sách thuốc nhập",
    }),
  }),
};

module.exports = warehouseValidation;
