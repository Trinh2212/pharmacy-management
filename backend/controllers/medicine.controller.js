const {sequelize} = require("../config/database");
const db = require("../models/index.model");

const getMedicine = async (req, res) => {
  res.status(200).json({
    message: "lấy danh sách thuốc thành công",
  });
};

const getMedicineById = async (req, res) => {
  res.status(200).json({
    message: "lấy thông tin thuốc thành công theo id",
  });
};

const getMedicineByName = async (req, res) => {
  res.status(200).json({
    message: "lấy thông tin thuốc thành công theo tên",
  });
};

const insertMedicine = async (req, res) => {
  const medicine = await db.Medicine.create(req.body);
  return res.status(201).json({
    message: "thêm thuốc mới thành công",
    data: medicine
  }); 
};

const updateMedicine = async (req, res) => {
  res.status(200).json({
    message: "cập nhật thuốc thành công",
  });
};

const deleteMedicine = async (req, res) => {
  res.status(200).json({
    message: "xóa thuốc thành công",
  });
};

module.exports = {
  getMedicine,
  getMedicineById,
  getMedicineByName,
  insertMedicine,
  updateMedicine,
  deleteMedicine,
};
