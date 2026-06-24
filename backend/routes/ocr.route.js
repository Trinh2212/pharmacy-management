const express = require("express");
const router = express.Router();
const upload = require("../middlewares/upload");
const { extractMedicineInfo } = require("../controllers/ocr.controller");

router.post("/medicine", upload.single("image"), extractMedicineInfo);

module.exports = router;
