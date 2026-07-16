require("dotenv").config();

const bcrypt = require("bcrypt");
const db = require("./models/index.model");

const ADMIN_EMAIL = "admin@pharmacy.com";
const ADMIN_PASSWORD = "adminmin@123";

async function createAdmin() {
  try {
    await db.sequelize.authenticate();

    console.log("Kết nối database thành công");

    const existingAdmin = await db.Employee.findOne({
      where: {
        email: ADMIN_EMAIL,
      },
    });

    if (existingAdmin) {
      console.log(
        `Tài khoản ${ADMIN_EMAIL} đã tồn tại (role: ${existingAdmin.role})`,
      );

      if (existingAdmin.role !== "admin") {
        await existingAdmin.update({
          role: "admin",
          isLocked: false,
        });

        console.log("Đã thay đổi vai trò thành admin");
      } else {
        console.log("Tài khoản đã là admin");
      }
    } else {
      const hashedPassword = await bcrypt.hash(ADMIN_PASSWORD, 10);

      const employee = await db.Employee.create({
        employeeCode: "admin000",
        fullName: "System Administrator",
        phoneNumber: "0912345678",
        email: ADMIN_EMAIL,
        password: hashedPassword,
        role: "admin",
        isLocked: false,
      });

      console.log(
        `Tạo tài khoản admin thành công (ID: ${employee.employeeId})`,
      );
    }

    console.log(`Email    : ${ADMIN_EMAIL}`);
    console.log(`Password : ${ADMIN_PASSWORD}`);
    console.log(`Role     : admin`);
  } catch (error) {
    console.error("Lỗi:", error);
  } finally {
    await db.sequelize.close();
    console.log("Đã đóng kết nối database");

    process.exit(0);
  }
}

createAdmin();