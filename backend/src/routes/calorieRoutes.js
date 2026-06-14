const express = require("express");

const router = express.Router();

const verifyToken = require(
  "../middleware/authMiddleware"
);

const {
  calculateCalories,
} = require(
  "../controllers/calorieController"
);

router.get(
  "/calculate",
  verifyToken,
  calculateCalories
);

module.exports = router;