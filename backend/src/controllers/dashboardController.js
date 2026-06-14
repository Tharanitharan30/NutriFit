const User = require("../models/User");
const Meal = require("../models/Meal");

exports.getDashboard = async (req, res) => {
  try {
    const user = await User.findById(
      req.user.id
    );

    if (!user) {
      return res.status(404).json({
        message: "User not found",
      });
    }

    const meals = await Meal.find({
      userId: req.user.id,
    }).populate("foodId");

    let totalConsumed = 0;

    meals.forEach((meal) => {
      totalConsumed +=
        meal.foodId.calories *
        meal.quantity;
    });

    let bmr = 0;

    if (user.gender === "male") {
      bmr =
        (10 * user.weight) +
        (6.25 * user.height) -
        (5 * user.age) +
        5;
    } else {
      bmr =
        (10 * user.weight) +
        (6.25 * user.height) -
        (5 * user.age) -
        161;
    }

    const activityMultipliers = {
      sedentary: 1.2,
      light: 1.375,
      moderate: 1.55,
      active: 1.725,
      very_active: 1.9,
    };

    const maintenanceCalories =
      Math.round(
        bmr *
        activityMultipliers[
          user.activityLevel
        ]
      );

    const remainingCalories =
      maintenanceCalories -
      totalConsumed;

    res.json({
      maintenanceCalories,
      consumedCalories:
        totalConsumed,
      remainingCalories,
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};