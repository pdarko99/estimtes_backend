const express = require("express");
let optionsRouter = express.Router();

const optionsController = require("../controller/options");

function Router() {
  optionsRouter
    .route("/")
    .get(optionsController.getOptions)
    .post(optionsController.createOptions)
    .put(optionsController.updateOptions)
    .delete(optionsController.deleteOptions);

  return optionsRouter;
}

module.exports = Router();
