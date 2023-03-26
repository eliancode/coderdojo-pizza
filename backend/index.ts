import { PrismaClient } from "@prisma/client";
import express, { Response, Request } from "express";
import { fileURLToPath } from "url";
import { dirname } from "path";
import path from "path";
import ejs from "ejs";
import bodyParser from "body-parser";

const app = express();
const prisma = new PrismaClient();

const PORT = process.env.PORT || 8000;
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);


app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  next();
});
app.listen(PORT, () => {
  console.log(`The server started on Port ${PORT}`);
});
app.use(express.json());
app.use(
  bodyParser.urlencoded({
    limit: "1mb",
    extended: true,
    parameterLimit: 200,
  })
);
app.use(express.static(__dirname + "views"));
app.set("views", path.join(__dirname, "views"));
app.engine("html", ejs.renderFile);
app.set("view engine", "html");

app.get("/orders", async (req: Request, res: Response) => {
  const orders = await prisma.order.findMany();
  res.json({
    success: true,
    payload: orders,
    message: "Operation Successful",
  });
});

app.post("/orders", async (req: Request, res: Response) => {
  const result = await prisma.order.create({
    data: { ...req.body },
  });
  res.redirect(301, "/");
});

app.get(
  "/archiveorder/:id",
  async (req: Request<{ id: string }>, res: Response) => {
    const result = await prisma.order.update({
      where: {
        id: parseInt(req.params.id),
      },
      data: { archived: true },
    });
    res.redirect(301, "/");
  }
);

app.get("/", (req: Request, res: Response) => {
  res.render("main");
});

app.use(express.static("views"));
