require("dotenv").config();

const express = require("express");
const path =require("path");
const cors = require("cors");
const {sequelize, connectDB} = require("./config/database");

const medicineGroupRoute = require("./routes/medicine-group.route")
const medicineRoute = require("./routes/medicine.route");
const supplierRoute = require("./routes/supplier.route");
const activeIngredientRoute = require("./routes/active-ingredient.route");
const warehouseReceiptRoute = require("./routes/warehouse-receipt.route");
const batchRoute = require("./routes/batch.route");
const employeeRoute = require("./routes/employee.route");
const authRoute = require("./routes/auth.route");
const ocrRoute = require("./routes/ocr.route");

const app = express();

app.use(cors());
app.use(express.json());
app.use("/uploads", express.static(path.join(__dirname, "uploads")));
connectDB();

app.use("/api/auth", authRoute)
app.use("/api/medicine-groups", medicineGroupRoute);
app.use("/api/medicines", medicineRoute);
app.use("/api/suppliers", supplierRoute);
app.use("/api/active-ingredients", activeIngredientRoute);
app.use("/api/warehouse-receipts", warehouseReceiptRoute);
app.use("/api/batches", batchRoute);
app.use("/api/employees", employeeRoute);
app.use("/api/ocr", ocrRoute);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`);
});

