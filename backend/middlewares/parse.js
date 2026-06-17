const parseMedicineData = (req, res, next) => {
  try {
    if (req.body.groupIds) {
      req.body.groupIds = JSON.parse(req.body.groupIds);
    }

    if (req.body.ingredients) {
      req.body.ingredients = JSON.parse(req.body.ingredients);
    }

    if (req.body.usageData) {
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