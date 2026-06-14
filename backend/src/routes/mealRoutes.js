const express = require("express");

const router = express.Router();

const verifyToken = require(
  "../middleware/authMiddleware"
);

const {
  addMeal,
  getMeals,
  deleteMeal,
  getDailySummary,
} = require(
  "../controllers/mealController"
);

router.post(
  "/",
  verifyToken,
  addMeal
);

router.get(
  "/",
  verifyToken,
  getMeals
);

router.get(
  "/summary",
  verifyToken,
  getDailySummary
);

router.delete(
  "/:id",
  verifyToken,
  deleteMeal
);

module.exports = router;