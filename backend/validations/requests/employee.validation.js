const Joi = require("joi");

const employeeValidations = {
  createByAdmin: Joi.object({
    fullName: Joi.string().trim().max(50).required(),
    phoneNumber: Joi.string()
      .pattern(/^[0-9]+$/)
      .length(10)
      .required(),
    email: Joi.string().email().max(100).required(),
    role: Joi.string().valid("employee", "admin"),
    password: Joi.string().max(255).required().min(8),
  }).unknown(false),

  updateByAdmin: Joi.object({
    fullName: Joi.string().trim().max(50),
    dob: Joi.date(),
    gender: Joi.string().valid("nam", "nữ", "khác"),
    address: Joi.string().max(100).allow(null, ""),
    phoneNumber: Joi.string()
      .pattern(/^[0-9]+$/)
      .length(10),
    email: Joi.string().email().max(100),
    password: Joi.string().max(255).min(8),
    role: Joi.string().valid("employee", "admin"),
    hireDate: Joi.date(),
  }).unknown(false),

  updateProfile: Joi.object({
    fullName: Joi.string().trim().max(50),
    dob: Joi.date(),
    gender: Joi.string().valid("nam", "nữ", "khác"),
    address: Joi.string().max(100).allow(null, ""),
    phoneNumber: Joi.string()
      .pattern(/^[0-9]+$/)
      .length(10),
    email: Joi.string().email().max(100),
    hireDate: Joi.date(),
  }).unknown(false),

  login: Joi.object({
    username: Joi.string().trim().required(),
    password: Joi.string().required(),
  }).unknown(false),

  changePassword: Joi.object({
    oldPassword: Joi.string().max(255).required().min(8),
    newPassword: Joi.string().max(255).required().min(8),
  }),
}; 

module.exports = employeeValidations;