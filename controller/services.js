const userService = require("../services/main");

async function getServices(req, res, next) {
  try {
    let response = await userService.getServices();
    console.log("yo wqe good")
    res.status(200).json({ "data": response });

  } catch (error) {
    console.log(error.message, 'from why');
    next(error);
  }
}

async function createServices(req, res, next) {
  let data = { ...req.body };
  try {
    let response = await userService.createServices(data);
    res.status(200).json({ "data": "service created successfully" });
  } catch (error) {
    console.log(error);
    next(error);
  }
}

async function updateService(req, res, next) {
  let serviceId = req.params['serviceId'];
  let data = { ...req.body };

  try {
    await userService.updateService(data, serviceId);
    res.status(201).json({ "response": "updated successfully" });

  } catch (error) {
    console.log(error);
    next(error);
  }
}

async function deleteService(req, res, next) {
    let serviceId = req.params["serviceId"];

  try {
    let response = await userService.deleteService(serviceId);
    console.log(response);
    res.status(200).json({ "data": "deleted successfully" });

  } catch (error) {
    console.log(error);
    next(error);
  }
}

module.exports = {
  getServices,
  createServices,
  deleteService,
  updateService,
};
