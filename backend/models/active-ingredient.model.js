const { Model, DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

class ActiveIngredient extends Model {}

ActiveIngredient.init(
  {
    ingredientId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      field: "ingredient_id",
    },
    ingredientName: {
      type: DataTypes.STRING(100),
      allowNull: false,
      field: "ingredient_name",
    },
  },
  {
    sequelize,
    modelName: "ActiveIngredient",
    tableName: "active_ingredients",

    paranoid: true,
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
  },
);
module.exports = ActiveIngredient;
