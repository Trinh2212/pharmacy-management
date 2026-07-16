const Joi = require("joi");

const medicineGValidations = {
  createGroup: Joi.object({
    groupName: Joi.string().max(50).required().messages({
      "string.base": "Tên nhóm thuốc không hợp lệ",
      "string.empty": "Vui lòng nhập tên nhóm thuốc",
      "string.max": "Tên nhóm thuốc không quá 50 ký tự",
      "any.required": "Vui lòng nhập tên nhóm thuốc",
    }),
    description: Joi.string().max(255).allow(null, "").optional().messages({
      "string.base": "Mô tả không hợp lệ",
      "string.max": "Mô tả không quá 255 ký tự",
    }),
  }).unknown(false),

  updateGroup: Joi.object({
    groupName: Joi.string().max(50).messages({
      "string.base": "Tên nhóm thuốc không hợp lệ",
      "string.empty": "Vui lòng nhập tên nhóm thuốc",
      "string.max": "Tên nhóm thuốc không quá 50 ký tự",
    }),
    description: Joi.string().max(255).allow(null, "").messages({
      "string.base": "Mô tả không hợp lệ",
      "string.max": "Mô tả không quá 255 ký tự",
    }),
  }).unknown(false),
};

module.exports = medicineGValidations;