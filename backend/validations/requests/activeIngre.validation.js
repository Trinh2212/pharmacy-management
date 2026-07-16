const Joi = require("joi");

const ingredientValidations = {
  createIngredient: Joi.object({
    ingredientName: Joi.string().max(100).required().messages({
      "string.base": "Tên hoạt chất không hợp lệ",
      "string.empty": "Vui lòng nhập tên hoạt chất",
      "string.max": "Tên hoạt chất không được vượt quá 100 ký tự",
      "any.required": "Vui lòng nhập tên hoạt chất",
    }),
  }).unknown(false),

  updateIngredient: Joi.object({
    ingredientName: Joi.string().max(100).messages({
      "string.base": "Tên hoạt chất không hợp lệ",
      "string.empty": "Tên hoạt chất không được để trống",
      "string.max": "Tên hoạt chất không được vượt quá 100 ký tự",
    }),
  }).unknown(false),
};

module.exports = ingredientValidations;
