const Joi = require("joi");

const ingredientValidations = {
    createIngredient : Joi.object({
        ingredientName: Joi.string().max(100).required()
    }).unknown(false),
    
    updateIngredient : Joi.object({
      ingredientName: Joi.string().max(100),
    }).unknown(false)
}

module.exports = ingredientValidations;

