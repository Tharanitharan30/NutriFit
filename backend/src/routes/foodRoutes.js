const express = require("express");

const router = express.Router();

const {
  createFood,
  getFoods,
  getFoodById,
} = require(
  "../controllers/foodController"
);

router.post("/", createFood);

router.get("/", getFoods);

router.get("/:id", getFoodById);

module.exports = router;