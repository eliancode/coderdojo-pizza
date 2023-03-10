"use strict";
var __awaiter = (this && this.__awaiter) || function(thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function(resolve) { resolve(value); }); }
    return new(P || (P = Promise))(function(resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }

        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }

        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function(mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
const PORT = process.env.PORT;
app.get("/orders", (req, res) => __awaiter(void 0, void 0, void 0, function*() {
    res.json({ test: ["test"] });
}));
app.listen(PORT, () => {
    console.log(`The server started on Port ${PORT}`);
});
app.use(express.json());
app.use(
    bodyParser.urlencoded({
        limit: "1mb",
        extended: true,
        parameterLimit: 100,
    })
);
app.use(express.static(__dirname + "views"));
app.set("views", path.join(__dirname, "views"));
app.engine("html", ejs.renderFile);
app.set("view engine", "html");

app.get("/orders", async(req, res) => {
    const orders = await prisma.order.findMany();
    res.json({
        success: true,
        payload: orders,
        message: "Operation Successful",
    });
});

app.post("/orders", async(req, res) => {
    const result = await prisma.order.create({
        data: {...req.body },
    });
    res.redirect(301, "/");
});

app.get("/archiveorder/:id", async(req, res) => {
    const result = await prisma.order.update({
        where: {
            id: parseInt(req.params.id),
        },
        data: { archived: true },
    });
    res.redirect(301, "/");
});

app.get("/", (req, res) => {
    res.render("main");
});