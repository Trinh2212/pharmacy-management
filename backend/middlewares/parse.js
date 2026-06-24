// const parseMedicineData = (req, res, next) => {
//   try {
//     if (req.body.groupIds) {
//       req.body.groupIds = JSON.parse(req.body.groupIds);
//     }

//     if (req.body.ingredients) {
//       req.body.ingredients = JSON.parse(req.body.ingredients);
//     }

//     if (req.body.usageData) {
//       req.body.usageData = JSON.parse(req.body.usageData);
//     }

//     next();
//   } catch (error) {
//     return res.status(400).json({
//       message: "Dữ liệu JSON không hợp lệ",
//     });
//   }
// };
// module.exports = parseMedicineData;
// Middleware này xử lý 2 trường hợp gửi request khác nhau:
// 1. multipart/form-data (có upload ảnh kèm) -> các field object/array (groupIds, ingredients,
//    usageData) đến dưới dạng CHUỖI JSON (vì form-data không hỗ trợ kiểu lồng), cần JSON.parse.
// 2. application/json (gửi thẳng object) -> express.json() đã parse sẵn thành object/array thật,
//    không cần và không được JSON.parse lại (JSON.parse trên 1 array sẽ lỗi).
const parseMedicineData = (req, res, next) => {
  try {
    if (typeof req.body.groupIds === "string") {
      req.body.groupIds = JSON.parse(req.body.groupIds);
    }

    if (typeof req.body.ingredients === "string") {
      req.body.ingredients = JSON.parse(req.body.ingredients);
    }

    if (typeof req.body.usageData === "string") {
      req.body.usageData = JSON.parse(req.body.usageData);
    }

    next();
  } catch (error) {
    return res.status(400).json({
      message: "Dữ liệu JSON không hợp lệ",
    });
  }
};
module.exports = parseMedicineData;