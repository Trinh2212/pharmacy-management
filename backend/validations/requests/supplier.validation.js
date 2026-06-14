const Joi = require("joi");

const insertSupplierReq = Joi.object({
  supplierName: Joi.string().trim().max(50).required(),
  address: Joi.string().max(255).allow(null, ""),
  email: Joi.string().max(100).email().required(),
  phoneNumber: Joi.string()
    .pattern(/^[0-9]+$/)
    .length(10).required(),
}).unknown(false);

const updateSupplierReq = Joi.object({
  supplierName: Joi.string().trim().max(50),
  address: Joi.string().max(255).allow(null, ""),
  email: Joi.string().max(100).email(),
  phoneNumber: Joi.string()
    .pattern(/^[0-9]+$/)
    .length(10),
}).unknown(false);

module.exports = {
  insertSupplierReq,
  updateSupplierReq,
};