const { Model, DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

class Employee extends Model {
  static associate(models) {
    Employee.hasMany(models.WarehouseReceipt, {
      foreignKey: "employeeId",
    });
  }
}

Employee.init(
  {
    employeeId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: "id",
    },
    employeeCode: {
      type: DataTypes.STRING(10),
      allowNull: false,
      unique: true,
      field: "employee_code",
    },
    fullName: {
      type: DataTypes.STRING(50),
      allowNull: false,
      field: "full_name",
    },
    dob: {
      type: DataTypes.DATEONLY,
    },
    gender: {
      type: DataTypes.ENUM("nam", "nữ", "khác"),
      allowNull: false,
      defaultValue: "khác",
    },
    address: {
      type: DataTypes.STRING(100),
    },
    phoneNumber: {
      type: DataTypes.STRING(10),
      allowNull: false,
      unique: true,
      field: "phone_number",
    },
    email: {
      type: DataTypes.STRING(100),
      allowNull: false,
      unique: true,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    avatarUrl: {
      type: DataTypes.TEXT,
      field: "avatar_url",
    },
    role: {
      type: DataTypes.ENUM("admin", "employee"),
      allowNull: false,
      defaultValue: "employee",
    },
    status: {
      type: DataTypes.ENUM("active", "locked"),
      allowNull: false,
      defaultValue: "active",
    },
    hireDate: {
      type: DataTypes.DATEONLY,
      field: "hire_date",
    },
  },
  {
    sequelize,
    modelName: "Employee",
    tableName: "employees",

    paranoid: true,
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
  },
);

module.exports = Employee;
