import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DashboardService {
  final storage =
      const FlutterSecureStorage();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl:
          "http://10.176.162.176:5000/api/dashboard",
    ),
  );

  Future<Map<String, dynamic>>
      getDashboard() async {
    final token =
        await storage.read(
      key: "token",
    );

    final response =
        await dio.get(
      "/",
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