import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage storage =
      const FlutterSecureStorage();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.176.162.176:5000/api/auth',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<Response> register(
    String name,
    String email,
    String password,
  ) async {
    return await dio.post(
      '/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
  }

  Future<Response> login(
    String email,
    String password,
  ) async {
    final response = await dio.post(
      '/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    final token = response.data["token"];

    await storage.write(
      key: "token",
      value: token,
    );

    print("TOKEN SAVED:");
    print(token);

    return response;
  }

  Future<String?> getToken() async {
    return await storage.read(
      key: "token",
    );
  }

  Future<void> logout() async {
    await storage.delete(
      key: "token",
    );
  }
}