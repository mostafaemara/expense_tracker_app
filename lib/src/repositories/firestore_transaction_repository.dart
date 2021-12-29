import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:expense_tracker_app/src/models/transaction_input.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/repositories/categories/categories_repository.dart';
import 'package:expense_tracker_app/src/repositories/transaction_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase;

class FSTransactionRepository implements TransactionRepository {
  final _categoriesRepo = locator<CategoriesRepository>();
  final _usersCollection =
      firebase.FirebaseFirestore.instance.collection("users");
  static const _transferIconUrl =
      "https://firebasestorage.googleapis.com/v0/b/expense-tracker-app-8803a.appspot.com/o/icons%2Ftransaction.png?alt=media&token=831f9951-cdf9-4ed4-bac0-215b7f8b6d9e";

  @override
  Future<void> addTransaction(TransactionInput transaction, String uid) async {
    try {
      await _usersCollection.doc(uid).collection("transactions").add({
        ...transaction.toMap(),
        "date": firebase.FieldValue.serverTimestamp()
      });
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Transaction>> getAllTransactions(String uid) async {
    try {
      final snapShots =
          await _usersCollection.doc(uid).collection("transactions").get();

      final transactions = await _documentsToTransactions(snapShots.docs);
      return transactions;
    } catch (e) {
      log("get all transactionzz", error: e.toString());
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
    final type = map["type"];
    final categoryId = map["category"];
    final category = await categoryById(categoryId);

    final transactionData = TransactionData.fromDocument(doc);

    late Transaction transaction;

    switch (type) {
      case "expense":
        transaction = Transaction.expense(
            transactionData: transactionData, category: category);
        break;
      case "income":
        transaction = Transaction.income(
            transactionData: transactionData, category: category);
        break;
      case "sent":
        transaction = Transaction.sentTransfer(
            category: category,
            transactionData: transactionData,
            targetAccountId: map["targetAccount"]);
        break;
      case "recived":
        transaction = Transaction.sentTransfer(
            category: category,
            transactionData: transactionData,
            targetAccountId: map["targetAccount"]);
        break;
    }
    return transaction;
  }

  Future<Category> categoryById(String id) async {
    final categories = await _categoriesRepo.getAllCategories();
    log("get all categories ", error: categories.length.toString());
    log(
      "get category befor by id ",
    );
    final category = categories.firstWhere((element) => element.id == id);
    log("get category after  by id ", error: category.id);
    return category;
  }
}
