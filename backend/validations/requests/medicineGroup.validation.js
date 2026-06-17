const Joi = require("joi");

const medicineGValidations = {
    createGroup : Joi.object({
        groupName: Joi.string().max(50).required(),
        description: Joi.string().max(255).allow(null, "").optional()
    }).unknown(false),

    updateGroup : Joi.object({
        groupName: Joi.string().max(50),
        description: Joi.string().max(255).allow(null, ""),
    }).unknown(false)
}

module.exports = medicineGValidations;