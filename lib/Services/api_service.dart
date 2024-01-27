import 'package:dio/dio.dart';

abstract class ApiService {
  final String baseUrl = "https://gorest.co.in/public/v2/";
  final String userUrlById = "https://gorest.co.in/public/v2/users/";
  //
  Dio dio;
  ApiService(this.dio);
  Future<dynamic> get({required String endPoint}) async {
    Response response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }

//https://gorest.co.in/public/v2/users/6079338
  Future<dynamic> getUserById({required int userId}) async {
    Response response =
        await dio.get('https://gorest.co.in/public/v2/users/$userId');
    return response.data;
  }
}
