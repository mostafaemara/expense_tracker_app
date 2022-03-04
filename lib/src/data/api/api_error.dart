import 'package:dio/dio.dart';

class ApiError extends DioError {
  ApiError({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions);
}
