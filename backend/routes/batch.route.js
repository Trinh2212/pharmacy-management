const express = require("express");
const router = express.Router();
const batchControllers = require("../controllers/batch.controller");
const { verifyToken } = require("../middlewares/verifyToken");
const asyncHandler = require("../middlewares/asyncHandler");

router.use(verifyToken);

router.get("/", asyncHandler(batchControllers.getAllBatches));

router.get("/stats", asyncHandler(batchControllers.getBatchStats));

router.get("/check", asyncHandler(batchControllers.checkBatch));

router.get(
  "/by-medicine/:medicineId",
  asyncHandler(batchControllers.getBatchesByMedicine),
);

module.exports = router;