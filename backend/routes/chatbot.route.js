const express = require("express");
const router = express.Router();
const chatbotController = require("../controllers/chatbot.controller");
const asyncHandler = require("../middlewares/asyncHandler");

router.post("/", asyncHandler(chatbotController.chat));

module.exports = router;
