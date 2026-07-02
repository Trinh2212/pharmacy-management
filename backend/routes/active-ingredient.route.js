const express = require("express");
const router = express.Router();

const ingredientControllers = require("../controllers/active-ingredient.controller");
const IngredientValidations = require("../validations/requests/activeIngre.validation");
const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler");

router.get("/", asyncHandler(ingredientControllers.getActiveIngredient));
router.get("/:id", asyncHandler(ingredientControllers.getActiveIngredientById));
router.post(
  "/",
  validate(IngredientValidations.createIngredient),
  asyncHandler(ingredientControllers.createActiveIngredient),
);
router.put(
  "/:id",
  validate(IngredientValidations.updateIngredient),
  asyncHandler(ingredientControllers.updateActiveIngredient),
);
router.delete(
  "/:id",
  asyncHandler(ingredientControllers.deleteActiveIngredient),
);

module.exports = router;
