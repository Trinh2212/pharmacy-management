const db = require("../models/index.model");
const { Op } = require("sequelize");
const ingredientControllers = {
  getActiveIngredient : async (req, res) => {
      const { search = "" } = req.query;
      const keyword = search.trim();
  
      let filter = {};
  
      if (keyword !== "") {
        filter = {
          ingredientName: {
            [Op.like]: `%${keyword}%`,
          },
        };
      }
  
      const ingredientList = await db.ActiveIngredient.findAll({
        where: filter,
        order: [["ingredientName", "ASC"]],
      });
  
    return res.status(200).json({
      message: "Lấy danh sách hoạt chất thành công",
      data: ingredientList
    });
  },
  
  getActiveIngredientById : async (req, res) => {
    const { id } = req.params;
  
    const ingredient = await db.ActiveIngredient.findByPk(id);
  
    if (!ingredient) {
      return res.status(404).json({
        message: "không tìm thấy hoạt chất",
      });
    }
  
    return res.status(200).json({
      message: "Lấy thông tin hoạt chất thành công",
      data: ingredient
    });
  },
  
  createActiveIngredient : async (req, res) => {
    const { ingredientName } = req.body;
  
    const existed = await db.ActiveIngredient.findOne({
      where: {
        ingredientName,
      },
    });
  
    if (existed) {
      return res.status(409).json({
        message: "hoạt chất đã tồn tại",
      });
    }
  
    const ingredient = await db.ActiveIngredient.create(req.body);
  
    return res.status(201).json({
      message: "Thêm hoạt chất mới thành công",
      data: ingredient,
    });
  },
  
  updateActiveIngredient : async (req, res) => {
    const { id } = req.params;
    const { ingredientName } = req.body;
  
    const ingredient = await db.ActiveIngredient.findByPk(id);
  
    if (!ingredient) {
      return res.status(404).json({
        message: "không tìm thấy hoạt chất",
      });
    }
  
    if (ingredientName) {
      const existed = await db.ActiveIngredient.findOne({
        where: {
          ingredientName,
        },
      });
  
      if (existed && existed.ingredientId !== ingredient.ingredientId) {
        return res.status(409).json({
          message: "hoạt chất đã tồn tại",
        });
      }
    }
  
    await ingredient.update(req.body);
  
    return res.status(200).json({
      message: "Cập nhật hoạt chất thành công",
      data: ingredient,
    });
  },
  
  deleteActiveIngredient : async (req, res) => {
    const { id } = req.params;
  
    const ingredient = await db.ActiveIngredient.findByPk(id);
  
    if (!ingredient) {
      return res.status(404).json({
        message: "không tìm thấy hoạt chất",
      });
    }
  
    await ingredient.destroy();
  
    return res.status(200).json({
      message: "Xóa hoạt chất thành công",
      data: ingredient
    });
  }
}

module.exports = ingredientControllers;
