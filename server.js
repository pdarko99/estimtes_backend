const express = require("express");
const app = express();
const cors = require("cors");
const userRouter = require("./routes/route");
const serviceRouter = require("./routes/service");
const qtnRouter = require("./routes/dynamicqtns");
const getserviceRouter = require("./routes/getService.route");
const dotenv = require("dotenv");
dotenv.config();

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(cors());

app.use("/inquiry", userRouter);
app.use("/admin", serviceRouter);
app.use("/question", qtnRouter);
// app.use("/options", optionRouter);
app.use("/services", getserviceRouter);

app.use((err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  res.status(statusCode).json({ message: err.message });
  return;
});

const port =  3000;


app.listen(port, () => {
  console.log(`we listening on:${port}`);
});
