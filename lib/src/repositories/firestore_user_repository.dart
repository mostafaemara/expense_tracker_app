import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/src/exceptions/server_exception.dart';

import 'user_repository.dart';

class FirestoreUserRepository implements UserRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<void> setUserName(String uid, String username) async {
    try {
      await _firestore.collection("users").doc(uid).set({"userName": username});
    } catch (e) {
      log("firestore error", error: e.toString());
      throw ServerException();
    }
  }
}
