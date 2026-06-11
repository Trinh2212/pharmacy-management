const express = require("express");
const router = express.Router();

const {
  getActiveIngredient,
  getActiveIngredientById,
  getActiveIngredientByName,
  insertActiveIngredient,
  updateActiveIngredient,
  deleteActiveIngredient,
} = require("../controllers/active-ingredient.controller");

// http://localhost:5000/api/active-ingredients
router.get("/", getActiveIngredient);
router.get("/:id", getActiveIngredientById);
router.get("/search/:name", getActiveIngredientByName);
router.post("/", insertActiveIngredient);
router.put("/:id", updateActiveIngredient);
router.delete("/:id", deleteActiveIngredient);

module.exports = router;
