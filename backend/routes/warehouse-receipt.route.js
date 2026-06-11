const express = require("express");
const router = express.Router();

const {
  getWarehouseReceipt,
  getWarehouseReceiptById,
  insertWarehouseReceipt,
  updateWarehouseReceipt,
  deleteWarehouseReceipt,
} = require("../controllers/warehouse-receipt.controller");

// http://localhost:5000/api/warehouse-receipts
router.get("/", getWarehouseReceipt);
router.get("/:id", getWarehouseReceiptById);
router.post("/", insertWarehouseReceipt);
router.put("/:id", updateWarehouseReceipt);
router.delete("/:id", deleteWarehouseReceipt);

module.exports = router;
