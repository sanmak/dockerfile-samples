import express from "express";

const app = express();

app.get("/", (_req, res) => {
  res.send("Hello from Dockerfile Samples!");
});

app.listen(8080, () => {
  console.log("Listening on :8080");
});
