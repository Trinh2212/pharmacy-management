const employee = require("../models/employee.model");

const getEmployee = async (req, res) => {
  res.status(200).json({
    message: "lay danh sach nhan vien thanh cong",
  });
};

const getEmployeeById = async (req, res) => {
  res.status(200).json({
    message: "lay nhan vien theo id thanh cong",
  });
};

const getEmployeeByName = async (req, res) => {
  res.status(200).json({
    message: "lay nhan vien theo ten thanh cong",
  });
};

const insertEmployee = async (req, res) => {
  res.status(200).json({
    message: "them moi nhan vien thanh cong",
  });
};

const updateEmployee = async (req, res) => {
  res.status(200).json({
    message: "cap nhat nhan vien thanh cong",
  });
};

const deleteEmployee = async (req, res) => {
  res.status(200).json({
    message: "xoa nhan vien thanh cong",
  });
};

module.exports = {
  getEmployee,
  getEmployeeById,
  getEmployeeByName,
  insertEmployee,
  updateEmployee,
  deleteEmployee,
};
