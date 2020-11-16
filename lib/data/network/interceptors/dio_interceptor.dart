import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../constants/api.dart';

FlutterSecureStorage storage = new FlutterSecureStorage();
Dio dio = new Dio();

Dio dioInterceptor() {
  // Set default configs
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONNECTION_TIMEOUT; //5s
  dio.options.receiveTimeout = API_RECEIVE_TIMEOUT;

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options) async {
      dio.options.headers['Accept'] = 'applicationsd/json';

      final String token = await storage.read(key: 'token_sanctum');
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer ' + token;
      }

      return options;
    },
  ));

  return dio;
}
