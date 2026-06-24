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