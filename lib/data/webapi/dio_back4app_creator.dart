import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioBack4AppCreator {
  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioBack4AppCreator() {
    _dio.options.baseUrl = dotenv.get('BACK4APP_BASE_URL');
    _dio.options.headers['X-Parse-Application-Id'] =
        dotenv.get('BACK4APP_APPLICATION_ID');
    _dio.options.headers['X-Parse-REST-API-Key'] =
        dotenv.get('BACK4APP_CLIENT_KEY');
    _dio.options.headers['Content-Type'] = 'application/json';
  }
}
