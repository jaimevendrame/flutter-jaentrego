import 'package:dio/dio.dart';
import '../../../constants/api.dart';

Dio dioInterceptorAuth() {
  Dio dio = new Dio();

  // Set default configs
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONNECTION_TIMEOUT; //5s
  dio.options.receiveTimeout = API_RECEIVE_TIMEOUT;

  dio.options.headers['Accept'] = 'applicationsd/json';

  return dio;
}
