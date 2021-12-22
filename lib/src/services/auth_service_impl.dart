import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/exceptions/auth_exception.dart';
import 'package:expense_tracker_app/src/models/user.dart';
import 'package:expense_tracker_app/src/repositories/user_repository.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase;

import "./firebase_user_mapper.dart";
import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  final _auth = firebase.FirebaseAuth.instance;
  final _userRepo = locator<UserRepository>();
  @override
  Future<User> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential.toDomain();
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        throw AuthException(AuthError.invalidEmailOrPassword);
      } else {
        throw AuthException(AuthError.serverError);
      }
    } catch (e) {
      throw AuthException(AuthError.serverError);
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == "auth/user-not-found") {
        throw AuthException(AuthError.emailNotFound);
      } else {
        throw AuthException(AuthError.serverError);
      }
    } catch (e) {
      throw AuthException(AuthError.serverError);
    }
  }

  @override
  Future<User> signup(String email, String password, String userName) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _userRepo.setUserName(userCredential.user!.uid, userName);

      return userCredential.toDomain();
    } on firebase.FirebaseAuthException catch (e) {
      log(e.code, name: "sasa");
      if (e.code == "email-already-in-use") {
        throw AuthException(AuthError.emailAlreadyInUse);
      }
      throw AuthException(AuthError.serverError);
    } catch (e) {
      throw AuthException(AuthError.serverError);
    }
  }

  @override
  Future<void> setNewPassword(String code, String newPassword) async {
    try {
      await _auth.confirmPasswordReset(code: code, newPassword: newPassword);
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == "expired-action-code" || e.code == "invalid-action-code") {
        throw AuthException(AuthError.invalidCode);
      }
      throw AuthException(AuthError.serverError);
    } catch (e) {
      throw AuthException(AuthError.serverError);
    }
  }

  @override
  Future<User?> getUser() async {
    if (_auth.currentUser != null) {
      return _auth.currentUser!.toDomain();
    }
  }
}
