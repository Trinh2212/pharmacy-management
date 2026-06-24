const express = require("express");
const router = express.Router();
const upload = require("../middlewares/upload");
const asyncHandler = require("../middlewares/asyncHandler")
const { extractMedicineInfo } = require("../controllers/ocr.controller");

router.post(
  "/medicine",
  upload.single("image"),
  asyncHandler(extractMedicineInfo),
);

module.exports = router;
