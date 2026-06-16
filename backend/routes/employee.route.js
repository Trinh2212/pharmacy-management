const express = require("express");
const router = express.Router();
const multer = require("multer");
const fs = require("fs");

const employeeControllers = require("../controllers/employee.controller");
const employeeValidations = require("../validations/requests/employee.validation");
const { verifyToken, verifyAdmin } = require("../middlewares/verifyToken");
const validate = require("../middlewares/validate");
const asyncHandler = require("../middlewares/asyncHandler");

const storagePath = "upload/avatars/";
if (!fs.existsSync(storagePath)) {
  fs.mkdirSync(storagePath, { recursive: true });
}

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, storagePath);
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + "-" + file.originalname);
  },
});
const upload = multer({ storage });

router.get(
  "/getProfile",
  verifyToken,
  asyncHandler(employeeControllers.getProfile),
);

router.put(
  "/updateProfile",
  verifyToken,
  upload.single("avatar"),
  validate(employeeValidations.updateProfile),
  asyncHandler(employeeControllers.updateProfile),
);

router.put(
  "/change-password",
  verifyToken,
  validate(employeeValidations.changePassword),
  asyncHandler(employeeControllers.changePassword),
);
//admin
router.get(
  "/admin/employees",
  verifyAdmin,
  asyncHandler(employeeControllers.getAllEmployees),
);
router.post(
  "/admin/employees",
  verifyAdmin,
  validate(employeeValidations.createByAdmin),
  asyncHandler(employeeControllers.createEmployeeByAdmin),
);
router.put(
  "/admin/employees/:id",
  verifyAdmin,
  validate(employeeValidations.updateByAdmin),
  asyncHandler(employeeControllers.updateEmployeeByAdmin),
);
router.patch("/admin/employees/lock/:id", verifyAdmin, asyncHandler(employeeControllers.toggleLock));
router.delete("/admin/employees/:id", verifyAdmin, asyncHandler(employeeControllers.deleteEmployee));

module.exports = router;
