const express = require("express");
const router = express.Router();
const warehouseReceiptControllers = require("../controllers/warehouse-receipt.controller");
const warehouseValidation = require("../validations/requests/warehouse.validation");
const { verifyToken } = require("../middlewares/verifyToken");
const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler");

router.use(verifyToken);

router.get("/", asyncHandler(warehouseReceiptControllers.getAllReceipts));

router.get(
  "/check-code",
  asyncHandler(warehouseReceiptControllers.checkReceiptCode),
);

router.get("/cost-trend", asyncHandler(warehouseReceiptControllers.getImportCostTrend));

router.get("/:id", asyncHandler(warehouseReceiptControllers.getReceiptById));

router.post(
  "/",
  validate(warehouseValidation.createReceipt),
  asyncHandler(warehouseReceiptControllers.createReceipt),
);

module.exports = router;