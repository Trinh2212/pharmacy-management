const medicineGroup = require("../models/medicine-group.model");

const getMedicineGroup = async (req, res) => {
  res.status(200).json({
    message: "lấy danh sách nhóm thuốc thành công",
  });
};

const getMedicineGroupById = async(req, res) => {
  res.status(200).json({
    message: "lấy thông tin nhóm thuốc thành công"
  })
}

const insertMedicineGroup = async (req, res) => {
  res.status(200).json({
    message: "thêm nhóm thuốc mới thành công",
  });
};

const updateMedicineGroup = async (req, res) => {
  res.status(200).json({
    message: "cập nhật nhóm thuốc thành công",
  });
};

const deleteMedicineGroup = async (req, res) => {
  res.status(200).json({
    message: "xóa nhóm thuốc thành công",
  });
};

module.exports = {
  getMedicineGroup,
  getMedicineGroupById,
  insertMedicineGroup,
  updateMedicineGroup,
  deleteMedicineGroup,
};
