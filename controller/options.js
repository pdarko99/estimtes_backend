const userService = require("../services/main");
const NodeCache = require("node-cache");
const myCache = new NodeCache({ stdTTL: 300 });

async function getOptions(req, res, next) {
  try {
    let response = await userService.getOptions(req.query.questionId);
    res.status(200).json({ data: response });
  } catch (error) {
    console.log(error.message);
    next(error);
  }
}

async function createOptions(req, res, next) {
  let data = { ...req.body };
  try {
    myCache.flushAll();

    let response = await userService.createOptions(data);
    res.status(200).json({ data: "created successfully" });
  } catch (error) {
    console.log(error);
    next(error);
  }
}

async function updateOptions(req, res, next) {
  let data = { ...req.body };
  let optionId = req.params["optionId"];

  try {
    myCache.flushAll();

    let response = await userService.updateOptions(data, optionId);
    console.log(response, "from response");
    res.status(201).json({ data: "updated successfully" });
  } catch (error) {
    console.log(error);
    next(error);
  }
}

async function deleteOptions(req, res, next) {
  let optionId = req.params["optionId"];

  try {
    myCache.flushAll();
    let response = await userService.deleteOptions(optionId);
    console.log(response);
    res.status(200).json({ data: "deleted succesfully" });
  } catch (error) {
    console.log(error);
    next(error);
  }
}

module.exports = {
  updateOptions,
  deleteOptions,
  createOptions,
  getOptions,
};
