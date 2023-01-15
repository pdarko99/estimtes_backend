const pool = require("./db").pool;

async function getQtns(data) {
  const conn = await pool.connect();

  const result = await conn.query(
    "SELECT question FROM questions WHERE id = $1",
    [data]
  );
  conn.release();

  return result.rows[0];
}

async function getOptions(data) {
  const conn = await pool.connect();

  const result = await conn.query(
    "SELECT option, price, currency, symbol FROM options WHERE id = $1",
    [data]
  );
  conn.release();
  return result.rows[0];
}

async function getUser(data) {
  const conn = await pool.connect();

  const result = await conn.query(
    "SELECT name, email FROM userInfo WHERE id = $1",
    [data]
  );
  conn.release();
  return result.rows[0];
}

module.exports = { getOptions, getQtns, getUser };
