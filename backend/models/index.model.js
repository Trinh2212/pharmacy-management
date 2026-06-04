const Employee = require("./employee.model");
const Account = require("./account.model");

const models = {Employee, Account};

Object.keys(models).forEach((modelName) => {
    if (models[modelName].associate){
        models[modelName].associate(models);
    }
})