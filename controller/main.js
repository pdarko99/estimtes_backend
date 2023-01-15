const userService = require("../services/main");

async function getAllUsers(req, res, next) {
  try {
    let response = await userService.getAllUsers();
    res.status(200).json({ "data": response });
  } catch (error) {
    console.log(error.message);
    next(error);
  }
}

async function postUsers(req, res, next) {
  let data = { ...req.body };
  try {
    let response = await userService.createUsers(data);
    res.status(200).json({ "data": response });
  } catch (error) {
    console.log(error);
    next(error);
  }
}

async function storeUserInput(req, res, next) {
  let data = { ...req.body };
  try {
    let response = await userService.storeUserInput(data);
    console.log(response, 'from resone')
    res.status(200).json({ "data": response });
  } catch (error) {
    console.log(error, 'from error');
    next(error);
  }
}

module.exports = {
  getAllUsers,
  postUsers,
  storeUserInput,
};
