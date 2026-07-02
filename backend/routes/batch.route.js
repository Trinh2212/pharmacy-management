const express = require("express");
const router = express.Router();
const batchControllers = require("../controllers/batch.controller");
const { verifyToken } = require("../middlewares/verifyToken");
const asyncHandler = require("../middlewares/asyncHandler");

router.use(verifyToken);

// GET /api/batches/check?medicineId=1&batchNumber=LOT001
router.get("/check", asyncHandler(batchControllers.checkBatch));

// GET /api/batches/by-medicine/:medicineId
router.get(
  "/by-medicine/:medicineId",
  asyncHandler(batchControllers.getBatchesByMedicine),
);

module.exports = router;
