const express = require("express");
const router = express.Router();

const ingredientControllers = require("../controllers/active-ingredient.controller");
const IngredientValidations = require("../validations/requests/activeIngre.validation");
const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler");
const {verifyToken} = require("../middlewares/verifyToken");

router.get("/", asyncHandler(ingredientControllers.getActiveIngredient));
router.get("/:id", asyncHandler(ingredientControllers.getActiveIngredientById));
router.post(
  "/",
  verifyToken,
  validate(IngredientValidations.createIngredient),
  asyncHandler(ingredientControllers.createActiveIngredient),
);
router.put(
  "/:id",
  verifyToken,
  validate(IngredientValidations.updateIngredient),
  asyncHandler(ingredientControllers.updateActiveIngredient),
);
router.delete(
  "/:id",
  verifyToken,
  asyncHandler(ingredientControllers.deleteActiveIngredient),
);

module.exports = router;
