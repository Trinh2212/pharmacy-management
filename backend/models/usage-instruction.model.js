const { Model, DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

class UsageInstruction extends Model {
  static associate(models){
    UsageInstruction.belongsTo(models.Medicine, {
      foreignKey: "medicineId",
      as: "medicineInfo"
    });
  }
}

UsageInstruction.init(
  {
    instructionId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      field: "instruction_id",
    },
    medicineId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      unique: true,
      field: "medicine_id",
      references: {
        model: "medicines",
        key: "medicine_id",
      },
      onUpdate: "CASCADE",
      onDelete: "CASCADE",
    },
    dosageForm: {
      type: DataTypes.TEXT,
      field: "dosage_form",
    },
    packaging: {
      type: DataTypes.TEXT,
    },
    uses: {
      type: DataTypes.TEXT,
    },
    contraindications: {
      type: DataTypes.TEXT,
    },
    sideEffects: {
      type: DataTypes.TEXT,
      field: "side_effects",
    },
    dosageAdministration: {
      type: DataTypes.TEXT,
      field: "dosage_administration",
    },
    storageCondition: {
      type: DataTypes.TEXT,
      field: "storage_condition",
    },
    warning: {
      type: DataTypes.TEXT,
    },
    document: {
      type: DataTypes.TEXT,
    },
  },
  {
    sequelize,
    modelName: "UsageInstruction",
    tableName: "usage_instructions",

    timestamps: false,
  },
);
module.exports = UsageInstruction;
