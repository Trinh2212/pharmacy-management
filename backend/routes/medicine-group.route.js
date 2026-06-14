const express = require("express");
const router = express.Router();

const {
  getMedicineGroup,
  getMedicineGroupById,
  insertMedicineGroup,
  updateMedicineGroup,
  deleteMedicineGroup,
} = require("../controllers/medicine-group.controller");
const {
  insertMGRequest,
  updateMGRequest,
} = require("../validations/requests/medicineGroup.validation");

const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler");

// http://localhost:5000/api/medicine-groups
router.get("/", asyncHandler(getMedicineGroup));
router.get("/:id", asyncHandler(getMedicineGroupById));
router.post("/", validate(insertMGRequest), asyncHandler(insertMedicineGroup));
router.put("/:id", validate(updateMGRequest), asyncHandler(updateMedicineGroup));
router.delete("/:id", asyncHandler(deleteMedicineGroup));

module.exports = router;