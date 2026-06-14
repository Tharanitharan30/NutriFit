import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CalorieService {
  final storage =
      const FlutterSecureStorage();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl:
          "http://10.176.162.176:5000/api/calories",
    ),
  );

  Future<Map<String, dynamic>>
      getCalories() async {
    final token = await storage.read(
      key: "token",
    );

    final response = await dio.get(
      "/calculate",
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