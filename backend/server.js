require("dotenv").config();

const express = require("express");
const cors = require("cors");

const connectDB = require("./src/config/db");
const authRoutes = require("./src/routes/authRoutes");
const userRoutes = require("./src/routes/userRoutes");
const calorieRoutes =
require("./src/routes/calorieRoutes");


connectDB();

const app = express();

app.use(cors());
app.use(express.json());
app.use("/api/auth", authRoutes);
app.use("/api/user", userRoutes);
app.use(
  "/api/calories",
  calorieRoutes
);

app.get("/", (req, res) => {
  console.log("Request received");
  res.json({
    status: "NutriFit API Running"
  });
});

app.listen(process.env.PORT, () => {
  console.log(`Server running on ${process.env.PORT}`);
});