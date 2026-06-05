const express = require("express");

const router = express.Router();

const medicineGroup = require("../controllers/medicine-group.controller");

router.get("/", medicineGroup.layDanhSachNhomThuoc);
router.post("/", medicineGroup.taoNhomThuoc);
router.put("/:id", medicineGroup.capNhatNhomThuoc);
router.delete("/:id", medicineGroup.xoaNhomThuoc);

module.exports = router;