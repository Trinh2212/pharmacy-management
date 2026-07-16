const fs = require("fs");
const path = require("path");

const deleteFile = (relativeUrl) => {
  if (!relativeUrl) return;

  const filePath = path.join(process.cwd(), relativeUrl.replace(/^\//, ""));

  if (fs.existsSync(filePath)) {
    fs.unlinkSync(filePath);
  }
};

module.exports = { deleteFile };