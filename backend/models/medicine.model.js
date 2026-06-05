const { Model, DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

class Medicine extends Model {
  static associate(models) {
    Medicine.hasOne(models.UsageInstruction, {
      foreignKey: "medicineId",
      as: "usageInstruction",
    });

    Medicine.hasMany(models.Batch, {
      foreignKey: "medicineId",
      as: "batchInfo",
    });

    Medicine.hasMany(models.MedicineIngredientDetail, {
      foreignKey: "medicineId",
      as: "ingredientDetailInfo",
    });

    Medicine.belongsToMany(models.MedicineGroup, {
      through: "medicine_group_medicines",
      foreignKey: "medicineId",
      otherKey: "groupId",
      as: "medicineGroupInfo",
    });
  }
}

Medicine.init(
  {
    medicineId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      field: "medicine_id",
    },
    medicineCode: {
      type: DataTypes.STRING(50),
      allowNull: false,
      unique: true,
      field: "medicine_code",
    },
    brandName: {
      type: DataTypes.STRING(100),
      allowNull: false,
      field: "brand_name",
    },
    imageUrl: {
      type: DataTypes.TEXT,
      field: "image_url",
    },
    origin: {
      type: DataTypes.STRING(50),
    },
    status: {
      type: DataTypes.ENUM("đang cung cấp", "ngừng cung cấp", "hết hàng"),
      defaultValue: "đang cung cấp",
      allowNull: false,
    },
    price: {
      type: DataTypes.DECIMAL(12, 2),
      allowNull: false,
      validate: {
        min: 0,
      },
    },
    registrationNumber: {
      type: DataTypes.STRING(50),
      allowNull: false,
      unique: true,
      field: "registration_number",
    },
    unit: {
      type: DataTypes.ENUM(
        "Viên",
        "Vỉ",
        "Hộp",
        "Chai",
        "Lọ",
        "Tuýp",
        "Gói",
        "Ống",
        "Bình xịt",
        "Miếng dán",
      ),
      allowNull: false,
    },
    // groupId: {
    //   type: DataTypes.INTEGER,
    //   references: {
    //     model: "medicine_groups",
    //     key: "group_id", //tên cột trong database
    //   },
    //   onUpdate: "CASCADE",
    //   onDelete: "SET NULL",
    //   field: "group_id",
    // },
  },
  {
    sequelize,
    modelName: "Medicine",
    tableName: "medicines",

    timestamps: true,
    paranoid: true,
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
  },
);

module.exports = Medicine;
