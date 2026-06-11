const warehouseReceipt = require("../models/warehouse-receipt.model");

const getWarehouseReceipt = async (req, res) => {
  res.status(200).json({
    message: "Lấy danh sách phiếu nhập kho thành công",
  });
};

const getWarehouseReceiptById = async (req, res) => {
  res.status(200).json({
    message: "Lấy thông tin phiếu nhập kho thành công",
  });
};

const insertWarehouseReceipt = async (req, res) => {
  res.status(200).json({
    message: "Thêm phiếu nhập kho mới thành công",
  });
};

const updateWarehouseReceipt = async (req, res) => {
  res.status(200).json({
    message: "Cập nhật phiếu nhập kho thành công",
  });
};

const deleteWarehouseReceipt = async (req, res) => {
  res.status(200).json({
    message: "Xóa phiếu nhập kho thành công",
  });
};

module.exports = {
  getWarehouseReceipt,
  getWarehouseReceiptById,
  insertWarehouseReceipt,
  updateWarehouseReceipt,
  deleteWarehouseReceipt,
};
