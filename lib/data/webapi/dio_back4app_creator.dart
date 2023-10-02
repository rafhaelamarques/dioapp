import 'package:dio/dio.dart';
import 'package:dioapp/data/webapi/dio_back4app_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioBack4AppCreator {
  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioBack4AppCreator() {
    _dio.options.baseUrl = dotenv.get('BACK4APP_BASE_URL');
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.interceptors.add(DioBack4AppInterceptor());
  }
}
