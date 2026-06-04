const { Model, DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

class Account extends Model {
  static associate(models) {
    Account.belongsTo(models.Employee, {
      foreignKey: "employeeId",
      as: "employeeInfo",
    });
  }
}

Account.init(
  {
    accountId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      field: "account_id",
    },
    userName: {
      type: DataTypes.STRING(100),
      allowNull: false,
      unique: true,
      field: "user_name",
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING(100),
      unique: true,
    },
    avatarUrl: {
      type: DataTypes.TEXT,
      field: "avatar_url",
    },
    role: {
      type: DataTypes.ENUM(
        "admin",
        "nhân viên kho",
        "nhân viên quản lý sản phẩm",
      ),
      allowNull: false,
      defaultValue: "nhân viên quản lý sản phẩm",
    },
    status: {
      type: DataTypes.ENUM("hoạt động", "bị khóa"),
      allowNull: false,
      defaultValue: "hoạt động",
    },
    employeeId: {
      type: DataTypes.INTEGER,
      unique: true,
      allowNull: false,
      field: "id",
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
    modelName: "Account",
    tableName: "accounts",

    paranoid: true,
    timestamps: true,
    createdAt: "created_at",
    updatedAt: "updated_at",
    deletedAt: "deleted_at",
  },
);

module.exports = Account;
