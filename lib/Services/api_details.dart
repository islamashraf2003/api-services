import 'package:api_app/Services/api_service.dart';
import 'package:dio/dio.dart';

class ConcreteApiService extends ApiService {
  ConcreteApiService._(Dio dio) : super(dio);

  factory ConcreteApiService.create() {
    Dio dio = createAndSetUpDio();
    return ConcreteApiService._(dio);
  }

  static Dio createAndSetUpDio() {
    Dio dio = Dio();
    dio
      ..options.receiveTimeout = const Duration(seconds: 20)
      ..options.connectTimeout = const Duration(seconds: 20);
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      responseBody: true,
    ));
    return dio;
  }
}
