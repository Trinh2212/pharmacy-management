const db = require("../models/index.model");
const { Op } = require("sequelize");

const medicineGroupControllers = {
  getMedicineGroup : async (req, res) => {
    const { search = ""} = req.query;
    const keyword = search.trim();

    const filter = keyword
      ? {
          [Op.or]: [
            { groupName: { [Op.like]: `%${keyword}%` } },
            { description: { [Op.like]: `%${keyword}%` } },
          ],
        }
      : {};
  
    const medicineGroup = await db.MedicineGroup.findAll({
      where: filter,
      order: [["groupName", "ASC"]],
    });
  
    return res.status(200).json({
      message: "lấy danh sách nhóm thuốc thành công", 
      data: medicineGroup,
    });
  },
  
  getMedicineGroupById : async (req, res) => {
    const { id } = req.params;
  
    const medicineGroup = await db.MedicineGroup.findByPk(id);
  
    if (!medicineGroup) {
      return res.status(404).json({
        message: "không tìm thấy nhóm thuốc ",
      });
    }
    return res.status(200).json({
      message: "lấy thông tin nhóm thuốc thành công",
      data: medicineGroup,
    });
  },
  
  createMedicineGroup : async (req, res) => {
    const { groupName} = req.body;
  
    const existed = await db.MedicineGroup.findOne({
      where: {
        groupName,
      },
    });
    if (existed) {
      return res.status(409).json({
        message: "nhóm thuốc đã tồn tại",
      });
    }
    const medicineGroup = await db.MedicineGroup.create(req.body);
  
    return res.status(201).json({
      message: "thêm nhóm thuốc mới thành công",
      data: medicineGroup,
    });
  },
  
  updateMedicineGroup : async (req, res) => {
    const { id } = req.params;
    const {groupName} = req.body;
  
    const medicineGroup = await db.MedicineGroup.findByPk(id);
  
    if (!medicineGroup){
      return res.status(404).json({
        message: "không tìm thấy nhóm thuốc"
      })
    }
  
    if (groupName) {
      const existed = await db.MedicineGroup.findOne({
        where: {
          groupName
        }
      })
  
      if (existed && existed.groupId !== medicineGroup.groupId){
        return res.status(409).json({
          message: "tên nhóm đã tồn tại"
        })
      }
    }
    await medicineGroup.update(req.body);
    
    return res.status(200).json({
      message: "cập nhật nhóm thuốc thành công",
      data: medicineGroup
    });
  },
  
  deleteMedicineGroup : async (req, res) => {
    const {id} = req.params;
  
    const medicineGroup = await db.MedicineGroup.findByPk(id);
  
    if (!medicineGroup) {
      return res.status(404).json({
        message: "không tìm thấy nhóm thuốc",
      });
    }
    const usageCount = await medicineGroup.countMedicineInfo();

    if (usageCount > 0) {
      return res.status(409).json({
        message: `Không thể xóa nhóm, đang có ${usageCount} thuốc nằm trong nhóm này`,
      });
    }

    await medicineGroup.destroy();
    return res.status(200).json({
      message: "xóa nhóm thuốc thành công",
    });
  }
}

module.exports = medicineGroupControllers;
