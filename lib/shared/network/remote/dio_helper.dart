import 'package:dio/dio.dart';
import 'package:talaky_app/shared/componants/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://beautyandme.online/api/app',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',

          }),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic> ? data,
    Map<String, dynamic> ? query,

  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,

    );

  }

  static Future<Response> getData({
    required String ? url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return await dio.get(
      url!,
      queryParameters: query,
    );
  }
}
