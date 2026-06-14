class FoodModel {
  final String id;
  final String foodName;
  final String servingSize;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;

  FoodModel({
    required this.id,
    required this.foodName,
    required this.servingSize,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  factory FoodModel.fromJson(
      Map<String, dynamic> json) {
    return FoodModel(
      id: json["_id"],
      foodName: json["foodName"],
      servingSize: json["servingSize"],
      calories: json["calories"],
      protein: json["protein"],
      carbs: json["carbs"],
      fat: json["fat"],
    );
  }
}