const Joi = require("joi");
const { changeStatus } = require("../../controllers/medicine.controller");

const medicineValidations = {
  createMedicine: Joi.object({
    medicineCode: Joi.string().max(50).required(),
    brandName: Joi.string().max(100).required(),
    origin: Joi.string().max(50).allow(null, "").optional(),
    status: Joi.string().valid("đang cung cấp", "ngừng cung cấp"),
    price: Joi.number().positive().precision(2).required(),
    registrationNumber: Joi.string().max(50).required(),
    imageUrl: "",
    unit: Joi.string().valid(
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
    ),
    groupIds: Joi.array().items(Joi.number().integer()).min(1).required(),
    ingredients: Joi.array()
      .items(
        Joi.object({
          ingredientId: Joi.number().integer().required(),
          strength: Joi.string().max(50).required(),
        }),
      )
      .min(1)
      .required(),
    usageData: Joi.object({
      dosageForm: Joi.string(),
      packaging: Joi.string(),
      uses: Joi.string(),
      contraindications: Joi.string(),
      sideEffects: Joi.string(),
      dosageAdministration: Joi.string(),
      storageCondition: Joi.string(),
      warning: Joi.string(),
    }),
    documentPath: Joi.string(),
  }).unknown(false),

  updateMedicine: Joi.object({
    medicineCode: Joi.string().max(50),
    brandName: Joi.string().max(100),
    origin: Joi.string().max(50).allow(null, ""),
    price: Joi.number().positive().precision(2),
    registrationNumber: Joi.string().max(50),
    status: Joi.string().valid("đang cung cấp", "ngừng cung cấp"),
    unit: Joi.string().valid(
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
    ),
    groupIds: Joi.array().items(Joi.number().integer()),
    ingredients: Joi.array().items(
      Joi.object({
        ingredientId: Joi.number().integer().required(),
        strength: Joi.string().max(50).required(),
      }),
    ),
    usageData: Joi.object({
      dosageForm: Joi.string().max(100),
      packaging: Joi.string(),
      uses: Joi.string(),
      contraindications: Joi.string(),
      sideEffects: Joi.string(),
      dosageAdministration: Joi.string(),
      storageCondition: Joi.string(),
      warning: Joi.string(),
    }),
  }).unknown(false),

  changeStatus: Joi.object({
    status: Joi.string().valid("đang cung cấp", "ngừng cung cấp"),
  }).unknown(false),
};

module.exports = medicineValidations;
