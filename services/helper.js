const pool = require("./db").pool;

async function getQtns(data) {
  const conn = await pool.connect();

  const result = await conn.query(
    "SELECT question, percentage, minimum_value FROM questions WHERE id = $1",
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
    "SELECT userInfo.name, userInfo.email, userInfo.number, userInfo.business_name, userInfo.industry, userInfo.created_at, services.service FROM userInfo JOIN services on userInfo.service = services.id WHERE userInfo.id = $1 ORDER BY userInfo.created_at ASC;",
    [data]
  );
  conn.release();
  return result.rows[0];
}

module.exports = { getOptions, getQtns, getUser };
