import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/exceptions/invalid_input_exception.dart';
import 'package:expense_tracker_app/src/data/models/inputs/login_input.dart';
import 'package:expense_tracker_app/src/data/models/inputs/signup_input.dart';
import 'package:expense_tracker_app/src/data/models/language.dart';

import 'package:expense_tracker_app/src/data/models/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';
import 'package:expense_tracker_app/src/data/repositories/config_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';

class AuthRepository {
  final _api = locator.get<Api>();
  final authApi = fb_auth.FirebaseAuth.instance;

  Future<User> login(LoginInput input) async {
    try {
      final userCredential = await authApi.signInWithEmailAndPassword(
          email: input.email, password: input.password);

      final user = User(
          image: userCredential.user!.photoURL ?? "",
          token: "",
          email: userCredential.user!.email ?? "",
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName ?? "");

      return user;
    } on fb_auth.FirebaseAuthException catch (e) {
      final configRepo = locator<ConfigRepository>();

      final lang = await configRepo.readLanguageCode();
      final locale = lang == null
          ? Locale(Language.english.langCode)
          : Locale(lang.langCode);
      final appLocalizations = await AppLocalizations.delegate.load(locale);

      configRepo.readLanguageCode();
      switch (e.code) {
        case "user-disabled":
          throw InavlidInputException(appLocalizations.userDisabled);

        case "user-not-found":
          throw InavlidInputException(appLocalizations.userNotFound);
        case "wrong-password":
        case "invalid-email":
          throw InavlidInputException(appLocalizations.invalidEmailOrPassword);
        default:
          throw InavlidInputException(appLocalizations.serverError);
      }
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {}

  Future<User> signup(SignupInput input) async {
    try {
      final response =
          await _api.dio.post(ApiConfig.signupPath, data: input.toMap());
      final user = User.fromMap(response.data["data"]);

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
