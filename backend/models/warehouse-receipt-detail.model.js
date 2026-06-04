const { Model, DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

class WarehouseReceiptDetail extends Model {}

WarehouseReceiptDetail.init(
  {
    receiptId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      field: "receipt_id",
      references: {
        model: "warehouse_receipts",
        key: "receipt_id",
      },
      onUpdate: "CASCADE",
      onDelete: "CASCADE",
    },
    batchId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      field: "batch_id",
      references: {
        model: "batches",
        key: "batch_id",
      },
      onUpdate: "CASCADE",
      onDelete: "RESTRICT",
    },
    importQuantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
      field: "import_quantity",
      validate: {
        min: 1,
      },
    },
    importPrice: {
      type: DataTypes.DECIMAL(12, 2),
      allowNull: false,
      field: "import_price",
      validate: {
        min: 0,
      },
    },
  },
  {
    sequelize,
    modelName: "WarehouseReceiptDetail",
    tableName: "warehouse_receipt_details",
    timestamps: false,
  },
);

module.exports = WarehouseReceiptDetail;