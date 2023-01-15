const express = require("express");
let serviceRouter = express.Router();

const serviceController = require("../controller/services");

function Router() {
  serviceRouter.route("/").get(serviceController.getServices);

  return serviceRouter;
}

module.exports = Router();
