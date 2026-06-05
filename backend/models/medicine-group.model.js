const { DataTypes, Model } = require("sequelize");
const { sequelize } = require("../config/database");

class MedicineGroup extends Model {
  static associate(models) {
    MedicineGroup.belongsToMany(models.Medicine, {
      through: "medicine_group_medicines",
      foreignKey: "groupId",
      otherKey: "medicineId",
      as: "medicineInfo",
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
