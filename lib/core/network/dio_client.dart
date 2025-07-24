import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: 'https://hyprace-api.p.rapidapi.com/v2/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'X-RapidAPI-Key': '8229703281msha01803b5f086a67p17a92ejsn9fcb5abc90b0',
        'X-RapidAPI-Host': 'hyprace-api.p.rapidapi.com',
      },
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path, queryParameters: queryParameters);
  }
}