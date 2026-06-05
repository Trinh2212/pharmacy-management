const employee = require("./employee.model");
const account = require("./account.model");
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
  employee,
  account,
  activeIngredient,
  batch,
  medicineGroup,
  medicine,
  medicineIngredientDetail,
  supplier,
  usageInstruction,
  warehouseReceipt,
  warehouseReceiptDetail,
};

Object.keys(models).forEach((modelName) => {
    if (models[modelName].associate){
        models[modelName].associate(models);
    }
})
