const { Model, DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

class MedicineIngredientDetail extends Model {
  static associate(models) {
    MedicineIngredientDetail.belongsTo(models.Medicine, {
      foreignKey: "medicineId",
      as: "medicineInfo",
    });

    MedicineIngredientDetail.belongsTo(models.ActiveIngredient, {
      foreignKey: "ingredientId",
      as: "ingredientInfo",
    });
  }
}

MedicineIngredientDetail.init(
  {
    medicineId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      field: "medicine_id",
      references: {
        model: "medicines",
        key: "medicine_id",
      },
      onUpdate: "CASCADE",
      onDelete: "CASCADE",
    },
    ingredientId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      field: "ingredient_id",
      references: {
        model: "active_ingredients",
        key: "ingredient_id",
      },
      onUpdate: "CASCADE",
      onDelete: "CASCADE",
    },
    strength: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
  },
  {
    sequelize,
    modelName: "MedicineIngredientDetail",
    tableName: "medicine_ingredient_details",

    timestamps: false,
  },
);
module.exports = MedicineIngredientDetail;