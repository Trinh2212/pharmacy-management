const Joi = require("joi");

const insertMGRequest = Joi.object({
    groupName: Joi.string().max(50).required(),
    description: Joi.string().max(255).allow(null, "").optional()
}).unknown(false);

const updateMGRequest = Joi.object({
  groupName: Joi.string().max(50),
  description: Joi.string().max(255).allow(null, ""),
}).unknown(false);

module.exports = {
    insertMGRequest,
    updateMGRequest
}