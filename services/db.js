const { Pool } = require("pg");
const dotenv = require("dotenv")
dotenv.config()


const pool = new Pool({
  connectionString: process.env.database_url,
  
});

// PostgreSQL 14.2, compiled by Visual C++ build 1914, 64-bit

module.exports = {
  pool,
};
