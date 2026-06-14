const {sequelize} = require("../config/database");

const employee = require("./employee.model");
const activeIngredient = require("./active-ingredient.model");
const batch = require("./batch.model");
const medicineGroup = require("./medicine-group.model");
const medicine = require("./medicine.model");
const medicineIngredientDetail = require("./medicine-ingredient-detail.model");
const supplier = require("./supplier.model");
const usageInstruction = require("./usage-instruction.model");
const warehouseReceipt = require("./warehouse-receipt.model");
const warehouseReceiptDetail = require("./warehouse-receipt-detail.model");

const models = {
  Employee: employee,
  ActiveIngredient: activeIngredient,
  Batch: batch,
  MedicineGroup: medicineGroup,
  Medicine: medicine,
  MedicineIngredientDetail: medicineIngredientDetail,
  Supplier: supplier,
  UsageInstruction: usageInstruction,
  WarehouseReceipt: warehouseReceipt,
  WarehouseReceiptDetail: warehouseReceiptDetail,
};

Object.keys(models).forEach((modelName) => {
    if (models[modelName].associate){
        models[modelName].associate(models);
    }
})
models.sequelize = sequelize;

module.exports = models;