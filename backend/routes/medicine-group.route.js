const express = require("express");
const router = express.Router();

const medicineGroupControllers = require("../controllers/medicine-group.controller");
const medicineGValidations = require("../validations/requests/medicineGroup.validation");
const { verifyToken } = require("../middlewares/verifyToken");

const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler");

router.get("/", asyncHandler(medicineGroupControllers.getMedicineGroup));
router.get("/:id", asyncHandler(medicineGroupControllers.getMedicineGroupById));
router.post(
  "/",
  verifyToken,
  validate(medicineGValidations.createGroup),
  asyncHandler(medicineGroupControllers.createMedicineGroup),
);
router.put(
  "/:id",
  verifyToken,
  validate(medicineGValidations.updateGroup),
  asyncHandler(medicineGroupControllers.updateMedicineGroup),
);
router.delete(
  "/:id",
  verifyToken,
  asyncHandler(medicineGroupControllers.deleteMedicineGroup),
);

module.exports = router;