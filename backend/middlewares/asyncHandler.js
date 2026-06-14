require("dotenv").config();

const asyncHandler = (fn) => {
  return async (req, res, next) => {
    try {
      await fn(req, res, next);
    } catch (error) {
      return res.status(500).json({
        message: "lỗi server",
        error: process.env.NODE_ENV === "development" ? error.message : "", //tránh lộ db
      });
    }
  };
};
module.exports = asyncHandler;
// bắt các lỗi  chưa được xử lý ở controller 
