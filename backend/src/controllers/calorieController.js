const User = require("../models/User");

exports.calculateCalories = async (req, res) => {
  try {
    const user = await User.findById(req.user.id);

    if (!user) {
      return res.status(404).json({
        message: "User not found",
      });
    }

    const {
      age,
      gender,
      height,
      weight,
      activityLevel,
    } = user;

    if (
      !age ||
      !gender ||
      !height ||
      !weight ||
      !activityLevel
    ) {
      return res.status(400).json({
        message: "Please complete your profile first",
      });
    }

    let bmr = 0;

    if (gender === "male") {
      bmr =
        (10 * weight) +
        (6.25 * height) -
        (5 * age) +
        5;
    } else {
      bmr =
        (10 * weight) +
        (6.25 * height) -
        (5 * age) -
        161;
    }

    const activityMultipliers = {
      sedentary: 1.2,
      light: 1.375,
      moderate: 1.55,
      active: 1.725,
      very_active: 1.9,
    };

    const maintenanceCalories = Math.round(
      bmr * activityMultipliers[activityLevel]
    );

    const weightLossCalories =
      maintenanceCalories - 500;

    const weightGainCalories =
      maintenanceCalories + 500;

    res.status(200).json({
      bmr: Math.round(bmr),
      maintenanceCalories,
      weightLossCalories,
      weightGainCalories,
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};