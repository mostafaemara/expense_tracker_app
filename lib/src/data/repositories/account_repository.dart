import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/inputs/account_input.dart';

class AccountRepository {
  final accountsRef = "accounts";
  final userIdRef = "userId";

  Future<Account> addAccount(AccountInput account, String userId) async {
    try {
      final documentRef = await FirebaseFirestore.instance
          .collection(accountsRef)
          .add({...account.toMap(), userIdRef: userId});

      return Account.fromMap({...account.toMap(), "id": documentRef.id});
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> updateAccount({
    required String id,
    required String title,
    required AccountType type,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection(accountsRef)
          .doc(id)
          .update({"title": title, "type": type.value});
    } catch (e) {
      throw ServerException();
    }
  }

  Future<List<Account>> getAccounts(String userId) async {
    try {
      final query = await FirebaseFirestore.instance
          .collection(accountsRef)
          .where(userIdRef, isEqualTo: userId)
          .get();

      return _accountsFromDocs(query.docs);
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  List<Account> _accountsFromDocs(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    final List<Account> accounts = [];
    for (final doc in docs) {
      accounts.add(Account.fromMap({...doc.data(), "id": doc.id}));
    }
    return accounts;
  }

  Future<bool> accountsIsEmpty(String userId) async {
    final accounts = await getAccounts(userId);
    if (accounts.isEmpty) {
      return true;
    }

    return false;
  }
}
