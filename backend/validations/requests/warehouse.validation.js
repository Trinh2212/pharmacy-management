const Joi = require("joi");

const detailSchema = Joi.object({
  medicineId: Joi.number().integer().positive().required().messages({
    "number.base": "medicineId phải là số",
    "number.integer": "medicineId phải là số nguyên",
    "number.positive": "medicineId không hợp lệ",
    "any.required": "medicineId là bắt buộc",
  }),

  batchNumber: Joi.string().trim().max(50).required().messages({
    "string.base": "Số lô phải là chuỗi ký tự",
    "string.empty": "Số lô không được để trống",
    "string.max": "Số lô tối đa 50 ký tự",
    "any.required": "Số lô là bắt buộc",
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
    "number.base": "Số lượng nhập phải là số",
    "number.integer": "Số lượng nhập phải là số nguyên",
    "number.min": "Số lượng nhập phải >= 1",
    "any.required": "Số lượng nhập là bắt buộc",
  }),

  importPrice: Joi.number().min(0).required().messages({
    "number.base": "Giá nhập phải là số",
    "number.min": "Giá nhập không được âm",
    "any.required": "Giá nhập là bắt buộc",
  }),
});

const warehouseValidation = {
  // POST /api/warehouse-receipts
  createReceipt: Joi.object({
    receiptCode: Joi.string().trim().max(20).required().messages({
      "string.base": "Mã phiếu nhập phải là chuỗi ký tự",
      "string.empty": "Mã phiếu nhập không được để trống",
      "string.max": "Mã phiếu nhập tối đa 20 ký tự",
      "any.required": "Mã phiếu nhập là bắt buộc",
    }),

    receiptDate: Joi.date().iso().optional().messages({
      "date.base": "Ngày nhập không hợp lệ",
      "date.format": "Ngày nhập phải theo định dạng YYYY-MM-DD",
    }),

    supplierId: Joi.number().integer().positive().required().messages({
      "number.base": "supplierId phải là số",
      "number.integer": "supplierId phải là số nguyên",
      "number.positive": "Vui lòng chọn nhà cung cấp hợp lệ",
      "any.required": "Vui lòng chọn nhà cung cấp",
    }),

    details: Joi.array().items(detailSchema).min(1).required().messages({
      "array.base": "Danh sách thuốc nhập không hợp lệ",
      "array.min": "Phiếu nhập phải có ít nhất 1 dòng thuốc",
      "any.required": "Danh sách thuốc nhập là bắt buộc",
    }),
  }),
  updateReceipt: Joi.object({
    receiptCode: Joi.string().trim().max(20).required().messages({
      "string.base": "Mã phiếu nhập phải là chuỗi ký tự",
      "string.empty": "Mã phiếu nhập không được để trống",
      "string.max": "Mã phiếu nhập tối đa 20 ký tự",
      "any.required": "Mã phiếu nhập là bắt buộc",
    }),

    receiptDate: Joi.date().iso().optional().messages({
      "date.base": "Ngày nhập không hợp lệ",
      "date.format": "Ngày nhập phải theo định dạng YYYY-MM-DD",
    }),

    supplierId: Joi.number().integer().positive().required().messages({
      "number.base": "supplierId phải là số",
      "number.integer": "supplierId phải là số nguyên",
      "number.positive": "Vui lòng chọn nhà cung cấp hợp lệ",
      "any.required": "Vui lòng chọn nhà cung cấp",
    }),

    details: Joi.array().items(detailSchema).min(1).required().messages({
      "array.base": "Danh sách thuốc nhập không hợp lệ",
      "array.min": "Phiếu nhập phải có ít nhất 1 dòng thuốc",
      "any.required": "Danh sách thuốc nhập là bắt buộc",
    }),
  }),
};

module.exports = warehouseValidation;
