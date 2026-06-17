const Joi = require("joi");

const supplierValidations = {
  createSupplier : Joi.object({
    supplierName: Joi.string().trim().max(50).required(),
    address: Joi.string().max(255).allow(null, ""),
    email: Joi.string().max(100).email().required(),
    phoneNumber: Joi.string()
      .pattern(/^[0-9]+$/)
      .length(10).required(),
  }).unknown(false),
  
  updateSupplier : Joi.object({
    supplierName: Joi.string().trim().max(50),
    address: Joi.string().max(255).allow(null, ""),
    email: Joi.string().max(100).email(),
    phoneNumber: Joi.string()
      .pattern(/^[0-9]+$/)
      .length(10),
  }).unknown(false)
}

module.exports = supplierValidations;