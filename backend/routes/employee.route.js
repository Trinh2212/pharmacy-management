const express = require("express");
const router = express.Router();

const {
  getEmployee,
  getEmployeeById,
  getEmployeeByName,
  insertEmployee,
  updateEmployee,
  deleteEmployee,
} = require("../controllers/employee.controller");

// http://localhost:5000/api/employees
router.get("/", getEmployee);
router.get("/:id", getEmployeeById);
router.get("/search/:name", getEmployeeByName);
router.post("/", insertEmployee);
router.put("/:id", updateEmployee);
router.delete("/:id", deleteEmployee);

module.exports = router;