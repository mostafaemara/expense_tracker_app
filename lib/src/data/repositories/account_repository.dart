import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/inputs/account_input.dart';

class AccountRepository {
  final accountsRef = "accounts";
  final userIdRef = "userId";
  final fbFunctions = FirebaseFunctions.instance;
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
      final result = await fbFunctions
          .httpsCallable(
            "getAccounts",
          )
          .call();
      log(result.data.toString());
      final array = json.decode(result.data);

      return _accountsFromDocs(array);
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  List<Account> _accountsFromDocs(List<dynamic> maps) {
    final List<Account> accounts = [];
    for (final map in maps) {
      accounts.add(Account.fromMap(map));
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
