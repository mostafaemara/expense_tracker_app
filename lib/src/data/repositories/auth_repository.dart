import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/src/data/exceptions/invalid_input_exception.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/data/models/inputs/login_input.dart';
import 'package:expense_tracker_app/src/data/models/inputs/signup_input.dart';
import 'package:expense_tracker_app/src/data/models/user.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:expense_tracker_app/src/data/repositories/config_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:google_sign_in/google_sign_in.dart';

import '../../../injection.dart';

class AuthRepository {
  final authApi = fb_auth.FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final fireStore = FirebaseFirestore.instance;
  Future<User> login(LoginInput input) async {
    try {
      final userCredential = await authApi.signInWithEmailAndPassword(
          email: input.email, password: input.password);
      final token = await FirebaseMessaging.instance.getToken();
      final user = User(
          image: userCredential.user!.photoURL ?? "",
          token: token ?? "",
          email: userCredential.user!.email ?? "",
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName ?? "");

      await fireStore.collection("users").doc(user.id).set({"token": token});

      return user;
    } on fb_auth.FirebaseAuthException catch (e) {
      final appLocalizations =
          await locator<ConfigRepository>().loadAppLocalizations();
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

  Future<User> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = fb_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential = await authApi.signInWithCredential(credential);

      final user = User(
          image: userCredential.user!.photoURL ?? "",
          token: "",
          email: userCredential.user!.email ?? "",
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName ?? "");
      final token = await FirebaseMessaging.instance.getToken();
      await fireStore.collection("users").doc(user.id).set({"token": token});
      return user;
    } on fb_auth.FirebaseAuthException catch (e) {
      final appLocalizations =
          await locator<ConfigRepository>().loadAppLocalizations();

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
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await authApi.sendPasswordResetEmail(email: email);
    } on fb_auth.FirebaseAuthException catch (e) {
      log(e.code);
      final appLocalizations =
          await locator<ConfigRepository>().loadAppLocalizations();

      switch (e.code) {
        case "invalid-email":
          throw InavlidInputException(appLocalizations.userNotFound);

        case "user-not-found":
          throw InavlidInputException(appLocalizations.userNotFound);

        default:
          throw InavlidInputException(appLocalizations.serverError);
      }
    }
  }

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
      final token = await FirebaseMessaging.instance.getToken();
      await fireStore.collection("users").doc(user.id).set({"token": token});
      return user;
    } on fb_auth.FirebaseAuthException catch (e) {
      final appLocalizations =
          await locator<ConfigRepository>().loadAppLocalizations();
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

  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await FirebaseMessaging.instance.deleteToken();
    await authApi.signOut();
  }

  Stream<User?> onAuthChange() {
    throw UnimplementedError();
  }

  Future<User> updateUserName(String username) async {
    try {
      await authApi.currentUser!.updateDisplayName(username);
      final user = authApi.currentUser;
      if (user != null) {
        return User(
            image: user.photoURL ?? "",
            token: "",
            email: user.email ?? "",
            id: user.uid,
            name: user.displayName ?? "");
      }
      throw Exception("user not Authintecated user is null");
    } catch (e) {
      throw ServerException();
    }
  }

  Future<User> updateUserProfile(File imageFile) async {
    try {
      var user = authApi.currentUser;
      if (user == null) {
        throw Exception("user not Authintecated user is null");
      }
      String fileName = imageFile.path.split('/').last;

      final profileImageRef =
          storage.ref().child("users_profile_images/${user.uid}_$fileName");

      await profileImageRef.putFile(imageFile);
      final imageUrl = await profileImageRef.getDownloadURL();

      await authApi.currentUser!.updatePhotoURL(imageUrl);

      user = authApi.currentUser;
      return User(
          image: user!.photoURL ?? "",
          token: "",
          email: user.email ?? "",
          id: user.uid,
          name: user.displayName ?? "");
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }
}
