const userService = require("../services/main");
const NodeCache = require("node-cache");
const myCache = new NodeCache({ stdTTL: 300 });


async function getQtns(req, res, next) {
  let serviceId = req.params["serviceId"];
  console.log(serviceId, "from serviceId");

  let final_questions = [];

  try {
    let allQtns = await userService.getQtns(serviceId);
    let options = await userService.getOptions();

    allQtns.forEach((qtn) => {
      let index = options.findIndex((i) => i.next_qtn === qtn.id);
      if (index === -1) {
        let option = options.filter((x) => x.question === qtn.id);
        qtn.options = option;
        qtn.sub = true;
        qtn.main = true;
        final_questions.push(qtn);
        option.forEach((opt) => {
          if (opt.next_qtn) {
            createOptions(allQtns, options, final_questions, opt);
          }
        });
      }
    });

    myCache.set(`questions/${serviceId}`, final_questions);

    res.status(200).json({ response: final_questions });
  } catch (error) {
    console.log(error);
    next(error);
  }
}

function createOptions(allQtns, options, final_questions, opt) {
  let sub_qtn = allQtns.filter((i) => i.id === opt.next_qtn)[0];
  let sub_option = options.filter((x) => x.question === sub_qtn.id);
  sub_qtn.options = sub_option;
  sub_qtn.sub = true;
  sub_qtn.main = false;
  let last_qtn = final_questions[final_questions.length - 1];
  if (sub_qtn.id !== last_qtn.id) {
    final_questions.push(sub_qtn);
    sub_option.forEach((opt) => {
      if (opt.next_qtn) {
        createOptions(allQtns, options, final_questions, opt);
      }
    });
  }
}
async function createQtns(req, res, next) {
  let data = { ...req.body };
  try {
    myCache.flushAll();
    let response = await userService.createQtns(data);

    res.status(200).json({ data: "created successfully" });
  } catch (error) {
    console.log(error);
    next(error);
  }
}

async function updateQtns(req, res, next) {
  let questionId = req.params["questionId"];
  let data = { ...req.body };
  try {
    myCache.flushAll();
    let response = await userService.updateQtns(data, questionId);
    console.log(response);


    res.status(201).json({ data: "updated successfully" });
  } catch (error) {
    console.log(error);
    next(error);
  }
}

async function deleteQtns(req, res, next) {
  let questionId = req.params["questionId"];
  try {
    myCache.flushAll();
    await userService.deleteQtns(questionId);

    res.status(200).json({ data: "deleted successfully" });
  } catch (error) {
    console.log(error);
    next(error);
  }
}

module.exports = {
  getQtns,
  updateQtns,
  createQtns,
  deleteQtns,
};
