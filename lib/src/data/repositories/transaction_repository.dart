import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' as fb;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';
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

import 'package:flutter/material.dart';

class TransactionRepository {
  final _api = locator<Api>().dio;
  final fireStore = fb.FirebaseFirestore.instance;
  final fbFunctions = FirebaseFunctions.instance;

  Future<Transaction> addTransaction(
    TransactionInput transactionInput,
  ) async {
    try {
      final result = await fbFunctions
          .httpsCallable("addTransaction")
          .call<Map<String, dynamic>>(transactionInput.toMap());

      log(result.data.toString(), name: "Add Transaction Fb ");
      return Transaction.fromMap(result.data);
    } catch (e) {
      log(e.toString(), error: "Add Transaction Fb Error");
      rethrow;
    }
  }

  Future<List<Transaction>> getAllTransactions() async {
    try {
      final response = await _api.get(ApiConfig.transactionPath);
      return mapArrayToTransactions(response.data["data"]);
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
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
      final categoriesFilter = categories != null
          ? {
              "categories": [...categories]
            }
          : {};
      final response =
          await _api.get(ApiConfig.transactionPath, queryParameters: {
        "limit": limit,
        ...sortType.value,
        ...dateFilter,
        ...typeFilter,
        ...accountFilter,
        "group_by_date": true,
        ...categoriesFilter
      });
      log("of dates" + response.data["data"].toString());
      return mapArrayToTransactionsOfDates(response.data["data"]);
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  Future<List<Transaction>> readTransactions(
      {required TransactionFilter type,
      int? limit,
      DateTimeRange? dateTimeRange,
      required SortType sortType}) async {
    final dateFilter = dateTimeRange != null
        ? {
            "from": dateTimeRange.start.toIso8601String(),
            "to": dateTimeRange.end.toIso8601String()
          }
        : {};

    final typeFilter = type.value != "all" ? {"type": type.value} : {};
    try {
      final response =
          await _api.get(ApiConfig.transactionPath, queryParameters: {
        "limit": limit,
        ...sortType.value,
        ...dateFilter,
        ...typeFilter,
      });

      return mapArrayToTransactions(response.data["data"]);
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  Future<FrequentTransaction> readFrequentTransactions(
    TransactionType type,
  ) {
    throw UnimplementedError();
  }

  Stream<List<Transaction>> onTransactionsChange() {
    throw UnimplementedError();
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
      final response = await _api.get(ApiConfig.financesPath);

      return Finance.fromMap(response.data["data"]);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> addTransfer(TransferInput input) async {
    try {
      final response =
          await _api.post(ApiConfig.transferPath, data: input.toMap());
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  Future<FinancialReport> readFinancialReport(DateTime date) async {
    log(date.toIso8601String());
    try {
      final response = await _api.get(ApiConfig.financialReportPath,
          queryParameters: {"date": date.toIso8601String()});
      return FinancialReport.fromMap(response.data["data"]);
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      await _api.delete(
        "${ApiConfig.transactionPath}/$id",
      );
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }
}
