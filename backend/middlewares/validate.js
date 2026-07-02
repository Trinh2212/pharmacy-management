const validate = (schema, source = "body") => {
  return (req, res, next) => {
    const { error, value } = schema.validate(req[source], {
      abortEarly: false,
      convert: true, // ép "1" → 1 cho id đến từ params/query (luôn là string)
      stripUnknown: true,
    });

    if (error) {
      return res.status(400).json({
        message: "lỗi phía client, dữ liệu chưa hợp lệ",
        error: error.details[0].message,
      });
    }

    // Gán lại value đã được Joi làm sạch (convert, trim) vào đúng source
    req[source] = value;
    next();
  };
};

module.exports = validate;