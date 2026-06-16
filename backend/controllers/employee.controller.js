require("dotenv").config();
const {sequelize} = require("../config/database");
const db = require("../models/index.model");
const bcrypt = require("bcrypt")
const fs = require("fs");
const path = require("path");

const employeeControllers = {
  getProfile: async (req, res) => {
    const employeeId = req.employee.employeeId;

    const employee = await db.Employee.findByPk(employeeId, {
      attributes: {
        exclude: ["password"],
      },
    });

    if (!employee) {
      return res.status(404).json({
        message: "không tìm thấy nhân viên",
      });
    }

    return res.status(200).json({
      employee,
    });
  },

  updateProfile: async (req, res) => {
    const employeeId = req.employee.employeeId;
    const employee = await db.Employee.findByPk(employeeId);
    if (!employee) {
      return res.status(404).json({
        message: "không tìm thấy nhân viên",
      });
    }
    const {fullName, dob, gender, address, phoneNumber, email, hireDate} = req.body;
    if (email && email != employee.email) {
      const existedEmail = await db.Employee.findOne({
        where: { email },
      });
      if (existedEmail) {
        return res.status(409).json({
          message: "email này đã tồn tại rồi",
        });
      }
    }
    if (phoneNumber && phoneNumber !== employee.phoneNumber) {
      const existed = await db.Employee.findOne({
        where: {
          phoneNumber,
        },
      });
      if (existed) {
        return res.status(409).json({
          message: "số điện thoại này đã tồn tại rồi",
        });
      }
    }
    const updateData = { fullName, phoneNumber, dob, gender, address, email, hireDate };
    if (req.file){
      if (employee.avatarUrl){
        const oldAvatar = path.join(
          process.cwd(),
          employee.avatarUrl.replace(/^\//, "")
        )

        if (fs.existsSync(oldAvatar)) {
          fs.unlinkSync(oldAvatar);
        }
      }
      updateData.avatarUrl = `/uploads/avatars/${req.file.filename}`;
    }

    await employee.update(updateData);
    const employeeData = employee.toJSON();

    delete employeeData.password;

    return res.status(200).json({
      message: "cập nhật profile thành công",
      employee: employeeData,
    });
  },

  getAllEmployees: async (req, res ) => {
    const {search = ""} = req.query;
    
    const keyword = search.trim();

    let filter = {};

    if (keyword !== "") {
      filter = {
        [Op.or]: [
          {fullName: {[Op.like]: `%${keyword}%`}},
          {employeeCode: {[Op.like]: `%${keyword}%`}}
        ]
      }
    }

    const employeeList = await db.Employee.findAll({
      attributes: {
        exclude: ["password"]
      },
      where: filter,
      order: [["employeeCode", "ASC"]]
    })

    return res.status(200).json({
      message: "lấy danh sách nhân viên thành công",
      data: employeeList
    })
  },

  createEmployeeByAdmin: async (req, res) => {
    const {fullName, phoneNumber, email, password} = req.body;

    const existedEmail = await db.Employee.findOne({
      where: { email },
    });

    if (existedEmail) {
      return res.status(409).json({
        message: "email này đã tồn tại rồi",
      });
    }

    const existed = await db.Employee.findOne({
      where: {
        phoneNumber,
      },
    });
    if (existed) {
      return res.status(409).json({
        message: "số điện thoại này đã tồn tại rồi",
      });
    }
    // sinh mã nhân viên tự động theo mã cuối cùng 
    const lastEmployee = await db.Employee.findOne({
      order: [["employeeId", "DESC"]],
    })
    const nextCode = lastEmployee ? lastEmployee.employeeId + 1 : 1;
    const employeeCode = "NV" + String(nextCode).padStart(3, "0");

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const employee = await db.Employee.create({
      employeeCode,
      fullName,
      phoneNumber,
      email,
      password: hashedPassword,
    })

    const employeeData = employee.toJSON();
    delete employeeData.password;

    return res.status(201).json({
      message: "tạo nhân viên thành công",
      employee: employeeData
    })
  },
// bởi admin có thể sửa đc all nv và all info liên quan, khác với bên chính họ thì không bao gồm role
  updateEmployeeByAdmin: async (req, res) => {
    const {id} = req.params;
    const updateData = req.body;

    const employee = await db.Employee.findByPk(id);

    if (!employee) {
      return res.status(404).json({
        message: "không tìm thấy nhân viên"
      })
    }

    if (updateData.email && updateData.email !== employee.email) {
      const existedEmail = await db.Employee.findOne({
        where: {
          email: updateData.email
        }
      })
      if (existedEmail) {
        return res.status(409).json({
          message: "email đã tồn tại"
        })
      }
    }

    if (updateData.phoneNumber && updateData.phoneNumber !== employee.phoneNumber) {
      const existed = await db.Employee.findOne({
        where: {
          phoneNumber: updateData.phoneNumber,
        },
      });
      if (existed) {
        return res.status(409).json({
          message: "sdt đã tồn tại",
        });
      }
    }

    if(updateData.password) {
      updateData.password = await bcrypt.hash(updateData.password, 10)
    }

    await employee.update(updateData);

    const employeeData = employee.toJSON();

    delete employeeData.password;

    return res.status(200).json({
      message: "cập nhật nhân viên thành công",
      data: employeeData,
    })
  },

  deleteEmployee: async (req, res) => {
    const {id} = req.params;
    const employee = await db.Employee.findByPk(id);

    if (!employee) {
      return res.status(404).json(
        "không tìm thấy tài khoản nhân viên"
      )
    }

    if (employee.role === 'admin')
      return res.status(403).json("không thể xóa tài khoản admin được");

    await employee.destroy();

    return res.status(200).json({
      message: "đã xóa tài khoản thành công"
    })
  },

  toggleLock : async (req, res) => {
    const employee = await db.Employee.findByPk(req.params.id);

    if (!employee) return res.status(404).json("không tìm thấy tài khoản");

    if (employee.role === "admin") 
      return res.status(403).json("không thể khóa admin nè")
    employee.isLocked = !employee.isLocked;
    await employee.save();

    return res.status(200).json({
      message: employee.isLocked ? "tài khoản đã bị khóa rồi" : "tài khoản đã được mở khóa"
    });
  },

  changePassword: async(req, res) => {
    const { oldPassword, newPassword } = req.body;
    const employee = await db.Employee.findByPk(req.employee.employeeId);
    const validPassword = await bcrypt.compare(oldPassword, employee.password);
    if (!validPassword)
      return res.status(400).json("mật khẩu cũ không đúng, nhớ lại coi");
    const salt = await bcrypt.genSalt(10);
    const hashedNewPassword = await bcrypt.hash(newPassword, salt);
    employee.password = hashedNewPassword;
    await employee.save();
    return res.status(200).json("đã đổi mật khẩu thành công");
  }
};


module.exports = employeeControllers;
