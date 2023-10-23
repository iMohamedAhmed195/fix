
import 'package:dio/dio.dart';
import 'package:fix/core/network/api_constance.dart';
import 'package:fix/core/services/logging_interceptor.dart';


class DioHelper {
  Dio dio;

  DioHelper(this.dio);

  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    final loggingInterceptor = LoggingInterceptor();

    dio.interceptors.add(loggingInterceptor);
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return await dio.get(url, queryParameters: query);
  }

  Future<Response> postData({
    required String url,
    Object? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {

      'Authorization': 'Bearer $token'
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',

      'Authorization': 'Bearer $token'
    };
    return await dio.put(url, queryParameters: query, data: data);
  }

  Future<Response> deleteData({
    required String url,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return await dio.delete(url, );
  }
}


