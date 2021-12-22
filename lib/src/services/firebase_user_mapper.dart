import 'package:expense_tracker_app/src/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

extension FirebaseUserCredentialMapper on firebase.UserCredential {
  User toDomain() {
    return User(user!.uid, user!.email!);
  }
}

extension FirebaseUserMapper on firebase.User {
  User toDomain() {
    return User(uid, email!);
  }
}
