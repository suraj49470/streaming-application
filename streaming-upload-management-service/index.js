require("dotenv").config();
const http = require("node:http");
const express = require("express");
const app = express();
const httpServer = http.createServer(app);
const PORT = process.env.PORT || 5000;
const { hostname } = require("os");

app.get('/healthz',(req,res) => {
  res.status(200).send(`${hostname()} is up and running`);
})

httpServer
  .listen(PORT)
  .on("listening", () => console.log(`app is running on port: ${PORT}`))
  .on("error", (error) => console.error(error));
