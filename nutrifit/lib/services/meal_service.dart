import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MealService {
  final storage =
      const FlutterSecureStorage();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl:
          "http://10.176.162.176:5000/api/meals",
    ),
  );

  Future<void> addMeal({
    required String foodId,
    required int quantity,
  }) async {
    final token =
        await storage.read(
      key: "token",
    );

    await dio.post(
      "/",
      data: {
        "foodId": foodId,
        "quantity": quantity,
      },
      options: Options(
        headers: {
          "Authorization":
              "Bearer $token",
        },
      ),
    );
  }

  Future<Map<String, dynamic>>
      getSummary() async {
    final token =
        await storage.read(
      key: "token",
    );

    final response =
        await dio.get(
      "/summary",
      options: Options(
        headers: {
          "Authorization":
              "Bearer $token",
        },
      ),
    );

    return Map<String, dynamic>.from(
      response.data,
    );
  }
}