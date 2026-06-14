const Joi = require("joi");

const insertIngredient = Joi.object({
    ingredientName: Joi.string().max(100).required()
}).unknown(false);

const updateIngredient = Joi.object({
  ingredientName: Joi.string().max(100),
}).unknown(false);

module.exports = {
    insertIngredient,
    updateIngredient
}

