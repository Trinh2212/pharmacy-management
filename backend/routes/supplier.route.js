const express = require("express");
const router = express.Router();

const supplierControllers = require("../controllers/supplier.controller");
const supplierValidations = require("../validations/requests/supplier.validation");
const { verifyToken } = require("../middlewares/verifyToken");
const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler")

router.get("/", asyncHandler(supplierControllers.getSupplier));
router.get("/:id", asyncHandler(supplierControllers.getSupplierById));
router.post(
  "/",
  verifyToken,
  validate(supplierValidations.createSupplier),
  asyncHandler(supplierControllers.createSupplier),
);
router.put(
  "/:id",
  verifyToken,
  validate(supplierValidations.updateSupplier),
  asyncHandler(supplierControllers.updateSupplier),
);
router.delete("/:id", verifyToken, asyncHandler(supplierControllers.deleteSupplier));

module.exports = router;
