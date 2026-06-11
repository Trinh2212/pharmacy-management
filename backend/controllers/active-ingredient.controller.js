const activeIngredient = require("../models/active-ingredient.model");

const getActiveIngredient = async (req, res) => {
  res.status(200).json({
    message: "Lấy danh sách hoạt chất thành công",
  });
};

const getActiveIngredientById = async (req, res) => {
  res.status(200).json({
    message: "Lấy thông tin hoạt chất thành công theo id",
  });
};

const getActiveIngredientByName = async (req, res) => {
  res.status(200).json({
    message: "Lấy thông tin hoạt chất thành công theo tên",
  });
};

const insertActiveIngredient = async (req, res) => {
  res.status(200).json({
    message: "Thêm hoạt chất mới thành công",
  });
};

const updateActiveIngredient = async (req, res) => {
  res.status(200).json({
    message: "Cập nhật hoạt chất thành công",
  });
};

const deleteActiveIngredient = async (req, res) => {
  res.status(200).json({
    message: "Xóa hoạt chất thành công",
  });
};

module.exports = {
  getActiveIngredient,
  getActiveIngredientById,
  getActiveIngredientByName,
  insertActiveIngredient,
  updateActiveIngredient,
  deleteActiveIngredient,
};
