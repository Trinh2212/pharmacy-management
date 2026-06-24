const { ocrMedicine } = require("../service/ocr");

const extractMedicineInfo = async (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ error: "Không tìm thấy ảnh" });
    }

    const result = await ocrMedicine(
      req.file.path,
      req.file.originalname,
      req.file.mimetype,
    );

    return res.status(200).json(result);
  } catch (error) {
    console.error("OCR error:", error.message);
    return res.status(500).json({ error: "Xử lý ảnh thất bại" });
  }
};

module.exports = { extractMedicineInfo };
