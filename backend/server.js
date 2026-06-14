require("dotenv").config();

const express = require("express");
const cors = require("cors");

const connectDB =
require("./src/config/db");

const authRoutes =
require("./src/routes/authRoutes");

const userRoutes =
require("./src/routes/userRoutes");

const calorieRoutes =
require("./src/routes/calorieRoutes");

const foodRoutes =
require("./src/routes/foodRoutes");

const mealRoutes =
require("./src/routes/mealRoutes");

const dashboardRoutes =
require("./src/routes/dashboardRoutes");

connectDB();

const app = express();

app.use(cors());
app.use(express.json());

app.use(
  "/api/auth",
  authRoutes
);

app.use(
  "/api/user",
  userRoutes
);

app.use(
  "/api/calories",
  calorieRoutes
);

app.use(
  "/api/foods",
  foodRoutes
);

app.use(
  "/api/meals",
  mealRoutes
);

app.use(
  "/api/dashboard",
  dashboardRoutes
);

app.get("/", (req, res) => {
  res.json({
    status:
      "NutriFit API Running",
  });
});

app.listen(
  process.env.PORT,
  () => {
    console.log(
      `Server running on ${process.env.PORT}`
    );
  }
);