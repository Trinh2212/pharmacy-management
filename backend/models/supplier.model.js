const { DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/database");

class Supplier extends Model {}

Supplier.init(
  {
    supplierId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      field: "supplier_id",
    },
    supplierName: {
      type: DataTypes.STRING(50),
      allowNull: false,
      field: "supplier_name",
    },
    address: {
      type: DataTypes.STRING,
    },
    email: {
      type: DataTypes.STRING(100),
    },
    phoneNumber: {
      type: DataTypes.STRING(10),
      field: "phone_number",
    },
  },
  {
    sequelize,
    modelName: "Supplier",
    tableName: "suppliers",

    paranoid: true,
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
  },
);

module.exports = Supplier;
