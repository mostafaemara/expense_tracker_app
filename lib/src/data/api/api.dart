import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:expense_tracker_app/src/data/api/api_config.dart';
import 'package:expense_tracker_app/src/data/api/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  late Dio _dio;

  Api();
  void init() {
    _dio = Dio();
    _dio.options.baseUrl = ApiConfig.baseUrl;
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;
    _dio.options.contentType = Headers.formUrlEncodedContentType;
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    log("Dio initlized");
  }

  Dio get dio => _dio;
}
