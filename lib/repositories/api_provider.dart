import 'package:dio/dio.dart';

class APIProvider {
late Dio dio;
final String baseUrl = 'https://www.reddit.com/r/flutterdev/';

APIProvider() {
  BaseOptions options = BaseOptions(baseUrl: baseUrl);
    dio = Dio(options);
  }

}