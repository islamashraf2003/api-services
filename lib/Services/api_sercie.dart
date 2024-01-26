import 'package:dio/dio.dart';

abstract class ApiService {
  final String baseUrl = "https://gorest.co.in/public/v2/";
  Dio dio;
  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
