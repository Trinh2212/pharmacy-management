const Joi = require("joi");

const supplierValidations = {
  createSupplier: Joi.object({
    supplierName: Joi.string().trim().max(50).required().messages({
      "string.base": "Tên nhà cung cấp không hợp lệ",
      "string.empty": "Vui lòng nhập tên nhà cung cấp",
      "string.max": "Tên nhà cung cấp không quá 50 ký tự",
      "any.required": "Vui lòng nhập tên nhà cung cấp",
    }),
    address: Joi.string().max(255).allow(null, "").messages({
      "string.base": "Địa chỉ không hợp lệ",
      "string.max": "Địa chỉ không quá 255 ký tự",
    }),
    email: Joi.string().max(100).email().required().messages({
      "string.base": "Email không hợp lệ",
      "string.empty": "Vui lòng nhập email",
      "string.email": "Email không đúng định dạng",
      "string.max": "Email không quá 100 ký tự",
      "any.required": "Vui lòng nhập email",
    }),
    phoneNumber: Joi.string()
      .pattern(/^[0-9]+$/)
      .length(10)
      .required()
      .messages({
        "string.base": "Số điện thoại không hợp lệ",
        "string.empty": "Vui lòng nhập số điện thoại",
        "string.pattern.base": "Số điện thoại chỉ được chứa chữ số",
        "string.length": "Số điện thoại phải có đúng 10 chữ số",
        "any.required": "Vui lòng nhập số điện thoại",
      }),
  }).unknown(false),

  updateSupplier: Joi.object({
    supplierName: Joi.string().trim().max(50).messages({
      "string.base": "Tên nhà cung cấp không hợp lệ",
      "string.empty": "Vui lòng nhập tên nhà cung cấp",
      "string.max": "Tên nhà cung cấp không quá 50 ký tự",
    }),
    address: Joi.string().max(255).allow(null, "").messages({
      "string.base": "Địa chỉ không hợp lệ",
      "string.max": "Địa chỉ không quá 255 ký tự",
    }),
    email: Joi.string().max(100).email().messages({
      "string.base": "Email không hợp lệ",
      "string.empty": "Vui lòng nhập email",
      "string.email": "Email không đúng định dạng",
      "string.max": "Email không quá 100 ký tự",
    }),
    phoneNumber: Joi.string()
      .pattern(/^[0-9]+$/)
      .length(10)
      .messages({
        "string.base": "Số điện thoại không hợp lệ",
        "string.empty": "Vui lòng nhập số điện thoại",
        "string.pattern.base": "Số điện thoại chỉ được chứa chữ số",
        "string.length": "Số điện thoại phải có đúng 10 chữ số",
      }),
  }).unknown(false),
};

module.exports = supplierValidations;