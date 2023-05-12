const pool = require("./db").pool;
const helper = require("./helper");
const transporter = require("./sendmail");
const NodeCache = require("node-cache");
const myCache = new NodeCache({ stdTTL: 300 });
const fs = require("fs");

async function getAllUsers() {
  const conn = await pool.connect();
  const result = await conn.query(
    "SELECT id, name, business_name, email,number,service, industry FROM userInfo ORDER BY id ASC"
  );

  conn.release();

  return result.rows;
}

async function createUsers(data) {
  const conn = await pool.connect();

  const result = await conn.query(
    "INSERT INTO userInfo (name, business_name,industry, email, number, service) VALUES ($1,$2,$3,$4,$5,$6)  RETURNING id",
    [
      data.name,
      data.business_name,
      data.industry,
      data.email,
      data.number,
      data.service,
    ]
  );
  conn.release();

  return result.rows[0];
}

async function createServices(data) {
  const conn = await pool.connect();

  const result = await conn.query(
    "INSERT INTO services (service, description, dynamicInfo) VALUES ($1,$2,$3)",
    [data.service, data.description, data.dynamicinfo]
  );
  conn.release();
  myCache.del("services");

  return result.rows[0];
}

async function getServices() {
  const conn = await pool.connect();

  const result = await conn.query(
    "SELECT id, service,dynamicInfo, description FROM services ORDER BY created_at ASC"
  );
  conn.release();

  myCache.set("services", result.rows);
  return result.rows;
}

async function deleteService(serviceId) {
  const connection = await pool.connect();

  let res = await connection.query("DELETE FROM services WHERE id = $1", [
    serviceId,
  ]);
  myCache.del("services");

  connection.release();
}

async function updateService(data, serviceId) {
  const connection = await pool.connect();

  update = await connection.query(
    "UPDATE services SET service = $1, description = $2, dynamicInfo = $3 WHERE id = $4",
    [data.service, data.description, data.dynamicinfo, serviceId]
  );
  connection.release();
  myCache.del("services");

  return update.rows[0];
}

async function createQtns(data) {
  const conn = await pool.connect();

  const result = await conn.query(
    "INSERT INTO questions (question, service, percentage, minimum_value, multiple) VALUES ($1, $2,$3,$4,$5)",
    [
      data.question,
      data.service,
      data.percentage,
      data.minimum_value,
      data.multiple,
    ]
  );
  conn.release();
    console.log(result.rows[0], 'from woes');
  return result.rows[0];
}

async function getQtns(data) {
  const conn = await pool.connect();

  const result = await conn.query(
    "SELECT id, service,question, percentage, minimum_value, multiple FROM questions WHERE service = $1 ORDER BY created_at ASC",
    [data]
  );

  conn.release();

  return result.rows;
}

async function deleteQtns(questionId) {
  const connection = await pool.connect();

  let res = await connection.query("DELETE FROM questions WHERE id = $1", [
    questionId,
  ]);

  connection.release();

  return res;
}

async function updateQtns(data, questionId) {
  const connection = await pool.connect();

  update = await connection.query(
    "UPDATE questions SET question = $1,  service = $2, percentage = $3, minimum_value = $4, multiple = $5 WHERE id = $6",
    [
      data.question,
      data.service,
      data.percentage,
      data.minimum_value,
      data.multiple,
      questionId,
    ]
  );

  connection.release();

  return update.rows;
}

async function createOptions(data) {
  const conn = await pool.connect();

  const result = await conn.query(
    "INSERT INTO options (option, question, price, currency, next_qtn, symbol) VALUES ($1, $2, $3,$4,$5,$6)",
    [
      data.option,
      data.question,
      data.price,
      data.currency,
      data.next_qtn,
      data.symbol,
    ]
  );

  conn.release();
  console.log(result)

  return result.rows[0];
}

async function getOptions() {
  const conn = await pool.connect();

  const result = await conn.query(
    "SELECT id,option,price,question,currency,next_qtn, symbol FROM options"
  );

  conn.release();

  return result.rows;
}

async function deleteOptions(optionId) {
  const connection = await pool.connect();

  await connection.query("DELETE FROM options WHERE id = $1", [optionId]);
}

async function updateOptions(data, optionId) {
  const connection = await pool.connect();

  update = await connection.query(
    "UPDATE options SET option = $1, price = $2, question = $3, currency = $4, next_qtn =$5, symbol=$6 WHERE id = $7",
    [
      data.option,
      data.price,
      data.question,
      data.currency,
      data.next_qtn,
      data.symbol,
      optionId,
    ]
  );

  connection.release();

  return update;
}

function decodeInput(req, res, next) {
  let display = [];
  let realInput = req.body;
  let opt = {
    option: "",
    price: ""
  };

  realInput.forEach(async (x, index) => {
    let qtn = await helper.getQtns(x.key);
    console.log(qtn, 'from qtn')
    if (x.value.length > 36) {
      let [ val1, val2 ] = x.value.split(",");
      console.log(val1, val2, 'from val1 val2');
      let optt = await helper.getOptions(val1);
      let opt1 = await helper.getOptions(val2);
      console.log(optt, 'from opttt')
      opt.option = optt.option + "," + opt1.option
      opt.price = +optt.price + +opt1.price;
    } else if (x.value.length < 36) {
       if ((qtn.percentage / 100) * (+x.value) > qtn.minimum_value) {
         opt.price = (qtn.percentage / 100) * (+x.value);
       } else {
         opt.price = +qtn.minimum_value;
       }
      opt.option = x.value
      
    } else {
      
      let opts = await helper.getOptions(x.value);
      opt.option = opts.option;
      opt.price = opts.price;
     
    }
    display.push({
      question: qtn.question,
      option: opt.option,
      price: opt.price,
    });

    if (display.length === realInput.length) {
      console.log(display, 'from display')
      res.status(201).json({ response: display });
    }
  });


}

async function getUserInput(req, res, next) {
  let newrow = [];
  const conn = await pool.connect();

  const result = await conn.query("SELECT * FROM userinput");
  // console.log(result.rows)

  conn.release();
  let row = result.rows;
  try {
    row.forEach(async (x, index) => {
      if (x.userid && x.inputs) {
        let userInfo = await helper.getUser(x.userid);
        console.log(userInfo, 'from user ifnO')
        newrow.push({
          name: userInfo.name,
          email: userInfo.email,
          number: userInfo.number,
          industry: userInfo.industry,
          business_name: userInfo.business_name,
          service: userInfo.service,
          date: userInfo.created_at,
          realInput: Object.entries(x.inputs).map(([key, value]) => ({
            key,
            value,
          })),
        });

    
      }

      if (index === row.length - 1) {
        res.status(201).json({ response: newrow });
      }
    });
  } catch (error) {
    console.log(error);
  }
}

async function storeUserInput(data) {
  const conn = await pool.connect();

  let userInfo = await helper.getUser(data.userId);

  const result = await conn.query(
    "INSERT INTO userinput (userId, inputs) VALUES ($1, $2)",
    [data.userId, data.inputs]
  );
  console.log(result, 'from results');
  // return result.rows[0];
  let email_template = `
  <div>
  <h2>Hello ${userInfo.name},</h2>
  <p>
   Welcome to Azguards Technolabs. Please find below the cost for your selected options
  </p>
  </div>
    
  `;
  let inputs = data.inputs;
  console.log(inputs, "from inputs");

  let totat_cost = 0;
  let currency;
  for (const property in inputs) {
    console.log("yes we are firing");
    console.log(`${property}: ${inputs[property]}`);
    let qtn = await helper.getQtns(`${property}`);
    let opt = await helper.getOptions(`${inputs[property]}`);
    const div = `
      <ul>
      <li>Question: ${qtn.question}</li>
      <li>Option: ${opt.option}</li>
      <li>Price: ${opt.price}</li>
      </ul>
    `;

    email_template += div;
    totat_cost += +opt.price;
    currency = opt.currency;
  }
  email_template += `
    Total Cost: ${currency} ${totat_cost}
  `;
  console.log(email_template);
  const buffer = await transporter.generatePDF(email_template);
  console.log(buffer);

  conn.release();
  let first_name = userInfo.name.split(" ")[0];

  let objMailchimpParams = {
    templateName: "estimate",
    fromEmail: "order@estimatesback.azguards.com",
    subject: "Your azguards total expenses",
    textContent: "Your azguards total expenses",
    arrToEmail: [
      {
        email: userInfo.email,
        type: "to",
      },
    ],
    arrTemplateVars: [
      {
        name: "UserName",
        content: first_name,
      },
      {
        name: "serviceName",
        content: data.service_name,
      },
      {
        name: "currency",
        content: currency,
      },
      {
        name: "totalCost",
        content: totat_cost,
      },
    ],
    arrAttachments: [],
  };
  const emaildata = fs.readFileSync("./Untitled.pdf");
  let base64DataPortfolio = Buffer.from(emaildata).toString("base64");
  let base64DataEstimate = Buffer.from(buffer).toString("base64");
  objMailchimpParams.arrAttachments = [
    {
      type: `application/pdf`,
      name: `Portfolio.pdf`,
      content: base64DataPortfolio,
    },
    {
      type: `application/pdf`,
      name: `Estimate.pdf`,
      content: base64DataEstimate,
    },
  ];

  await transporter.sendEmailFromMandrill(objMailchimpParams);

  // let html_template = `
  // <div>
  // Hi ${first_name},
  // </div>
  // <p>
  // Thanks for showing interest in our services. We have recieved your request for
  // ${data.service_name}
  // </p>
  //   <p>
  //   Based on your selected options the approximate cost of the project will be around
  //   ${currency} ${totat_cost}
  // </p>
  //   <p>
  //   if you confirm your booking at our stall, you can avail 20% discount.
  // </p>
  //  <div>

  //  <span>Regards</span></br>
  //  <span>Team Azguards</span>

  //  </div>

  // `;

  // /*
  // let objMailchimpParamsToDoctor = {
  //   templateName: "estimate",
  //   fromEmail: "order@estimatesback.azguards.com",
  //   subject: "Your azguards total expenses",
  //   textContent: html_template,
  //   arrToEmail: [
  //     {
  //       email: userInfo.email,
  //       type: "to",
  //     },
  //   ],
  //   arrTemplateVars: [
  //     {
  //       name: "accessUrl",
  //       content: `${ACCESS_URL}`,
  //     },
  //   ],
  //   arrAttachments: [
  //         {
  //           filename: "azguards_price.pdf",
  //           content: buffer,
  //           contentType: "application/pdf",
  //         },
  //         {
  //           path: "./portfolio.pdf",
  //         },
  //   ],
  // };
  // if (typeof file !== "undefined" && Object.keys(file).length > 0) {
  //   const data = fs.readFileSync(file.path);
  //   let base64Data = Buffer.from(data).toString("base64");
  //   objMailchimpParamsToDoctor.arrAttachments = [
  //     {
  //       type: `${file.mimetype}`,
  //       name: `${file.filename}`,
  //       content: base64Data,
  //     },
  //   ];
  // }
  // await transporter.sendEmailFromMandrill(objMailchimpParamsToDoctor);

  // */

  // const mailOptions = {
  //   from: "prince@azguards.com",
  //   to: userInfo.email,
  //   subject: "Your azguards total expenses",
  //   html: html_template,
  //   attachments: [
  //     {
  //       filename: "azguards_price.pdf",
  //       content: buffer,
  //       contentType: "application/pdf",
  //     },
  //     {
  //       path: "./portfolio.pdf",
  //     },
  //   ],
  // };

  // transporter.transport.sendMail(mailOptions, (error, info) => {
  //   if (error) {
  //     throw error;
  //   } else {
  //     let res = `Email sent: ${info.response}`;
  //     return res;
  //   }
  // });
}

module.exports = {
  getAllUsers,
  createUsers,
  getServices,
  createServices,
  deleteService,
  updateService,
  updateQtns,
  createQtns,
  deleteQtns,
  getQtns,
  getOptions,
  createOptions,
  deleteOptions,
  updateOptions,
  storeUserInput,
  getUserInput,
  decodeInput,
};

// "d37c78a6-8a42-4134-a5b1-03fd1234556d"  id for users

//"9d9f0e7e-5e01-44af-a736-cea29040b3d1" id for service

//"7d63e9e5-8f7a-460d-97f2-7bd069d56731" id for questions

// questionId=5a71add9-5c14-4edf-afc2-b8b3d3db2b87

//  "created_at": "2022-12-21T06:18:42.919Z",
//             "updated_at": "2022-12-21T06:18:42.919Z",
