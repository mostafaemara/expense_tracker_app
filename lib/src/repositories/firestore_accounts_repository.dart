import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' as firebase;
import 'package:expense_tracker_app/src/exceptions/server_exception.dart';

import 'package:expense_tracker_app/src/models/account.dart';

import 'package:expense_tracker_app/src/repositories/accounts_repository.dart';

class FirestoreAccountsRepository implements AccountsRepository {
  final _usersCollection =
      firebase.FirebaseFirestore.instance.collection("users");

  @override
  Future<Account> addAccount(AccountInput account, String uid) async {
    try {
      final snapshot = await _usersCollection
          .doc(uid)
          .collection("accounts")
          .add(account.toMap());
      return account.toAccount(snapshot.id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Account>> getAccounts(String uid) async {
    try {
      final snapshots =
          await _usersCollection.doc(uid).collection("accounts").get();

      return _documentsToAccounts(snapshots.docs);
    } catch (e) {
      log("Errror", error: e.toString());
      throw ServerException();
    }
  }

  List<Account> _documentsToAccounts(
      List<firebase.QueryDocumentSnapshot<Map<String, dynamic>>> documents) {
    List<Account> accounts = [];

    for (final doc in documents) {
      accounts.add(Account.fromDocument(doc));
    }
    return accounts;
  }

  @override
  Future<bool> accountsIsEmpty(String uid) async {
    final accounts = await getAccounts(uid);
    if (accounts.isEmpty) {
      return true;
    }

    return false;
  }
}
