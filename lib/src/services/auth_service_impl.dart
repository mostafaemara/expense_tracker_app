import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/models/inputs/login_input.dart';
import 'package:expense_tracker_app/src/models/inputs/signup_input.dart';

import 'package:expense_tracker_app/src/models/user.dart';
import 'package:expense_tracker_app/src/repositories/interfaces/user_repository.dart';
import 'package:expense_tracker_app/src/services/api/api.dart';

import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  final _userRepo = locator.get<UserRepository>();
  final _api = locator.get<Api>();

  @override
  Future<User> login(LoginInput input) async {
    try {
      log("request started");
      final response = await _api.dio.post("/auth/login", data: input.toMap());
      final user = User.fromMap(response.data);
      await _userRepo.writeUser(user);
      return user;
    } on DioError catch (e) {
      log("Error" + e.type.name);
      throw e;
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {}

  @override
  Future<User> signup(SignupInput input) async {
    throw UnimplementedError();
  }

  @override
  Future<void> setNewPassword(String code, String newPassword) async {
    throw UnimplementedError();
  }

  @override
  Stream<User?> onAuthChange() {
    throw UnimplementedError();
  }
}
