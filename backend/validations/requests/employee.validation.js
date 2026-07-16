const Joi = require("joi");

const employeeValidations = {
  createByAdmin: Joi.object({
    fullName: Joi.string().trim().max(50).required().messages({
      "string.base": "Họ tên không hợp lệ",
      "string.empty": "Vui lòng nhập họ tên",
      "string.max": "Họ tên không được vượt quá 50 ký tự",
      "any.required": "Vui lòng nhập họ tên",
    }),
    phoneNumber: Joi.string()
      .pattern(/^[0-9]+$/)
      .length(10)
      .required()
      .messages({
        "string.base": "Số điện thoại không hợp lệ",
        "string.empty": "Vui lòng nhập số điện thoại",
        "string.pattern.base": "Số điện thoại chỉ được chứa chữ số",
        "string.length": "Số điện thoại phải có đúng 10 chữ số",
        "any.required": "Vui lòng nhập số điện thoại",
      }),
    email: Joi.string().email().max(100).required().messages({
      "string.base": "Email không hợp lệ",
      "string.empty": "Vui lòng nhập email",
      "string.email": "Email không đúng định dạng",
      "string.max": "Email không được vượt quá 100 ký tự",
      "any.required": "Vui lòng nhập email",
    }),
    role: Joi.string().valid("employee", "admin").messages({
      "string.base": "Vai trò không hợp lệ",
      "any.only": "Vai trò không hợp lệ",
    }),
    password: Joi.string().max(255).required().min(8).messages({
      "string.base": "Mật khẩu không hợp lệ",
      "string.empty": "Vui lòng nhập mật khẩu",
      "string.min": "Mật khẩu phải có ít nhất 8 ký tự",
      "string.max": "Mật khẩu không được vượt quá 255 ký tự",
      "any.required": "Vui lòng nhập mật khẩu",
    }),
  }).unknown(false),

  updateByAdmin: Joi.object({
    fullName: Joi.string().trim().max(50).messages({
      "string.base": "Họ tên không hợp lệ",
      "string.empty": "Họ tên không được để trống",
      "string.max": "Họ tên không được vượt quá 50 ký tự",
    }),
    dob: Joi.date().allow(null, "").messages({
      "date.base": "Ngày sinh không hợp lệ",
    }),
    gender: Joi.string().valid("nam", "nữ", "khác").messages({
      "string.base": "Giới tính không hợp lệ",
      "any.only": "Giới tính không hợp lệ",
    }),
    address: Joi.string().max(100).allow(null, "").messages({
      "string.base": "Địa chỉ không hợp lệ",
      "string.max": "Địa chỉ không được vượt quá 100 ký tự",
    }),
    phoneNumber: Joi.string()
      .pattern(/^[0-9]+$/)
      .length(10)
      .messages({
        "string.base": "Số điện thoại không hợp lệ",
        "string.empty": "Số điện thoại không được để trống",
        "string.pattern.base": "Số điện thoại chỉ được chứa chữ số",
        "string.length": "Số điện thoại phải có đúng 10 chữ số",
      }),
    email: Joi.string().email().max(100).messages({
      "string.base": "Email không hợp lệ",
      "string.empty": "Email không được để trống",
      "string.email": "Email không đúng định dạng",
      "string.max": "Email không được vượt quá 100 ký tự",
    }),
    password: Joi.string().max(255).min(8).messages({
      "string.base": "Mật khẩu không hợp lệ",
      "string.empty": "Mật khẩu không được để trống",
      "string.min": "Mật khẩu phải có ít nhất 8 ký tự",
      "string.max": "Mật khẩu không được vượt quá 255 ký tự",
    }),
    role: Joi.string().valid("employee", "admin").messages({
      "string.base": "Vai trò không hợp lệ",
      "any.only": "Vai trò không hợp lệ",
    }),
    hireDate: Joi.date().allow(null, "").messages({
      "date.base": "Ngày vào làm không hợp lệ",
    }),
  }).unknown(false),

  updateProfile: Joi.object({
    fullName: Joi.string().trim().max(50).messages({
      "string.base": "Họ tên không hợp lệ",
      "string.empty": "Họ tên không được để trống",
      "string.max": "Họ tên không được vượt quá 50 ký tự",
    }),
    dob: Joi.date().allow(null, "").messages({
      "date.base": "Ngày sinh không hợp lệ",
    }),
    gender: Joi.string().valid("nam", "nữ", "khác").messages({
      "string.base": "Giới tính không hợp lệ",
      "any.only": "Giới tính không hợp lệ",
    }),
    address: Joi.string().max(100).allow(null, "").messages({
      "string.base": "Địa chỉ không hợp lệ",
      "string.max": "Địa chỉ không được vượt quá 100 ký tự",
    }),
    phoneNumber: Joi.string()
      .pattern(/^[0-9]+$/)
      .length(10)
      .messages({
        "string.base": "Số điện thoại không hợp lệ",
        "string.empty": "Số điện thoại không được để trống",
        "string.pattern.base": "Số điện thoại chỉ được chứa chữ số",
        "string.length": "Số điện thoại phải có đúng 10 chữ số",
      }),
    email: Joi.string().email().max(100).messages({
      "string.base": "Email không hợp lệ",
      "string.empty": "Email không được để trống",
      "string.email": "Email không đúng định dạng",
      "string.max": "Email không được vượt quá 100 ký tự",
    }),
  }).unknown(false),

  login: Joi.object({
    username: Joi.string().trim().required().messages({
      "string.base": "Tên đăng nhập không hợp lệ",
      "string.empty": "Vui lòng nhập tên đăng nhập",
      "any.required": "Vui lòng nhập tên đăng nhập",
    }),
    password: Joi.string().required().messages({
      "string.base": "Mật khẩu không hợp lệ",
      "string.empty": "Vui lòng nhập mật khẩu",
      "any.required": "Vui lòng nhập mật khẩu",
    }),
  }).unknown(false),

  changePassword: Joi.object({
    oldPassword: Joi.string().max(255).required().min(8).messages({
      "string.base": "Mật khẩu cũ không hợp lệ",
      "string.empty": "Vui lòng nhập mật khẩu cũ",
      "string.min": "Mật khẩu cũ phải có ít nhất 8 ký tự",
      "string.max": "Mật khẩu cũ không được vượt quá 255 ký tự",
      "any.required": "Vui lòng nhập mật khẩu cũ",
    }),
    newPassword: Joi.string().max(255).required().min(8).messages({
      "string.base": "Mật khẩu mới không hợp lệ",
      "string.empty": "Vui lòng nhập mật khẩu mới",
      "string.min": "Mật khẩu mới phải có ít nhất 8 ký tự",
      "string.max": "Mật khẩu mới không được vượt quá 255 ký tự",
      "any.required": "Vui lòng nhập mật khẩu mới",
    }),
  }),
};

module.exports = employeeValidations;