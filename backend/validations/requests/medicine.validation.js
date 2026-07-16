const Joi = require("joi");

const medicineValidations = {
  createMedicine: Joi.object({
    medicineCode: Joi.string().max(50).required().messages({
      "string.base": "Mã thuốc không hợp lệ",
      "string.empty": "Vui lòng nhập mã thuốc",
      "string.max": "Mã thuốc không quá 50 ký tự",
      "any.required": "vui lòng nhập mã thuốc ",
    }),
    brandName: Joi.string().max(100).required().messages({
      "string.base": "Tên thuốc không hợp lệ",
      "string.empty": "Vui lòng nhập tên thuốc",
      "string.max": "Tên thuốc không quá 100 ký tự",
      "any.required": "vui lòng nhập tên thuốc",
    }),
    origin: Joi.string().max(50).allow(null, "").optional().messages({
      "string.base": "Xuất xứ không hợp lệ",
      "string.max": "Xuất xứ không quá 50 ký tự",
    }),
    status: Joi.string().valid("đang cung cấp", "ngừng cung cấp").messages({
      "string.base": "Trạng thái không hợp lệ",
      "any.only": "Trạng thái không hợp lệ",
    }),
    price: Joi.number().positive().precision(2).required().messages({
      "number.base": "Giá tiền không hợp lệ",
      "number.positive": "Giá tiền không hợp lệ",
      "any.required": "Vui lòng nhập giá tiền",
    }),
    registrationNumber: Joi.string().max(50).required().messages({
      "string.base": "Số đăng ký không hợp lệ",
      "string.empty": "Vui lòng nhập số đăng ký",
      "string.max": "Số đăng ký không quá 50 ký tự",
      "any.required": "vui lòng nhập số đăng ký",
    }),
    unit: Joi.string()
      .valid(
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
      )
      .messages({
        "string.base": "Đơn vị tính không hợp lệ",
        "any.only": "Đơn vị tính không hợp lệ",
      }),
    groupIds: Joi.array()
      .items(
        Joi.number().integer().messages({
          "number.base": "ID nhóm thuốc không hợp lệ",
          "number.integer": "ID nhóm thuốc không hợp lệ",
        }),
      )
      .min(1)
      .required()
      .messages({
        "array.base": "Nhóm thuốc không hợp lệ",
        "array.min": "Phải chọn ít nhất 1 nhóm thuốc",
        "any.required": "Vui lòng nhập nhóm thuốc",
      }),
    ingredients: Joi.array()
      .items(
        Joi.object({
          ingredientId: Joi.number().integer().required().messages({
            "number.base": "ID hoạt chất không hợp lệ",
            "number.integer": "ID hoạt chất không hợp lệ",
            "any.required": "Vui lòng nhập ID hoạt chất",
          }),
          strength: Joi.string().max(50).required().messages({
            "string.base": "Hàm lượng không hợp lệ",
            "string.empty": "Vui lòng nhập hàm lượng",
            "string.max": "Hàm lượng không quá 50 ký tự",
            "any.required": "vui lòng nhập hàm lượng",
          }),
        }),
      )
      .min(1)
      .required()
      .messages({
        "array.base": "Danh sách hoạt chất không hợp lệ",
        "array.min": "Phải có ít nhất 1 hoạt chất",
        "any.required": "Vui lòng nhập danh sách hoạt chất",
      }),
    usageData: Joi.object({
      dosageForm: Joi.string().messages({
        "string.base": "Dạng bào chế không hợp lệ",
      }),
      packaging: Joi.string().messages({
        "string.base": "Quy cách đóng gói không hợp lệ",
      }),
      uses: Joi.string().messages({
        "string.base": "Công dụng/Chỉ định không hợp lệ",
      }),
      contraindications: Joi.string().messages({
        "string.base": "Chống chỉ định không hợp lệ",
      }),
      sideEffects: Joi.string().messages({
        "string.base": "Tác dụng phụ không hợp lệ",
      }),
      dosageAdministration: Joi.string().messages({
        "string.base": "Liều dùng và cách dùng không hợp lệ",
      }),
      storageCondition: Joi.string().messages({
        "string.base": "Điều kiện bảo quản không hợp lệ",
      }),
      warning: Joi.string().messages({
        "string.base": "Cảnh báo không hợp lệ",
      }),
    }).messages({
      "object.base": "thông tin hướng dẫn sử dụng không hợp lệ",
    }),
    documentPath: Joi.string().messages({
      "string.base": "Đường dẫn tài liệu không hợp lệ",
    }),
  }).unknown(false),

  updateMedicine: Joi.object({
    medicineCode: Joi.string().max(50).messages({
      "string.base": "Mã thuốc không hợp lệ",
      "string.empty": "Vui lòng nhập mã thuốc",
      "string.max": "Mã thuốc không quá 50 ký tự",
    }),
    brandName: Joi.string().max(100).messages({
      "string.base": "Tên thuốc không hợp lệ",
      "string.empty": "Vui lòng nhập tên thuốc",
      "string.max": "Tên thuốc không quá 100 ký tự",
    }),
    origin: Joi.string().max(50).allow(null, "").messages({
      "string.base": "Xuất xứ không hợp lệ",
      "string.max": "Xuất xứ không quá 50 ký tự",
    }),
    price: Joi.number().positive().precision(2).messages({
      "number.base": "Giá tiền không hợp lệ",
      "number.positive": "Giá tiền không hợp lệ dương",
    }),
    registrationNumber: Joi.string().max(50).messages({
      "string.base": "Số đăng ký không hợp lệ",
      "string.empty": "Vui lòng nhập số đăng ký",
      "string.max": "Số đăng ký không quá 50 ký tự",
    }),
    status: Joi.string().valid("đang cung cấp", "ngừng cung cấp").messages({
      "string.base": "Trạng thái không hợp lệ",
      "any.only": "Trạng thái không hợp lệ",
    }),
    unit: Joi.string()
      .valid(
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
      )
      .messages({
        "string.base": "Đơn vị tính không hợp lệ",
        "any.only": "Đơn vị tính không hợp lệ",
      }),
    groupIds: Joi.array()
      .items(
        Joi.number().integer().messages({
          "number.base": "ID nhóm thuốc không hợp lệ",
          "number.integer": "ID nhóm thuốc không hợp lệ",
        }),
      )
      .messages({
        "array.base": "Nhóm thuốc không hợp lệ",
      }),
    ingredients: Joi.array()
      .items(
        Joi.object({
          ingredientId: Joi.number().integer().required().messages({
            "number.base": "ID hoạt chất không hợp lệ",
            "number.integer": "ID hoạt chất không hợp lệ",
            "any.required": "Vui lòng nhập ID hoạt chất",
          }),
          strength: Joi.string().max(50).required().messages({
            "string.base": "Hàm lượng không hợp lệ",
            "string.empty": "Vui lòng nhập hàm lượng",
            "string.max": "Hàm lượng không quá 50 ký tự",
            "any.required": "vui lòng nhập hàm lượng",
          }),
        }),
      )
      .messages({
        "array.base": "Danh sách hoạt chất không hợp lệ",
      }),
    usageData: Joi.object({
      dosageForm: Joi.string().max(100).messages({
        "string.base": "Dạng bào chế không hợp lệ",
        "string.max": "Dạng bào chế không quá 100 ký tự",
      }),
      packaging: Joi.string().messages({
        "string.base": "Quy cách đóng gói không hợp lệ",
      }),
      uses: Joi.string().messages({
        "string.base": "Công dụng/Chỉ định không hợp lệ",
      }),
      contraindications: Joi.string().messages({
        "string.base": "Chống chỉ định không hợp lệ",
      }),
      sideEffects: Joi.string().messages({
        "string.base": "Tác dụng phụ không hợp lệ",
      }),
      dosageAdministration: Joi.string().messages({
        "string.base": "Liều dùng và cách dùng không hợp lệ",
      }),
      storageCondition: Joi.string().messages({
        "string.base": "Điều kiện bảo quản không hợp lệ",
      }),
      warning: Joi.string().messages({
        "string.base": "Cảnh báo không hợp lệ",
      }),
    }).messages({
      "object.base": "thông tin hướng dẫn sử dụng không hợp lệ",
    }),
  }).unknown(false),

  changeStatus: Joi.object({
    status: Joi.string().valid("đang cung cấp", "ngừng cung cấp").messages({
      "string.base": "Trạng thái không hợp lệ",
      "any.only": "Trạng thái không hợp lệ",
    }),
  }).unknown(false),
};

module.exports = medicineValidations;