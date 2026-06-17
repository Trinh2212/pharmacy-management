const express = require("express");
const router = express.Router();

const supplierControllers = require("../controllers/supplier.controller");

const supplierValidations = require("../validations/requests/supplier.validation");

const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler")

// http://localhost:5000/api/suppliers
router.get("/", asyncHandler(supplierControllers.getSupplier));
router.get("/:id", asyncHandler(supplierControllers.getSupplierById));
router.post(
  "/",
  validate(supplierValidations.createSupplier),
  asyncHandler(supplierControllers.createSupplier),
);
router.put(
  "/:id",
  validate(supplierValidations.updateSupplier),
  asyncHandler(supplierControllers.updateSupplier),
);
router.delete("/:id", asyncHandler(supplierControllers.deleteSupplier));

module.exports = router;
