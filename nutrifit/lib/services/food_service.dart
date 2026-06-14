import 'package:dio/dio.dart';

class FoodService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl:
          "http://10.176.162.176:5000/api/foods",
    ),
  );

  Future<List<dynamic>> getFoods() async {
    final response =
        await dio.get("/");

    return response.data;
  }

  Future<void> addFood({
    required String foodName,
    required String servingSize,
    required int calories,
    required int protein,
    required int carbs,
    required int fat,
  }) async {
    await dio.post(
      "/",
      data: {
        "foodName": foodName,
        "servingSize": servingSize,
        "calories": calories,
        "protein": protein,
        "carbs": carbs,
        "fat": fat,
      },
    );
  }
}