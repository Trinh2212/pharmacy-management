require("dotenv").config();
const db = require("../models/index.model");
const { Op } = require("sequelize");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const authControllers = {
  login: async (req, res) => {
    const { username, password } = req.body;
    const employee = await db.Employee.findOne({
      where: {
        [Op.or]: [
          { employeeCode: username },
          { email: username },
          { phoneNumber: username },
        ],
      },
    });

    if (!employee) {
      return res.status(404).json({
        message: "tài khoản không tồn tại",
      });
    }

    if (employee.isLocked) {
      return res.status(403).json({
        message: "tài khoản của bạn đã bị khóa bởi admin rồi nhe",
      });
    }

    const isMatch = await bcrypt.compare( password, employee.password);
    if(!isMatch) {
        return res.status(400).json({
            message: "mật khẩu không chính xác",
            username,
        })
    }

    if (employee && isMatch) {
        const accessToken = jwt.sign({
            employeeId: employee.employeeId,
            role: employee.role,
        },
        process.env.JWT_ACCESS_KEY,
        {
            expiresIn: "4h",
        }
    );
    const employeeData = employee.toJSON();

    delete employeeData.password;

    return res.status(200).json({
        message: "đăng nhập thành công",
        employee: employeeData,
        accessToken
    });
    }
  },
};

module.exports = authControllers;
