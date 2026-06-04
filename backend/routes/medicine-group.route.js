const express = require("express");

const router = express.Router();

const nhomThuocController = require("../controllers/nhom-thuoc.controller");

router.get("/", nhomThuocController.layDanhSachNhomThuoc);
router.post("/", nhomThuocController.taoNhomThuoc);
router.put("/:id", nhomThuocController.capNhatNhomThuoc);
router.delete("/:id", nhomThuocController.xoaNhomThuoc);

module.exports = router;