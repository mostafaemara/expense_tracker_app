import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/models/inputs/login_input.dart';
import 'package:expense_tracker_app/src/data/models/inputs/signup_input.dart';

import 'package:expense_tracker_app/src/data/models/user.dart';

import 'package:expense_tracker_app/src/data/api/api.dart';

class AuthRepository {
  final _api = locator.get<Api>();

  Future<User> login(LoginInput input) async {
    try {
      final response =
          await _api.dio.post(ApiConfig.loginPath, data: input.toMap());

      final user = User.fromMap(response.data["data"]);

      return user;
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {}

  Future<User> signup(SignupInput input) async {
    try {
      final response =
          await _api.dio.post(ApiConfig.signupPath, data: input.toMap());
      final user = User.fromMap(response.data["data"]["user"]);

      return user;
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  Future<void> setNewPassword(String code, String newPassword) async {
    throw UnimplementedError();
  }

  Stream<User?> onAuthChange() {
    throw UnimplementedError();
  }
}
