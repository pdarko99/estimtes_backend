const nodemailer = require("nodemailer");
const pool = require("./db").pool;

const puppeteer = require("puppeteer");
const dotenv = require("dotenv");
dotenv.config();


/*
const mailchimpTx = require("@mailchimp/mailchimp_transactional")(process.env.MANDRILL_API_KEY);


sendEmailFromMandrill = async (objParams) => {
  try {
    const {
      templateName,
      fromEmail,
      subject,
      textContent,
      arrToEmail,
      arrTemplateVars,
      arrAttachments,
    } = objParams;

    let objEmailParams = {
      template_name: templateName,
      template_content: [{}],
      message: {
        from_email: fromEmail,
        subject: subject,
        text: textContent,
        to: arrToEmail,
        global_merge_vars: arrTemplateVars,
        attachments: arrAttachments,
      },
    };
    // console.log("Email Params for sending mail ::: ", JSON.stringify(objEmailParams));
    const emailResponse = await mailchimpTx.messages.sendTemplate(
      objEmailParams
    );
    console.log("emailResponse ::::: ", emailResponse);
    return emailResponse;
  } catch (error) {
    console.log("error ::::: ", error);
    throw error;
  }
};


  let objMailchimpParamsToDoctor = {
    templateName: "estimate",
    fromEmail: "order@estimatesback.azguards.com",
    subject: "Your azguards total expenses",
    textContent: "lol",
    arrToEmail: [
      {
        email: "padarko99@gmail.com",
        type: "to",
      },
    ],
    arrTemplateVars: [
      {
        name: "accessUrl",
        content: `gfsdfg`,
      },
    ],
    arrAttachments: [
     
      {
        path: "./portfolio.pdf",
      },
    ],
  };
  if (typeof file !== "undefined" && Object.keys(file).length > 0) {
    const data = fs.readFileSync(file.path);
    let base64Data = Buffer.from(data).toString("base64");
    objMailchimpParamsToDoctor.arrAttachments = [
      {
        type: `${file.mimetype}`,
        name: `${file.filename}`,
        content: base64Data,
      },
    ];
  }


 sendEmailFromMandrill(objMailchimpParamsToDoctor);

 */










const transport = nodemailer.createTransport({
  host: process.env.host,
  port: process.env.mail_port,
  secure: "false",
  auth: {
    user: process.env.user,
    pass: process.env.pass,
  },
});

const mailOptions = {
  from: "prince@azguards.com",
  to: "padarko99@gmail.com",
  subject: "hello",
  text: "Hello this is a new s text",
};

// transport.sendMail(mailOptions, (error, info) => {
//   if (error) {
//     console.log(error);
//   } else {
//     console.log(`Email bla bla sent: ${info.response}`);
//   }
// });

async function generatePDF(html) {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.setContent(html);
  const buffer = await page.pdf({ format: "A4" });
  await browser.close();
  return buffer;
}

// module.exports = { sendEmailFromMandrill, generatePDF };
module.exports = { transport, generatePDF, };
