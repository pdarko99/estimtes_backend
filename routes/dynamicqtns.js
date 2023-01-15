const express = require("express");
let questionRouter = express.Router();

const questionController = require("../controller/dynamicqtn");

function Router() {
  questionRouter.route("/service/:serviceId").get(questionController.getQtns);

  return questionRouter;
}

module.exports = Router();
