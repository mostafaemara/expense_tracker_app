import 'dart:async';
import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';
import 'package:expense_tracker_app/src/data/api/api_config.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/finance.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

import 'package:expense_tracker_app/src/data/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/data/models/frequent_transaction.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transaction_input.dart';

import 'package:expense_tracker_app/src/data/models/uid.dart';

import 'interfaces/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final _api = locator<Api>().dio;

  @override
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

  @override
  Future<List<Transaction>> getAllTransactions() async {
    try {
      final response = await _api.get(ApiConfig.transactionPath);
      return _mapArrayToTransactions(response.data);
    } catch (e) {
      log("read Transaction" + e.toString());
      throw const TransactionException.serverError();
    }
  }

  List<Transaction> _mapArrayToTransactions(dynamic array) {
    List<Transaction> transactions = [];
    for (final map in array) {
      log("iam in" + map.runtimeType.toString());
      transactions.add(Transaction.fromMap(map));
      log("iam in");
    }
    return transactions;
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

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      final response = await _api.get(ApiConfig.categoryPath);
      return _mapArrayToCategories(response.data);
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

  @override
  Future<Finance> readFinance() async {
    try {
      final response = await _api.get(ApiConfig.financesPath);

      return Finance.fromMap(response.data);
    } catch (e) {
      throw ServerException();
    }
  }
}
