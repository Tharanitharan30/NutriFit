const Meal = require("../models/Meal");
const Food = require("../models/Food");

exports.addMeal = async (req, res) => {
  try {
    const { foodId, quantity } = req.body;

    const meal = await Meal.create({
      userId: req.user.id,
      foodId,
      quantity,
    });

    res.status(201).json(meal);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

exports.getMeals = async (req, res) => {
  try {
    const meals = await Meal.find({
      userId: req.user.id,
    }).populate("foodId");

    res.json(meals);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

exports.deleteMeal = async (req, res) => {
  try {
    await Meal.findByIdAndDelete(
      req.params.id
    );

    res.json({
      message: "Meal Deleted",
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

exports.getDailySummary = async (
  req,
  res
) => {
  try {
    const meals = await Meal.find({
      userId: req.user.id,
    }).populate("foodId");

    let totalCalories = 0;
    let totalProtein = 0;
    let totalCarbs = 0;
    let totalFat = 0;

    meals.forEach((meal) => {
      totalCalories +=
        meal.foodId.calories *
        meal.quantity;

      totalProtein +=
        meal.foodId.protein *
        meal.quantity;

      totalCarbs +=
        meal.foodId.carbs *
        meal.quantity;

      totalFat +=
        meal.foodId.fat *
        meal.quantity;
    });

    res.json({
      totalCalories,
      totalProtein,
      totalCarbs,
      totalFat,
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};