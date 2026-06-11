const Joi = require("joi");

const schema = Joi.object({
  medicineCode: Joi.string().max(50).required(),
  brandName: Joi.string().max(100).required(),
  imageUrl: Joi.string().allow(null, "").optional(),
  origin: Joi.string().max(50).allow(null, "").optional(),
  status: Joi.string()
    .valid("đang cung cấp", "ngừng cung cấp", "hết hàng")
    .default("đang cung cấp"),
  price: Joi.number().positive().precision(2).required(),
  registrationNumber: Joi.string().max(50).required(),

  unit: Joi.string()
    .valid(
      "Viên",
      "Vỉ",
      "Hộp",
      "Chai",
      "Lọ",
      "Tuýp",
      "Gói",
      "Ống",
      "Bình xịt",
      "Miếng dán",
    )
    .required(),
}).unknown(false);

module.exports = {
  schema,
};
// không có medicineId vì cái này khi mình thêm thì mới tạo nhe