import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileService {
  final FlutterSecureStorage storage =
      const FlutterSecureStorage();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://10.176.162.176:5000/api/user",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  Future<Response> updateProfile({
    required int age,
    required String gender,
    required double height,
    required double weight,
    required String activityLevel,
  }) async {
    final token = await storage.read(key: "token");

    print("=================================");
    print("TOKEN FROM STORAGE:");
    print(token);
    print("=================================");

    return await dio.put(
      "/profile",
      data: {
        "age": age,
        "gender": gender,
        "height": height,
        "weight": weight,
        "activityLevel": activityLevel,
      },
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  Future<Response> getProfile() async {
    final token = await storage.read(key: "token");

    print("=================================");
    print("TOKEN FROM STORAGE:");
    print(token);
    print("=================================");

    return await dio.get(
      "/profile",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }
}