import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/exceptions/invalid_input_exception.dart';
import 'package:expense_tracker_app/src/data/models/inputs/login_input.dart';
import 'package:expense_tracker_app/src/data/models/inputs/signup_input.dart';
import 'package:expense_tracker_app/src/data/models/language.dart';

import 'package:expense_tracker_app/src/data/models/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:expense_tracker_app/src/data/repositories/config_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';

class AuthRepository {
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

        case "wrong-password":
        case "invalid-email":
        case "user-not-found":
          throw InavlidInputException(appLocalizations.invalidEmailOrPassword);
        default:
          throw InavlidInputException(appLocalizations.serverError);
      }
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {}

  Future<User> signup(SignupInput input) async {
    try {
      final userCredential = await authApi.createUserWithEmailAndPassword(
          email: input.email, password: input.password);
      await userCredential.user?.updateDisplayName(input.name);

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
        case "email-already-in-use":
          throw InavlidInputException(appLocalizations.emailAlreadyInUse);

        case "weak-password":
          throw InavlidInputException(appLocalizations.passwordTooShort);

        case "operation-not-allowed":
          throw InavlidInputException(appLocalizations.unownError);
        default:
          throw InavlidInputException(appLocalizations.serverError);
      }
    }
  }

  Future<void> setNewPassword(String code, String newPassword) async {
    throw UnimplementedError();
  }

  Stream<User?> onAuthChange() {
    throw UnimplementedError();
  }
}
