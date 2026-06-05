require("dotenv").config();

const express = require("express");
const cors = require("cors");
const {sequelize, connectDB} = require("./config/database")
const medicineGroupRoute = require("./routes/medicine-group.route")
const app = express();

app.use(cors());
app.use(express.json());
connectDB();

app.use("/nhom-thuoc", medicineGroupRoute);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`);
});

