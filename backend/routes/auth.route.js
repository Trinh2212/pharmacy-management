const express = require("express");
const router = express.Router();

const authControllers = require("../controllers/auth.controller");
const employeeValidations = require("../validations/requests/employee.validation");
const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler");

router.post(
  "/login",
  validate(employeeValidations.login),
  asyncHandler(authControllers.login),
);

module.exports = router;
