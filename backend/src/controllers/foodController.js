const Food = require("../models/Food");

exports.createFood = async (
  req,
  res
) => {
  try {
    const food =
      await Food.create(req.body);

    res.status(201).json(food);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

exports.getFoods = async (
  req,
  res
) => {
  try {
    const foods =
      await Food.find();

    res.json(foods);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

exports.getFoodById = async (
  req,
  res
) => {
  try {
    const food =
      await Food.findById(
        req.params.id
      );

    res.json(food);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};