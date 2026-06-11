const supplier = require("../models/supplier.model");

const getSupplier = async (req, res) => {
  res.status(200).json({
    message: "Lấy danh sách nhà cung cấp thành công",
  });
};

const getSupplierById = async (req, res) => {
  res.status(200).json({
    message: "Lấy thông tin nhà cung cấp thành công theo id",
  });
};

const getSupplierByName = async (req, res) => {
  res.status(200).json({
    message: "Lấy thông tin nhà cung cấp thành công theo tên",
  });
};

const insertSupplier = async (req, res) => {
  res.status(200).json({
    message: "Thêm nhà cung cấp mới thành công",
  });
};

const updateSupplier = async (req, res) => {
  res.status(200).json({
    message: "Cập nhật nhà cung cấp thành công",
  });
};

const deleteSupplier = async (req, res) => {
  res.status(200).json({
    message: "Xóa nhà cung cấp thành công",
  });
};

module.exports = {
  getSupplier,
  getSupplierById,
  getSupplierByName,
  insertSupplier,
  updateSupplier,
  deleteSupplier,
};
