const db = require("../models/index.model");
const { Op } = require("sequelize");


const medicineGroupControllers = {
  getMedicineGroup : async (req, res) => {
    const { search = "", page = 1 } = req.query;
    const keyword = search.trim();
    const pageSize = 5;
    const offset = (parseInt(page, 10) - 1) * pageSize;
  
    let filter = {};
  
    if (keyword !== "") {
      filter = {
        [Op.or]: [
          { groupName: { [Op.like]: `%${keyword}%` } },
          { description: { [Op.like]: `%${keyword}%` } },
        ],
      };
    }
  
    const { count, rows } = await db.MedicineGroup.findAndCountAll({
      where: filter,
      limit: pageSize,
      offset,
  
      order: [["groupName", "ASC"]],
    });
  
    return res.status(200).json({
      message: "lấy danh sách nhóm thuốc thành công", 
      data: rows,
      currentPage: parseInt(page, 10),
      totalPages: Math.ceil(count / pageSize),
      totalGroups: count,
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
    await medicineGroup.destroy();
    return res.status(200).json({
      message: "xóa nhóm thuốc thành công",
    });
  }
}

module.exports = medicineGroupControllers;
