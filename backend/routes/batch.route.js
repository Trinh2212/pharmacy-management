const express = require("express");
const router = express.Router();
const batchControllers = require("../controllers/batch.controller");
const { verifyToken } = require("../middlewares/verifyToken");
const asyncHandler = require("../middlewares/asyncHandler");

router.get("/",verifyToken, asyncHandler(batchControllers.getAllBatches));
router.get("/stats",verifyToken, asyncHandler(batchControllers.getBatchStats));
router.get("/check",verifyToken, asyncHandler(batchControllers.checkBatch));
router.get(
  "/by-medicine/:medicineId",
  verifyToken,
  asyncHandler(batchControllers.getBatchesByMedicine),
);

module.exports = router;