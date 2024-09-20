const express = require("express");
const path = require("path");

const app = express();

app.use(express.static(path.join(__dirname, "public")));

app.get("/", function (req, res) {
  res.sendFile(path.join(__dirname, "public", "index.html"));
});

const PORT = 4000;
app.listen(PORT, function () {
  console.log(`Server is running on port ${PORT}`);
});

module.exports = app;
