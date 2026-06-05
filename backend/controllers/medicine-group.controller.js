const medicineGroup = require("../models/medicine-group.model");

const layDanhSachNhomThuoc = async (req, res) => {
    try {
      const dsNhomThuoc = await medicineGroup.findAll();
      return res.status(200).json({
        success: true,
        data: dsNhomThuoc,
      });
    }catch(error){
        res.status(500).json({ success: false, message: error.message})
    }
}

const taoNhomThuoc = async (req, res) => {
  try {
    // Lấy dữ liệu người dùng gửi lên từ body (Postman gửi dạng JSON)
    const { groupName, description } = req.body;

    // Kiểm tra xem người dùng có nhập tên nhóm không (vì SQL để NOT NULL)
    if (!groupName) {
      return res
        .status(400)
        .json({ success: false, message: "Tên nhóm không được để trống!" });
    }

    // Dùng hàm .create() để chèn một dòng mới vào MySQL.
    // ID tự tăng (autoIncrement) nên không cần truyền vào đây.
    const newGroup = await medicineGroup.create({ groupName, description });

    return res.status(201).json({
      success: true,
      message: "Thêm nhóm thuốc thành công!",
      data: newGroup,
    });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
};

const capNhatNhomThuoc = async (req, res) => {
    res.send("cap nhat nhom thuoc");
}

const xoaNhomThuoc = async (req, res) => {
    res.send("xoa nhom thuoc");
}

module.exports = {
    layDanhSachNhomThuoc,
    taoNhomThuoc,
    capNhatNhomThuoc,
    xoaNhomThuoc
}