const { ocrMedicine } = require("../service/ocr");

const extractMedicineInfo = async (req, res) => {
  if (!req.file) {
    return res.status(400).json({ error: "Không tìm thấy ảnh. " });
  }

  const result = await ocrMedicine(
    req.file.path,
    req.file.originalname,
    req.file.mimetype,
  );
  console.log(result);

  return res.status(200).json({
    ...result,
    documentPath: req.file.path,
  });
};

module.exports = { extractMedicineInfo };
