const express = require("express");
const router = express.Router();
const warehouseReceiptControllers = require("../controllers/warehouse-receipt.controller");
const warehouseValidation = require("../validations/requests/warehouse.validation");
const { verifyToken } = require("../middlewares/verifyToken");
const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler");

router.get("/",verifyToken, asyncHandler(warehouseReceiptControllers.getAllReceipts));

router.get(
  "/check-code",
  verifyToken,
  asyncHandler(warehouseReceiptControllers.checkReceiptCode),
);

router.get("/cost-trend",verifyToken, asyncHandler(warehouseReceiptControllers.getImportCostTrend));

router.get("/:id",verifyToken, asyncHandler(warehouseReceiptControllers.getReceiptById));

router.post(
  "/",
  verifyToken,
  validate(warehouseValidation.createReceipt),
  asyncHandler(warehouseReceiptControllers.createReceipt),
);

router.put(
  "/:id",
  verifyToken,
  validate(warehouseValidation.updateReceipt),
  asyncHandler(warehouseReceiptControllers.updateReceipt),
);

module.exports = router;