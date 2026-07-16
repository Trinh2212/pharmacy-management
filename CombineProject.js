const fs = require("fs");
const path = require("path");

// 1. CẤU HÌNH BỘ LỌC
// Bỏ qua các thư mục chứa file rác, file build, hoặc thư viện nặng
const IGNORE_DIRS = [
  ".git",
  "node_modules",
  "dist",
  "build",
  ".vscode",
  "public",
  "uploads",
];
// Bỏ qua các file không mang ý nghĩa logic code
const IGNORE_FILES = [
  "package-lock.json",
  "yarn.lock",
  ".DS_Store",
  "combine_for_ai.js",
];
// Chỉ đọc nội dung của các file có đuôi này (bạn có thể thêm bớt tùy ý)
const ALLOWED_EXTENSIONS = [".js", ".vue", ".json", ".html", ".css", ".env.example"];

let treeStructure = "========================================\n";
treeStructure += "CẤU TRÚC THƯ MỤC DỰ ÁN\n";
treeStructure += "========================================\n\n";

let fileContents = "\n\n========================================\n";
fileContents += "CHI TIẾT MÃ NGUỒN CÁC FILE\n";
fileContents += "========================================\n";

// 2. HÀM QUÉT THƯ MỤC ĐỆ QUY
function processDirectory(dir, prefix = "") {
  const items = fs.readdirSync(dir);

  items.forEach((item, index) => {
    const fullPath = path.join(dir, item);
    const stats = fs.statSync(fullPath);
    const isLast = index === items.length - 1;
    const branch = isLast ? "└── " : "├── ";
    const nextPrefix = prefix + (isLast ? "    " : "│   ");

    if (stats.isDirectory()) {
      if (!IGNORE_DIRS.includes(item)) {
        // Thêm vào cây thư mục
        treeStructure += `${prefix}${branch}${item}/\n`;
        // Đệ quy quét tiếp thư mục con
        processDirectory(fullPath, nextPrefix);
      }
    } else {
      if (!IGNORE_FILES.includes(item)) {
        const ext = path.extname(item);

        // Thêm vào cây thư mục
        treeStructure += `${prefix}${branch}${item}\n`;

        // Đọc nội dung file nếu đúng định dạng cho phép
        if (ALLOWED_EXTENSIONS.includes(ext) || item === ".env") {
          try {
            const content = fs.readFileSync(fullPath, "utf8");
            const relativePath = path
              .relative(__dirname, fullPath)
              .replace(/\\/g, "/"); // Chuẩn hóa đường dẫn cho Win/Mac

            fileContents += `\n\n--- BẮT ĐẦU FILE: ${relativePath} ---\n\n`;
            fileContents += content;
            fileContents += `\n\n--- KẾT THÚC FILE: ${relativePath} ---\n`;
          } catch (err) {
            console.error(`Không thể đọc file: ${fullPath}`, err);
          }
        }
      }
    }
  });
}

// 3. THỰC THI VÀ XUẤT FILE
console.log("⏳ Đang quét dự án và tạo file cho AI...");
const rootDir = process.cwd();
processDirectory(rootDir);

const finalOutput = treeStructure + fileContents;
const outputFileName = "COMBINE_FOR_AI_Project.txt";

fs.writeFileSync(outputFileName, finalOutput);
console.log(
  `✅ Hoàn tất! Hãy gửi file "${outputFileName}" cho AI để bắt đầu làm việc.`,
);
