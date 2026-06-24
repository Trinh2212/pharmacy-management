const axios = require("axios");
const FormData = require("form-data");
const fs = require("fs");

const ocrMedicine = async (filePath, fileName, mimeType) => {
  const formData = new FormData();
  formData.append("image", fs.readFileSync(filePath), {
    filename: fileName,
    contentType: mimeType,
  });

  const response = await axios.post(
    `${process.env.OCR_API_URL}/ocr/medicine`,
    formData,
    { headers: formData.getHeaders() },
  );

  return response.data;
};

module.exports = { ocrMedicine };
