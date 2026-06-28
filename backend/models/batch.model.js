const { DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/database");

class Batch extends Model {
  static associate(models){
    Batch.belongsTo(models.Medicine, {
      foreignKey: "medicineId",
      as: "medicineInfo"
    });

    Batch.hasMany(models.WarehouseReceiptDetail, {
      foreignKey: "batchId",
      as: "detailInfo"
    });
  }
}

Batch.init(
  {
    batchId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: "batch_id",
    },
    medicineId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      field: "medicine_id",
      references: {
        model: "medicines",
        key: "medicine_id",
      },
      onUpdate: "CASCADE",
      onDelete: "RESTRICT",
    },
    batchNumber: {
      type: DataTypes.STRING(50),
      allowNull: false,
      field: "batch_number",
    },
    productionDate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
      field: "production_date",
    },
    expiryDate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
      field: "expiry_date",
    },
    stockQuantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
      field: "stock_quantity",
      defaultValue: 0,
      validate: {
        min: 0,
      },
    },
  },
  {
    sequelize,
    modelName: "Batch",
    tableName: "batches",

    paranoid: true,
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",

    indexes: [
      {
        name: "unique_med_batch",
        unique: true,
        fields: ["medicine_id", "batch_number"],
      },
    ],

    validate: {
      validateExpiryDate() {
        if (new Date(this.expiryDate) <= new Date(this.productionDate)) {
          throw new Error("expiry date must be after production date");
        }
      },
    },
  },
);

module.exports = Batch;
