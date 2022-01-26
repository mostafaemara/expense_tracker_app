import 'dart:async';

import 'package:expense_tracker_app/src/models/transaction_input.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/models/frequent_transaction.dart';
import 'package:expense_tracker_app/src/repositories/transactions/transaction_repository.dart';

class TransactionsProxy implements TransactionRepository {
  final TransactionRepository _transactionRepository;
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
}
