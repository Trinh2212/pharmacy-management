const { Model, DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

class Employee extends Model {
  static associate(models) {
    Employee.hasOne(models.Account, {
      foreignKey: "employeeId",
      as: "accountInfo",
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
    },
    address: {
      type: DataTypes.STRING(100),
    },
    phoneNumber: {
      type: DataTypes.STRING(10),
      allowNull: false,
      field: "phone_number",
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
