const express = require("express");
const router = express.Router();
const multer = require("multer");
const fs = require("fs");

const medicineControllers = require("../controllers/medicine.controller");
const { verifyToken, verifyAdmin } = require("../middlewares/verifyToken");
const asyncHandler = require("../middlewares/asyncHandler");
const validate = require("../middlewares/validate");
const medicineValidations = require("../validations/requests/medicine.validation");
const parse = require("../middlewares/parse");
const upload = require("../middlewares/upload");


router.get("/", asyncHandler(medicineControllers.getAllMedicines));
router.get("/medicineDetail/:id", asyncHandler(medicineControllers.getMedicineById));
router.post(
  "/",
  // verifyToken,
  upload.fields([
    { name: "medicine", maxCount: 1 },
    { name: "document", maxCount: 1 },
  ]),
  parse,
  validate(medicineValidations.createMedicine),
  asyncHandler(medicineControllers.createMedicine),
);
router.put(
  "/:id",
  verifyToken,
  upload.single("medicine"),
  validate(medicineValidations.createMedicine),
  asyncHandler(medicineControllers.updateMedicine),
);
router.delete(
  "/:id",
  verifyToken,
  asyncHandler(medicineControllers.deleteMedicine),
);

router.put(
  "/:id/status",
  verifyAdmin,
  asyncHandler(medicineControllers.changeStatus),
);

module.exports = router;
// ocr - upload - imgInstruction sau - .... auto