# CareMind Pharma — Web Quản Lý Nhà Thuốc Trực Tuyến Tích Hợp Chatbot AI

**Niên luận cơ sở ngành Khoa học Máy tính — Trường Công nghệ Thông tin & Truyền thông, Đại học Cần Thơ**

| | |
|---|---|
| **Đề tài** | Web quản lý nhà thuốc trực tuyến tích hợp chatbot hỗ trợ tra cứu thông tin sử dụng thuốc |
| **Sinh viên thực hiện** | Ung Ngọc Diễm Trinh — MSSV: B2308397 |
| **Khóa** | 49 |
| **GVHD** | TS. Trần Nguyễn Minh Thư |

---

## 1. Giới thiệu

Trong bối cảnh chuyển đổi số ngày càng mạnh mẽ trong lĩnh vực y tế, nhu cầu quản lý và tra cứu thông tin dược phẩm một cách nhanh chóng, chính xác đang trở thành yêu cầu cấp thiết. Thực tế cho thấy nhiều nhà thuốc vẫn quản lý dữ liệu thủ công, trong khi các nền tảng trực tuyến hiện có (Long Châu, An Khang...) tuy đã số hóa danh mục thuốc nhưng phần tra cứu hướng dẫn sử dụng vẫn ở dạng văn bản tĩnh, dài, buộc người dùng phải tự đọc để tìm thông tin họ cần; phần hỏi đáp trực tiếp lại phụ thuộc vào dược sĩ và bị giới hạn theo khung giờ làm việc.

**CareMind Pharma** được xây dựng nhằm giải quyết những hạn chế trên bằng cách kết hợp:

- Một hệ thống quản lý nghiệp vụ nhà thuốc đầy đủ (danh mục thuốc, kho, lô hàng, nhà cung cấp, nhân viên, phân quyền).
- Một **chatbot AI (CareMind)** ứng dụng kỹ thuật **RAG (Retrieval-Augmented Generation)** giúp người dùng tra cứu, hỏi đáp và tóm tắt thông tin thuốc bằng ngôn ngữ tự nhiên, hoạt động 24/7 mà không phụ thuộc vào giờ làm việc của nhân viên.
- Một dịch vụ **OCR** dựa trên mô hình thị giác – ngôn ngữ, giúp tự động trích xuất thông tin từ ảnh tờ hướng dẫn sử dụng thuốc, hỗ trợ quá trình nhập liệu.

> **Lưu ý về phạm vi:** Chatbot chỉ đóng vai trò hỗ trợ tra cứu thông tin dựa trên dữ liệu sẵn có của hệ thống, **không** thực hiện tư vấn y tế, chẩn đoán bệnh hay kê đơn thuốc, và không thay thế vai trò của bác sĩ/dược sĩ.

### Mục tiêu đề tài

Xây dựng một website quản lý nhà thuốc trực tuyến đáp ứng các nghiệp vụ cơ bản (danh mục thuốc, nhập kho, lô thuốc, nhà cung cấp, hoạt chất, nhóm thuốc, nhân viên), đồng thời tích hợp trợ lý ảo hỗ trợ tìm kiếm — tra cứu thông tin thuốc và ứng dụng công nghệ OCR để tự động nhận dạng, trích xuất thông tin hướng dẫn sử dụng thuốc từ hình ảnh.

### Kết quả đạt được (dữ liệu thử nghiệm)

70 loại thuốc · 8 nhóm thuốc · 79 hoạt chất, cùng chatbot tra cứu bằng ngôn ngữ tự nhiên và luồng trích xuất thông tin hướng dẫn sử dụng từ hình ảnh.

---

## 2. Tính năng chính

### Đối với Khách hàng
- Tra cứu, tìm kiếm thuốc theo tên; lọc theo nhóm thuốc.
- Xem danh sách thuốc, danh sách hoạt chất.
- Xem chi tiết thuốc: thông tin cơ bản, hoạt chất & hàm lượng, nhóm thuốc, hướng dẫn sử dụng đầy đủ (dạng bào chế, quy cách đóng gói, công dụng, liều dùng, chống chỉ định, tác dụng phụ, cảnh báo, bảo quản...).
- Gửi yêu cầu tư vấn qua email liên hệ.
- Tương tác trực tiếp với **chatbot CareMind** ngay trên giao diện để đặt câu hỏi, tra cứu nhanh và tóm tắt hướng dẫn sử dụng.

### Đối với Nhân viên
- Quản lý danh mục: thuốc, nhóm thuốc, hoạt chất.
- Quản lý nhập kho và lô thuốc: lập/theo dõi phiếu nhập, số lượng tồn, hạn sử dụng theo từng lô.
- Quản lý nhà cung cấp.
- Thống kê trực quan: số lượng thuốc, cảnh báo tồn kho, thuốc sắp/đã hết hạn, chi phí nhập theo tháng.
- Quản lý hồ sơ cá nhân, đổi mật khẩu.
- Khi thêm/cập nhật thuốc, có thể tải ảnh tờ hướng dẫn sử dụng để hệ thống tự động trích xuất nội dung bằng OCR.

### Đối với Quản trị viên (Admin)
- Kế thừa toàn bộ quyền của Nhân viên.
- Quản lý tài khoản nhân viên: tạo mới, cập nhật, phân quyền, khóa/mở khóa, xóa tài khoản.

---

## 3. Chatbot AI — CareMind

Chatbot ứng dụng kỹ thuật **RAG** kết hợp **Function Calling** để trả lời dựa trên dữ liệu thực tế của hệ thống thay vì tự sinh thông tin:

| Thành phần | Mô tả |
|---|---|
| **LLM** | OpenAI GPT-OSS-120B, gọi qua API Groq (tốc độ suy luận nhanh) |
| **Embedding** | `Xenova/all-MiniLM-L6-v2` (thư viện `@xenova/transformers`, chạy trực tiếp trên Node.js) |
| **Tìm kiếm ngữ nghĩa** | Cosine similarity giữa vector câu hỏi và vector thuốc, ngưỡng liên quan `relevanceScore ≥ 0.75`, có cơ chế fuzzy search (SQL `LIKE`) dự phòng |
| **Bộ công cụ (Tools)** | `search_medicine`, `get_medicine_details`, `get_usage_instructions`, `search_ingredient` |
| **Quản lý ngữ cảnh** | Lưu tối đa 6 lượt hội thoại gần nhất kèm system prompt (vai trò, quy tắc an toàn, phạm vi) |
| **Xử lý song song** | `Promise.all` khi cần gọi nhiều tool cùng lúc để giảm độ trễ |

Quy trình: người dùng đặt câu hỏi → AI phân tích ý định → nếu cần dữ liệu, chọn và gọi tool phù hợp → kết quả JSON được đưa trở lại LLM cùng lịch sử hội thoại → sinh câu trả lời tự nhiên gửi cho người dùng.

---

## 4. Dịch vụ OCR trích xuất hướng dẫn sử dụng thuốc

- **Mô hình:** Vintern-1B-v3_5 (mô hình thị giác – ngôn ngữ mã nguồn mở, `5CD-AI/Vintern-1B-v3_5` trên Hugging Face).
- **Triển khai:** độc lập trên Google Colab (do yêu cầu GPU), expose ra ngoài qua Ngrok để Backend gọi API.
- **Luồng xử lý:** ảnh được chuẩn hóa và chia lưới (dynamic tiling) → mô hình suy luận sinh JSON gồm 8 trường (`dosage_form`, `packaging`, `uses`, `contraindications`, `side_effects`, `dosage_administration`, `storage_condition`, `warning`) → hậu xử lý, ánh xạ vào biểu mẫu để nhân viên kiểm tra, chỉnh sửa trước khi lưu.
- **Giới hạn đã ghi nhận khi kiểm thử:** mô hình nhận diện tốt phần lớn nội dung chữ in, nhưng việc ánh xạ đúng ngữ nghĩa vào từng trường dữ liệu (ví dụ phân biệt "công dụng" và "cách dùng") đôi khi chưa ổn định; kết quả không xác định được sẽ trả về `null` thay vì gán sai. Vì vậy OCR đóng vai trò **hỗ trợ nhập liệu**, không tự động lưu vào cơ sở dữ liệu khi chưa có xác nhận của người dùng.

---

## 5. Kiến trúc & Công nghệ sử dụng

Hệ thống được thiết kế theo mô hình **Client – Server**.

### Frontend
- **React (Vite)** — kiến trúc component-based, Virtual DOM tối ưu re-render.
- **React Router DOM** — điều hướng.
- **Axios** — giao tiếp API.
- **Tailwind CSS** — utility-first, hỗ trợ responsive.
- **Recharts** — biểu đồ thống kê.
- **SweetAlert2**, **React Icons**, **@emailjs/browser**.

### Backend
- **Node.js + Express.js** — RESTful API, xử lý bất đồng bộ.
- **Sequelize (ORM)** — ánh xạ và quản lý quan hệ dữ liệu MySQL.
- **JWT** — xác thực, phân quyền.
- **bcrypt** — băm mật khẩu.
- **Joi** — kiểm duyệt dữ liệu đầu vào.
- **Multer** — xử lý upload file (ảnh sản phẩm, ảnh HDSD).

### Cơ sở dữ liệu
- **MySQL** — đảm bảo tính chất ACID; các bảng chính: `medicines`, `medicine_groups`, `active_ingredients`, `medicine_ingredient_details`, `usage_instructions`, `suppliers`, `employees`, `batches`, `warehouse_receipts`, `warehouse_receipt_details`.

### AI / Machine Learning
- **Groq SDK** — gọi mô hình OpenAI GPT-OSS-120B.
- **@xenova/transformers** — sinh embedding cục bộ (không cần gọi API ngoài).
- **Vintern-1B-v3_5** — mô hình OCR đa phương thức, triển khai qua Google Colab + Ngrok.

### Công cụ hỗ trợ phát triển
Visual Studio Code, Nodemon, Git, Postman, MySQL Workbench.

---

## 6. Yêu cầu hệ thống

Trước khi cài đặt, đảm bảo đã có:

- [Node.js](https://nodejs.org/) (khuyến nghị v18 hoặc v20)
- [MySQL Server](https://dev.mysql.com/downloads/mysql/)

---

## 7. Hướng dẫn cài đặt và chạy dự án

### 7.1. Clone repository

```bash
git clone <đường_dẫn_repository_của_bạn>
cd Pharmacy-Management
```

### 7.2. Thiết lập cơ sở dữ liệu (Database)

1. Mở hệ quản trị MySQL (MySQL Workbench, phpMyAdmin, DBeaver...).
2. Tạo database mới hoặc import trực tiếp file cấu trúc:
   - Import `database/pharmacy-management.sql` để tạo các bảng.
   - (Tùy chọn) Import `database/data_test.sql` nếu muốn có dữ liệu mẫu để test.

### 7.3. Cài đặt và chạy Backend

```bash
cd backend
npm install
```

Tạo file `.env` trong thư mục `backend` (có thể copy từ `.env.example`):

```env
PORT=5000
JWT_ACCESS_KEY=your_jwt_secret_key

# Kết nối database
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=pharmacy_management

# Environment
NODE_ENV=development

# OCR API & Chatbot API
OCR_API_URL=your_ocr_api_url_here
GROQ_API_KEY=your_groq_api_key_here
```

Khởi chạy server:

```bash
npm run dev
```

Backend chạy tại: `http://localhost:5000`

### 7.4. Cài đặt và chạy Frontend

Mở terminal mới:

```bash
cd frontend
npm install
npm run dev
```

Frontend chạy tại địa chỉ Vite cung cấp (thường là `http://localhost:5173`).

### 7.5. Đăng nhập (mặc định)

Nếu đã import `data_test.sql`, có thể đăng nhập bằng tài khoản admin có sẵn, hoặc tạo tài khoản admin mới:

```bash
node backend/createAdmin.js
```

---

## 8. Cấu trúc thư mục dự án

```text
Pharmacy-Management/
├── backend/                  # Mã nguồn Server (Node.js/Express)
│   ├── config/               # Cấu hình Database (Sequelize)
│   ├── controllers/          # Xử lý logic cho các API (Auth, Medicines, v.v.)
│   ├── middlewares/          # Xác thực (JWT), xử lý file (Multer)
│   ├── models/               # Định nghĩa schema các bảng MySQL
│   ├── routes/               # Khai báo các API endpoints
│   ├── service/              # Logic giao tiếp AI (Groq Chatbot, prompts, transformers)
│   ├── utils/                # Các hàm tiện ích dùng chung
│   ├── generateEmbedding.js  # Script tạo embedding vector cho các thuốc
│   └── server.js             # File khởi chạy backend
├── frontend/                 # Mã nguồn Client (React/Vite)
│   ├── public/               # Tài nguyên tĩnh
│   └── src/
│       ├── api/              # Cấu hình Axios và các lệnh gọi API
│       ├── components/       # Các component UI tái sử dụng
│       ├── contexts/         # Quản lý state toàn cục (React Context)
│       ├── layouts/          # Bố cục trang (Admin, Client)
│       ├── pages/            # Giao diện các trang (Dashboard, Profile, Login...)
│       ├── routes/           # Cấu hình định tuyến (React Router DOM)
│       └── utils/            # Các hàm hỗ trợ định dạng dữ liệu, v.v.
├── database/                 # Dữ liệu SQL
│   ├── data_test.sql         # File chứa dữ liệu mẫu để thử nghiệm (70+ loại thuốc)
│   └── pharmacy-management.sql # File cấu trúc bảng (schema)
└── ocr/                      # Thử nghiệm và mã nguồn liên quan đến OCR (Google Colab)
    └── heart.ipynb           # Notebook chứa quá trình chạy thử nghiệm/triển khai OCR
```
