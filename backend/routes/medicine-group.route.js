const express = require("express");
const router = express.Router();

const {
  getMedicineGroup,
  getMedicineGroupById,
  insertMedicineGroup,
  updateMedicineGroup,
  deleteMedicineGroup,
} = require("../controllers/medicine-group.controller");

// http://localhost:5000/api/medicine-groups
router.get("/", getMedicineGroup);
router.get("/:id", getMedicineGroupById);
router.post("/", insertMedicineGroup);
router.put("/:id", updateMedicineGroup);
router.delete("/:id", deleteMedicineGroup);

module.exports = router;