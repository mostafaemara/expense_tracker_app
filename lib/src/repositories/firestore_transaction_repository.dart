import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/exceptions/server_exception.dart';

import 'package:expense_tracker_app/src/models/transaction_input.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/repositories/categories/categories_repository.dart';
import 'package:expense_tracker_app/src/repositories/transaction_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase;

import 'date_repository.dart';

class FSTransactionRepository implements TransactionRepository {
  final _categoriesRepo = locator<CategoriesRepository>();
  final _dateRepo = locator<DateRepository>();
  final _usersCollection =
      firebase.FirebaseFirestore.instance.collection("users");

  @override
  Future<Transaction> addTransaction(
      TransactionInput transaction, String uid) async {
    try {
      final _dateNow = await _dateRepo.readCurrentTime();
      final _timeStamp = firebase.Timestamp.fromDate(_dateNow);
      final snapshot = await _usersCollection
          .doc(uid)
          .collection("transactions")
          .add({...transaction.toMap(), "date": _timeStamp});
      return transaction.toTransaction(snapshot.id, _dateNow);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Transaction>> getAllTransactions(String uid) async {
    try {
      final snapShots = await _usersCollection
          .doc(uid)
          .collection("transactions")
          .orderBy(
            "date",
          )
          .get();

      final transactions = await _documentsToTransactions(snapShots.docs);
      return transactions;
    } catch (e) {
      throw ServerException();
    }
  }

  Future<List<Transaction>> _documentsToTransactions(
      List<firebase.QueryDocumentSnapshot<Map<String, dynamic>>>
          documents) async {
    List<Transaction> transactions = [];

    for (final doc in documents) {
      final transaction = await _documentToTransaction(doc);

      transactions.add(transaction);
    }
    return transactions;
  }

  Future<Transaction> _documentToTransaction(
      firebase.QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
    final map = doc.data();

    final categoryId = map["category"];
    final category = await _categoriesRepo.getCategoryById(categoryId);

    final transaction = Transaction.fromDocument(doc, category);

    return transaction;
  }
}
