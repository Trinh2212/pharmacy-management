const express = require("express");
const router = express.Router();
const warehouseReceiptControllers = require("../controllers/warehouse-receipt.controller");
const warehouseValidation = require("../validations/requests/warehouse.validation");
const { verifyToken } = require("../middlewares/verifyToken");
const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler");

router.use(verifyToken);

// GET /api/warehouse-receipts?page=1&limit=10
router.get("/", asyncHandler(warehouseReceiptControllers.getAllReceipts));

// GET /api/warehouse-receipts/check-code?code=PN0001
router.get(
  "/check-code",
  asyncHandler(warehouseReceiptControllers.checkReceiptCode),
);

// GET /api/warehouse-receipts/:id
router.get("/:id", asyncHandler(warehouseReceiptControllers.getReceiptById));

router.post(
  "/",
  validate(warehouseValidation.createReceipt),
  asyncHandler(warehouseReceiptControllers.createReceipt),
);

module.exports = router;