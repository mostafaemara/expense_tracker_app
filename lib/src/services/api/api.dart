import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:expense_tracker_app/src/services/api/api_config.dart';
import 'package:expense_tracker_app/src/services/api/auth_interceptor.dart';

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
    log("Dio initlized");
  }

  Dio get dio => _dio;
}
