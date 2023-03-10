import express from "express";

const app = express();
const PORT = process.env.PORT;
app.get("/orders", async (req, res) => {
  res.json({ test: ["test"] });
});

app.listen(PORT, () => {
  console.log("Server started on port" + PORT);
});
