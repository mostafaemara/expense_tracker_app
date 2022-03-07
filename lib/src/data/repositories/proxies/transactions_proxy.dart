import 'dart:async';

import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/finance.dart';
import 'package:expense_tracker_app/src/data/models/frequent_transaction.dart';
import 'package:expense_tracker_app/src/data/models/inputs/transfer_input.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/data/models/inputs/transaction_input.dart';
import 'package:expense_tracker_app/src/data/repositories/interfaces/transaction_repository.dart';

class TransactionsProxy implements TransactionRepository {
  final TransactionRepository _transactionRepository;

  List<Category>? _categories;
  List<Transaction>? _transactions;
  final StreamController<List<Transaction>> _transactionsController =
      StreamController<List<Transaction>>();
  TransactionsProxy(this._transactionRepository);
  @override
  Future<Transaction> addTransaction(TransactionInput transactionInput) async {
    try {
      final transaction =
          await _transactionRepository.addTransaction(transactionInput);

      _transactions ??= [];

      _transactions?.add(transaction);
      _transactionsController.add(_transactions!);
      return transaction;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Transaction>> getAllTransactions() async {
    try {
      if (_transactions == null) {
        _transactions = await _transactionRepository.getAllTransactions();
        _transactionsController.add(_transactions!);
      }
      return _transactions!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<Transaction>> onTransactionsChange() =>
      _transactionsController.stream;

  @override
  Future<FrequentTransaction> readFrequentTransactions() {
    // TODO: implement readFrequentTransactions
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getAllCategories() async {
    return _categories ??= await _transactionRepository.getAllCategories();
  }

  @override
  Future<Finance> readFinance() {
    return _transactionRepository.readFinance();
  }

  @override
  Future<List<Transaction>> addTransfer(TransferInput input) async {
    try {
      final transactions = await _transactionRepository.addTransfer(input);

      _transactions ??= [];

      _transactions?.addAll(transactions);
      _transactionsController.add(_transactions!);
      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
