import sqliterun from "./sqlite.js";
import { PrismaClient } from "@prisma/client";
import express from "express";
import { fileURLToPath } from "url";
import { dirname } from "path";
import path from "path";
import ejs from "ejs";
const app = express();
const prisma = new PrismaClient();
const PORT = process.env.PORT || 80;
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
app.listen(PORT, () => {
  console.log(`The server started on Port ${PORT}`);
});
app.use(express.json());
app.use(express.static(__dirname + "views"));
app.set("views", path.join(__dirname, "views"));
app.engine("html", ejs.renderFile);
app.set("view engine", "html");
app.get("/", (req, res) => {
  res.render("main");
});
let options = {
  extensions: ["htm", "html", "CSS"],
};

app.use(express.static("views", options));

app.get("/sqlite", sqliterun);
