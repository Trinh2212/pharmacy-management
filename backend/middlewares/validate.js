const validate = (schema, source = "body") => {
  return (req, res, next) => {
    const { error, value } = schema.validate(req[source], {
      abortEarly: false,
      convert: true, 
      stripUnknown: true,
    });

    if (error) {
      const customMessage = error.details[0].message;
      return res.status(400).json({
        message: customMessage,
        error: customMessage,
        // message: "lỗi phía client, dữ liệu chưa hợp lệ",
        // error: error.details[0].message,
      });
    }

    req[source] = value;
    next();
  };
};

module.exports = validate;