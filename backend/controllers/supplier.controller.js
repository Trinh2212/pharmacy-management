const db = require("../models/index.model");
const { Op } = require("sequelize");

const supplierControllers = {
 getSupplier : async (req, res) => {
    const { search = "" } = req.query;
    const keyword = search.trim();
  
    const filter = keyword
      ? {
          supplierName: { [Op.like]: `%${keyword}%` },
        }
      : {};
  
    const supplierList = await db.Supplier.findAll({
      where: filter,
      order: [["supplierName", "ASC"]],
    });
  
    return res.status(200).json({
      message: "Lấy danh sách nhà cung cấp thành công",
      data: supplierList,
    });
  },
  
  getSupplierById : async (req, res) => {
    const { id } = req.params;
  
    const supplier = await db.Supplier.findByPk(id);
    if (!supplier) {
      return res.status(404).json({
        message: "không tìm thấy nhà cung cấp",
      });
    }
    return res.status(200).json({
      message: "Lấy thông tin nhà cung cấp thành công",
      data: supplier
    });
  },
  
  createSupplier : async (req, res) => {
    const { supplierName } = req.body;
  
    const existed = await db.Supplier.findOne({
      where: {
        supplierName,
      },
    });
  
    if (existed) {
      return res.status(409).json({
        message: "nhà cung cấp đã tồn tại",
      });
    }
    const supplier = await db.Supplier.create(req.body);
  
    return res.status(200).json({
      message: "Thêm nhà cung cấp mới thành công",
      data: supplier,
    });
  },
  
  updateSupplier : async (req, res) => {
    const {id} = req.params;
    const {supplierName} = req.body;
  
    const supplier = await db.Supplier.findByPk(id);
  
    if (!supplier){
      return res.status(404).json({
        message: "không tìm thấy nhà cung cấp"
      })
    }
    
    if (supplierName) {
      const existed = await db.Supplier.findOne({
        where: {
          supplierName
        }
      })
    
      if (existed && existed.supplierId !== supplier.supplierId) {
        return res.status(409).json({
          message: "nhà cung cấp đã tồn tại"
        })
      }
      
    }
  
    await supplier.update(req.body);
  
    return res.status(200).json({
      message: "Cập nhật nhà cung cấp thành công",
      data: supplier
    });
  },
  
  deleteSupplier : async (req, res) => {
    const {id} = req.params;
  
    const supplier = await db.Supplier.findByPk(id);
  
    if (!supplier) {
      return res.status(404).json({
        message: "không tìm thấy nhà cung cấp"
      })
    }
  
    await supplier.destroy();
  
    return res.status(200).json({
      message: "Xóa nhà cung cấp thành công",
    });
  }
}

module.exports = supplierControllers;
