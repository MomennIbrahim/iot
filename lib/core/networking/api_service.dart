import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:iot_test_app/core/helpers/secure_cache_helper.dart';
import 'package:iot_test_app/core/networking/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


const _baseUrl = EndPoints.baseUrl;

class ApiService {
  Dio dio;
  final SecureCacheHelper secureCacheHelper;

  ApiService(this.dio, this.secureCacheHelper) {
    initDio();
  }

  initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    //    dio.interceptors.add(AuthorizationInterceptor(dio));
    addDioInterceptor();
  }

  void addDioInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }

  Future<dynamic> postData({
    required String endPoint,
    String? contentType,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    final token = await secureCacheHelper.getToken();

    dio.options.headers = {
      'Content-Type': data is FormData
          ? 'multipart/form-data'
          : (contentType ?? 'application/json'),
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    final response = await dio.post(
      '$_baseUrl$endPoint',
      queryParameters: query,
      data: data,
    );
    return response.data;
  }

  Future<dynamic> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    final token = await secureCacheHelper.getToken();
    log('toooooooken$token');
    dio.options.headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
    var response = await dio.get(
      '$_baseUrl$endPoint',
      queryParameters: query,
      data: data,
    );

    return response.data;
  }

  Future<dynamic> putData({
    required String endPoint,
    Map<String, dynamic>? query,
    String? contentType,
    dynamic data,
  }) async {
    String? token = await secureCacheHelper.getToken();
    dio.options.headers = {
      'Content-Type': data is FormData
          ? 'multipart/form-data'
          : (contentType ?? 'application/json'),
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    var response = await dio.put(
      '$_baseUrl$endPoint',
      queryParameters: query,
      data: data,
    );

    return response.data;
  }

  Future<dynamic> deleteData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
    };

    var response = await dio.delete(
      '$_baseUrl$endPoint',
      queryParameters: query,
      data: data,
    );

    //  addDioInterceptor();
    return response.data;
  }
}
