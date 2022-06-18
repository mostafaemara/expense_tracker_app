import 'package:dio/dio.dart';
import 'package:expense_tracker_app/src/data/exceptions/invalid_input_exception.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';

extension DioExceptionHelper on DioError {
  Exception mapToAppExceptions() {
    if (response?.statusCode == 400) {
      return InavlidInputException(response?.data["message"]);
    }

    return ServerException();
  }
}
