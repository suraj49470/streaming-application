require("dotenv").config();
const { hostname } = require("os");
const http = require("node:http");
const express = require("express");
const session = require("express-session");
const { pool } = require("./postgresconnect");
const app = express();
const httpServer = http.createServer(app);
const PORT = process.env.PORT || 5003;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    cookie: {
      secure: false,
      httpOnly: true,
      maxAge: parseInt(process.env.SESSION_MAX_AGE),
    },
  })
);

app.get("/healthz", (req, res) => {
  testDB()
  res.status(200).send(`${hostname()} is up and running`);
});

const testDB = async (req, res) => {
  try {
    // const result = await pool.query("SELECT * FROM Users");
    const result = await pool.query("SELECT * FROM Users");
    console.log(result.rows);
  } catch (error) {
    console.log(error);
  }
};
httpServer
  .listen(PORT, "0.0.0.0")
  .on("listening", () => console.log(`app is running on port: ${PORT}`))
  .on("error", (error) => console.error(error));
