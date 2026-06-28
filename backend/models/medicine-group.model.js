const { DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/database");

class MedicineGroup extends Model {
  static associate(models) {
    MedicineGroup.belongsToMany(models.Medicine, {
      through: {
        model: "medicine_group_medicines",
        timestamps: false,
      },
      foreignKey: "groupId",
      otherKey: {
        name: "medicineId",
        field: "medicine_id",
      },
      as: "medicineInfo",
      timestamps: false,
    });
  }
}

MedicineGroup.init(
  {
    groupId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      field: "group_id",
    },
    groupName: {
      type: DataTypes.STRING(50),
      unique: true,
      allowNull: false,
      field: "group_name",
    },
    description: {
      type: DataTypes.STRING,
    },
  },
  {
    sequelize,
    modelName: "MedicineGroup",
    tableName: "medicine_groups",

    paranoid: true,
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
  },
);

module.exports = MedicineGroup;
