import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/src/domain/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/domain/reposiotries/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<void> setUserName(String uid, String username) async {
    try {
      await _firestore
          .collection("users")
          .doc(uid)
          .update({"userName": username});
    } catch (e) {
      throw ServerException();
    }
  }
}
