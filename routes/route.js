const express = require("express");
let UserRouter = express.Router();

const UserController = require("../controller/main");

function Router() {
  UserRouter.route("/")
    .get(UserController.getAllUsers)
    .post(UserController.postUsers);
  UserRouter.route('/inputs')
    .post(UserController.storeUserInput)

  return UserRouter;
}

module.exports = Router();
