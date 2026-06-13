import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://10.176.162.176:5000",
    ),
  );

  Future<Map<String, dynamic>> getStatus() async {
    final response = await dio.get("/");
    return Map<String, dynamic>.from(response.data);
  }
}