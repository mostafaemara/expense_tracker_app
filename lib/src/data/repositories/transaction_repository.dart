import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';
import 'package:expense_tracker_app/src/data/api/api_config.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/finance.dart';
import 'package:expense_tracker_app/src/data/models/inputs/account_input.dart';
import 'package:expense_tracker_app/src/data/models/inputs/transfer_input.dart';
import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

import 'package:expense_tracker_app/src/data/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/data/models/frequent_transaction.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transaction_input.dart';
import 'package:expense_tracker_app/src/data/models/transactions_of_date.dart';

import 'package:expense_tracker_app/src/data/models/uid.dart';
import 'package:flutter/material.dart';

class TransactionRepository {
  final _api = locator<Api>().dio;

  Future<Transaction> addTransaction(
    TransactionInput transactionInput,
  ) async {
    try {
      final response = await _api.post(ApiConfig.transactionPath,
          data: transactionInput.toMap());
      return Transaction.fromMap(response.data);
    } catch (e) {
      throw const TransactionException.serverError();
    }
  }

  Future<List<Transaction>> getAllTransactions() async {
    try {
      final response = await _api.get(ApiConfig.transactionPath);
      return mapArrayToTransactions(response.data["data"]);
    } catch (e) {
      log("read Transaction" + e.toString());
      throw const TransactionException.serverError();
    }
  }

  Future<List<TransactionsOfDate>> getTransactionsOfDates(
      {List<String>? categories,
      SortType? sortType,
      TransactionType? type}) async {
    try {
      final response = await _api.get("/transactionOfDates");
      return mapArrayToTransactionsOfDates(response.data["data"]);
    } catch (e) {
      log("read Transaction" + e.toString());
      throw const TransactionException.serverError();
    }
  }

  Future<List<Transaction>> getTransactionsByDate(
      DateTimeRange dateTimeRange) async {
    try {
      final response = await _api.get(ApiConfig.transactionPath);
      return mapArrayToTransactions(response.data["data"]);
    } catch (e) {
      log("read Transaction" + e.toString());
      throw const TransactionException.serverError();
    }
  }

  Future<List<Transaction>> getRecentTransactions() async {
    try {
      final response = await _api
          .get(ApiConfig.transactionPath, queryParameters: {"recent": 3});
      return mapArrayToTransactions(response.data["data"]);
    } catch (e) {
      log("read Transaction" + e.toString());
      throw const TransactionException.serverError();
    }
  }

  Future<FrequentTransaction> readFrequentTransactions() {
    final uid = locator<UID>().value;
    // TODO: implement readFrequentTransactions
    throw UnimplementedError();
  }

  Stream<List<Transaction>> onTransactionsChange() {
    throw UnimplementedError();
  }

  Future<List<Category>> getAllCategories() async {
    try {
      final response = await _api.get(ApiConfig.categoryPath);
      return _mapArrayToCategories(response.data["data"]);
    } catch (e) {
      throw ServerException();
    }
  }

  List<Category> _mapArrayToCategories(dynamic array) {
    List<Category> categories = [];
    for (final map in array) {
      log("asdasd");
      categories.add(Category.fromMap(map));
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

  Future<List<Transaction>> addTransfer(TransferInput input) async {
    try {
      final response =
          await _api.post(ApiConfig.transferPath, data: input.toMap());

      return mapArrayToTransactions(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 422) {
        throw const TransactionException.notEnoughBalance(availbleBalance: 0);
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  Future<Account> addAccount(
    AccountInput account,
  ) async {
    log(account.toMap().toString());
    try {
      final response =
          await _api.post(ApiConfig.accountPath, data: account.toMap());
      log(response.data.toString());
      log(response.data.runtimeType.toString());
      return Account.fromMap(response.data);
    } on DioError catch (e) {
      log(e.response.toString());

      throw ServerException();
    }
  }

  Future<List<Account>> getAccounts() async {
    try {
      final response = await _api.get(
        ApiConfig.accountPath,
      );
      log(response.data.toString());

      return _accountsFromArray(response.data["data"]!);
    } catch (e) {
      log("Errror", error: e.toString());
      throw ServerException();
    }
  }

  List<Account> _accountsFromArray(List<dynamic> array) {
    final List<Account> accounts = [];
    for (final map in array) {
      accounts.add(Account.fromMap(map));
    }
    return accounts;
  }

  Future<bool> accountsIsEmpty() async {
    final accounts = await getAccounts();
    if (accounts.isEmpty) {
      return true;
    }

    return false;
  }

  Stream<List<Account>> onAccountsChange() {
    // TODO: implement onAccountsChange
    throw UnimplementedError();
  }
}
