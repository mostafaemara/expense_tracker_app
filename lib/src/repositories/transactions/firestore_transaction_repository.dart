import 'dart:async';

import 'package:expense_tracker_app/injection.dart';

import 'package:expense_tracker_app/src/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/models/frequent_transaction.dart';

import 'package:expense_tracker_app/src/models/transaction_input.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/models/uid.dart';
import 'package:expense_tracker_app/src/repositories/categories/categories_repository.dart';

import 'package:cloud_firestore/cloud_firestore.dart' as firebase;
import 'package:expense_tracker_app/src/repositories/date_repository.dart';

import 'transaction_repository.dart';

class FSTransactionRepository implements TransactionRepository {
  final _categoriesRepo = locator<CategoriesRepository>();
  final _dateRepo = locator<DateRepository>();
  final _usersCollection =
      firebase.FirebaseFirestore.instance.collection("users");

  @override
  Future<Transaction> addTransaction(
    TransactionInput transactionInput,
  ) async {
    try {
      final uid = locator<UID>().value;
      final _dateNow = await _dateRepo.readCurrentTime();
      final _timeStamp = firebase.Timestamp.fromDate(_dateNow);
      final snapshot = await _usersCollection
          .doc(uid)
          .collection("transactions")
          .add({...transactionInput.toMap(), "date": _timeStamp});
      final transaction = transactionInput.toTransaction(snapshot.id, _dateNow);

      return transaction;
    } catch (e) {
      throw const TransactionException.serverError();
    }
  }

  @override
  Future<List<Transaction>> getAllTransactions() async {
    try {
      final uid = locator<UID>().value;
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
      throw const TransactionException.serverError();
    }
  }

  Future<List<Transaction>> _documentsToTransactions(
      List<firebase.QueryDocumentSnapshot<Map<String, dynamic>>>
          documents) async {
    try {
      List<Transaction> transactions = [];

      for (final doc in documents) {
        final transaction = await _documentToTransaction(doc);

        transactions.add(transaction);
      }
      return transactions;
    } catch (e) {
      throw const TransactionException.serverError();
    }
  }

  Future<Transaction> _documentToTransaction(
      firebase.QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
    try {
      final map = doc.data();

      final categoryId = map["category"];
      final category = await _categoriesRepo.getCategoryById(categoryId);

      final transaction = Transaction.fromDocument(doc, category);

      return transaction;
    } catch (e) {
      throw const TransactionException.serverError();
    }
  }

  @override
  Future<FrequentTransaction> readFrequentTransactions() {
    final uid = locator<UID>().value;
    // TODO: implement readFrequentTransactions
    throw UnimplementedError();
  }

  @override
  Stream<List<Transaction>> onTransactionsChange() {
    throw UnimplementedError();
  }
}
