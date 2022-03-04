import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/finance.dart';
import 'package:expense_tracker_app/src/data/models/frequent_transaction.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transaction_input.dart';

import '../../models/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getAllTransactions();

  Future<Transaction> addTransaction(TransactionInput transaction);
  Future<FrequentTransaction> readFrequentTransactions();

  Stream<List<Transaction>> onTransactionsChange();
  Future<List<Category>> getAllCategories();
  Future<Finance> readFinance();
}
