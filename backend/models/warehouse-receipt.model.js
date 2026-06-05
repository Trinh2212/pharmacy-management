const { Model, DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

class WarehouseReceipt extends Model {
  static associate(models){
    WarehouseReceipt.belongsTo(models.Employee, {
      foreignKey: "employeeId",
      as: "employeeInfo"
    });

    WarehouseReceipt.belongsTo(models.Supplier, {
      foreignKey: "supplierId",
      as: "supplierInfo"
    });

    WarehouseReceipt.hasMany(models.WarehouseReceiptDetail, {
      foreignKey: "receiptId",
      as: "detailInfo"
    });
  } 
}

WarehouseReceipt.init(
  {
    receiptId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      allowNull: false,
      field: "receipt_id",
    },
    receiptCode: {
      type: DataTypes.STRING(20),
      allowNull: false,
      unique: true,
      field: "receipt_code",
    },
    receiptDate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
      defaultValue: sequelize.literal("CURRENT_DATE"),
      field: "receipt_date",
    },
    totalPrice: {
      type: DataTypes.DECIMAL(15, 2),
      allowNull: false,
      defaultValue: 0,
      validate: {
        min: 0,
      },
      field: "total_price",
    },
    supplierId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      field: "supplier_id",
      references: {
        model: "suppliers",
        key: "supplier_id",
      },
      onUpdate: "CASCADE",
      onDelete: "RESTRICT",
    },
    employeeId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: "employee_id",
      references: {
        model: "employees",
        key: "id",
      },
      onUpdate: "CASCADE",
      onDelete: "RESTRICT",
    },
  },
  {
    sequelize,
    modelName: "WarehouseReceipt",
    tableName: "warehouse_receipts",
    timestamps: true,

    createdAt: "created_at",
    updatedAt: "updated_at",
  },
);

module.exports = WarehouseReceipt;
