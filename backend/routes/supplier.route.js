const express = require("express");
const router = express.Router();

const {
  getSupplier,
  getSupplierById,
  insertSupplier,
  updateSupplier,
  deleteSupplier,
} = require("../controllers/supplier.controller");

const {
  insertSupplierReq,
  updateSupplierReq
} = require("../validations/requests/supplier.validation");

const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler")

// http://localhost:5000/api/suppliers
router.get("/", asyncHandler(getSupplier));
router.get("/:id", asyncHandler(getSupplierById));
router.post("/", validate(insertSupplierReq), asyncHandler(insertSupplier));
router.put("/:id", validate(updateSupplierReq), asyncHandler(updateSupplier));
router.delete("/:id", asyncHandler(deleteSupplier));

module.exports = router;
