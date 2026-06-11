const express = require("express");
const router = express.Router()

const {
  getMedicine,
  getMedicineById,
  getMedicineByName,
  insertMedicine,
  updateMedicine,
  deleteMedicine,
} = require("../controllers/medicine.controller");
const asyncHandler = require("../middlewares/asyncHandler");
const validate = require("../middlewares/validate");
const {schema: insertMedicineRequest} = require("../validations/requests/insertMedicineRequest")
// http://localhost:5000/api/medicines
router.get("/", getMedicine);
router.get("/search/:name", getMedicineByName);
router.get("/:id", getMedicineById);
router.post("/", validate(insertMedicineRequest), asyncHandler(insertMedicine));
router.put("/:id", updateMedicine);
router.delete("/:id", deleteMedicine);

module.exports = router;
