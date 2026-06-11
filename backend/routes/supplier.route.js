const express = require("express");
const router = express.Router();

const {
  getSupplier,
  getSupplierById,
  getSupplierByName,
  insertSupplier,
  updateSupplier,
  deleteSupplier,
} = require("../controllers/supplier.controller");

// http://localhost:5000/api/suppliers
router.get("/", getSupplier);
router.get("/:id", getSupplierById);
router.get("/search/:name", getSupplierByName);
router.post("/", insertSupplier);
router.put("/:id", updateSupplier);
router.delete("/:id", deleteSupplier);

module.exports = router;
