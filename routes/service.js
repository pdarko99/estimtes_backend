const express = require("express");
let serviceRouter = express.Router();

const serviceController = require("../controller/services");
const questionController = require("../controller/dynamicqtn");
const optionController = require("../controller/options");

function Router() {
  serviceRouter
    .route("/services/:serviceId?")
    .post(serviceController.createServices)
    .put(serviceController.updateService)
    .delete(serviceController.deleteService);
  serviceRouter
    .route("/questions/:questionId?")
    .post(questionController.createQtns)
    .put(questionController.updateQtns)
    .delete(questionController.deleteQtns);
  serviceRouter
    .route("/options/:optionId?")
    // .get(optionController.getOptions)
    .post(optionController.createOptions)
    .put(optionController.updateOptions)
    .delete(optionController.deleteOptions);

  return serviceRouter;
}

module.exports = Router();
