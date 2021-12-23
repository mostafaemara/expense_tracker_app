import 'package:cloud_firestore/cloud_firestore.dart' as firebase;
import 'package:expense_tracker_app/src/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/repositories/accounts_repository.dart';

class FirestoreAccountsRepository implements AccountsRepository {
  final _firestore = firebase.FirebaseFirestore.instance;
  final _usersCollection = "users";
  final _accountsCollection = "accounts";
  @override
  Future<void> addAccount(Account account, String uid) async {
    try {
      await _firestore
          .collection(_usersCollection)
          .doc(uid)
          .collection(_accountsCollection)
          .add(account.toMap());
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> getAccounts(String uid) {
    // TODO: implement getAccounts
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> getAllTransactions(String uid) {
    // TODO: implement getAllTransactions
    throw UnimplementedError();
  }
}
