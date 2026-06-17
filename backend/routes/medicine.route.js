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

const storagePath = "uploads/medicines/";
if (!fs.existsSync(storagePath)) {
  fs.mkdirSync(storagePath, { recursive: true });
}

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, storagePath);
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + "-" + file.originalname);
  },
});
const upload = multer({ storage });

router.get("/", asyncHandler(medicineControllers.getAllMedicines));
router.get("/:id", asyncHandler(medicineControllers.getMedicineById));
router.post(
  "/",
  verifyToken,
  upload.single("medicine"),
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
