const express = require("express");
const router = express.Router();

const {
  getActiveIngredient,
  getActiveIngredientById,
  insertActiveIngredient,
  updateActiveIngredient,
  deleteActiveIngredient,
} = require("../controllers/active-ingredient.controller");
const { insertIngredient, updateIngredient } = require("../validations/requests/activeIngre.validation");
const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler");

// http://localhost:5000/api/active-ingredients
router.get("/", asyncHandler(getActiveIngredient));
router.get("/:id", asyncHandler(getActiveIngredientById));
router.post(
  "/",
  validate(insertIngredient),
  asyncHandler(insertActiveIngredient),
);
router.put(
  "/:id",
  validate(updateIngredient),
  asyncHandler(updateActiveIngredient),
);
router.delete("/:id", asyncHandler(deleteActiveIngredient));

module.exports = router;
