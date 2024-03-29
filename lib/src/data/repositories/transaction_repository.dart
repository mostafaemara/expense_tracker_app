import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' as fb;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:expense_tracker_app/injection.dart';

import 'package:expense_tracker_app/src/data/exceptions/invalid_input_exception.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/finance.dart';
import 'package:expense_tracker_app/src/data/models/financial_report.dart';
import 'package:expense_tracker_app/src/data/models/inputs/transfer_input.dart';
import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

import 'package:expense_tracker_app/src/data/models/frequent_transaction.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transaction_input.dart';
import 'package:expense_tracker_app/src/data/models/transaction_filter.dart';
import 'package:expense_tracker_app/src/data/models/transactions_of_date.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

class TransactionRepository {
  final transactionsRef = "transactions";
  final accountsRef = "accounts";
  final fireStore = fb.FirebaseFirestore.instance;
  final fbFunctions = FirebaseFunctions.instance;
  final storage = FirebaseStorage.instance;
  Future<Transaction> addTransaction(
    TransactionInput transactionInput,
  ) async {
    try {
      final result = await fbFunctions
          .httpsCallable("addTransaction")
          .call(transactionInput.toMap());
      final map = json.decode(result.data);
      if (transactionInput.attachment != null) {
        final id = map["id"];
        String fileName = transactionInput.attachment!.path.split('/').last;

        final profileImageRef = storage.ref().child("transactions/$id");

        await profileImageRef.putFile(transactionInput.attachment!);
        final imageUrl = await profileImageRef.getDownloadURL();
        await fireStore
            .collection(transactionsRef)
            .doc(id)
            .update({"attachment": imageUrl});
        map["attachment"] = imageUrl;
      }

      return Transaction.fromMap(map);
    } on FirebaseFunctionsException catch (e) {
      if (e.code == "out-of-range") {
        throw InavlidInputException(e.message!);
      }
      throw ServerException();
    }
  }

  Future<List<TransactionsOfDate>> getTransactionsOfDates({
    required TransactionFilter type,
    int? limit,
    DateTimeRange? dateTimeRange,
    required SortType sortType,
    List<String>? categories,
    String? accountId,
  }) async {
    try {
      final dateFilter = dateTimeRange != null
          ? {
              "from": dateTimeRange.start.toIso8601String(),
              "to": dateTimeRange.end.toIso8601String()
            }
          : {};
      final typeFilter = type.value != "all" ? {"type": type.value} : {};
      final accountFilter = accountId != null ? {"accountId": accountId} : {};

      if (categories?.length == 1) {
        categories?.add(categories[0]);
      }
      final categoriesFilter = categories != null && categories.isNotEmpty
          ? {
              "categories": [...categories]
            }
          : {};
      final query = {
        "limit": limit,
        "sortBy": sortType.value,
        ...dateFilter,
        ...typeFilter,
        ...accountFilter,
        "groupByDate": true,
        ...categoriesFilter
      };

      final result =
          await fbFunctions.httpsCallable("getTransactions").call(query);
      final array = json.decode(result.data);
      log(array.toString());

      return mapArrayToTransactionsOfDates(array);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<List<Transaction>> readTransactions({
    required TransactionFilter type,
    int? limit,
    DateTimeRange? dateTimeRange,
    required SortType sortType,
  }) async {
    try {
      final dateFilter = dateTimeRange != null
          ? {
              "from": dateTimeRange.start.toIso8601String(),
              "to": dateTimeRange.end.toIso8601String()
            }
          : {};

      final typeFilter = type.value != "all" ? {"type": type.value} : {};
      var query = {
        "limit": limit,
        ...dateFilter,
        "sortBy": sortType.value,
        ...typeFilter,
      };
      final result =
          await fbFunctions.httpsCallable("getTransactions").call(query);
      final array = json.decode(result.data);
      log(array.toString());
      return mapArrayToTransactions(array);
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  Future<List<Category>> getAllCategories() async {
    try {
      final snapshot = await fireStore
          .collection("utils")
          .doc("expense")
          .collection("categories")
          .get();

      return _mapArrayToCategories(snapshot.docs);
    } catch (e) {
      throw ServerException();
    }
  }

  List<Category> _mapArrayToCategories(
      List<fb.QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    List<Category> categories = [];
    for (final doc in docs) {
      categories.add(Category.fromMap({...doc.data(), "id": doc.id}));
    }
    return categories;
  }

  Future<Finance> readFinance() async {
    try {
      final result = await fbFunctions.httpsCallable("getFinance").call();

      return Finance.fromJson(result.data);
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  Future<void> addTransfer(TransferInput input) async {
    try {
      await fbFunctions.httpsCallable("addTransfer").call(input.toMap());
    } on FirebaseFunctionsException catch (e) {
      log(e.toString());
      if (e.code == "out-of-range") {
        throw InavlidInputException(e.message!);
      }
      throw ServerException();
    }
  }

  Future<FinancialReport> readFinancialReport(DateTime date) async {
    log(date.toIso8601String());
    try {
      final result = await fbFunctions
          .httpsCallable("getFinancialReport")
          .call({"date": date.toIso8601String()});
      log(result.data.toString());

      return FinancialReport.fromJson(result.data);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<List<TransactionFrequency>> readTransactionsFrequencies() async {
    try {
      final user = await locator<UserRepository>().readUser();
      final List<TransactionFrequency> frequencies = [];
      final snapShots = await fireStore
          .collection("transactionFrequencies")
          .where("userId", isEqualTo: user!.id)
          .get();

      for (final doc in snapShots.docs) {
        var data = doc.data();
        data["created_at"] =
            (data["created_at"] as fb.Timestamp).millisecondsSinceEpoch;
        frequencies.add(TransactionFrequency.fromMap({...data, "id": doc.id}));
      }

      return frequencies;
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  Future<void> deleteTransactionFrequency(String id) async {
    try {
      await fireStore.collection("transactionFrequencies").doc(id).delete();
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      await fbFunctions.httpsCallable("deleteTransaction").call({"id": id});
      final profileImageRef = storage.ref().child("transactions/$id");

      profileImageRef.delete().ignore();
    } on FirebaseFunctionsException catch (e) {
      if (e.code == "out-of-range") {
        throw InavlidInputException(e.message!);
      }
      throw ServerException();
    }
  }

  Future<Transaction> readTransaction(String id) async {
    try {
      final snapshot =
          await fireStore.collection(transactionsRef).doc(id).get();
      var transactionData = snapshot.data();
      transactionData!["id"] = snapshot.id;
      final accountSnapShot = await fireStore
          .collection(accountsRef)
          .doc(transactionData["accountId"])
          .get();
      var accountData = accountSnapShot.data();
      accountData!["id"] = accountSnapShot.id;
      transactionData["account"] = accountData;
      final categorySnapShot = await fireStore
          .collection("utils")
          .doc("expense")
          .collection("categories")
          .doc(transactionData["categoryId"])
          .get();

      var categoryData = categorySnapShot.data();
      categoryData!["id"] = categorySnapShot.id;

      transactionData["category"] = categoryData;
      transactionData["created_at"] =
          (transactionData["created_at"] as fb.Timestamp)
              .toDate()
              .toIso8601String();

      return Transaction.fromMap(transactionData);
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }
}
