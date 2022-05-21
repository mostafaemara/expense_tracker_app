import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/api/api_config.dart';
import 'package:expense_tracker_app/src/data/exceptions/auth_exception.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/data/models/inputs/login_input.dart';
import 'package:expense_tracker_app/src/data/models/inputs/signup_input.dart';

import 'package:expense_tracker_app/src/data/models/user.dart';

import 'package:expense_tracker_app/src/data/api/api.dart';

import 'user_repository.dart';

class AuthRepository {
  final _userRepo = locator.get<UserRepository>();
  final _api = locator.get<Api>();

  Future<User> login(LoginInput input) async {
    try {
      final response =
          await _api.dio.post(ApiConfig.loginPath, data: input.toMap());
      final user = User.fromMap(response.data);
      await _userRepo.writeUser(user);
      return user;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {}

  Future<User> signup(SignupInput input) async {
    try {
      final response =
          await _api.dio.post(ApiConfig.signupPath, data: input.toMap());
      final user = User.fromMap(response.data);
      await _userRepo.writeUser(user);
      return user;
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> setNewPassword(String code, String newPassword) async {
    throw UnimplementedError();
  }

  Stream<User?> onAuthChange() {
    throw UnimplementedError();
  }

  Exception _handleError(DioError error) {
    log("Error" + error.error.toString());
    if (error.response != null) {
      if (error.response?.statusCode == 403) {
        return AuthException(AuthError.invalidEmailOrPassword);
      }
      if (error.response?.statusCode == 400) {
        return AuthException(AuthError.emailAlreadyInUse);
      }
    }
    return ServerException();
  }
}
