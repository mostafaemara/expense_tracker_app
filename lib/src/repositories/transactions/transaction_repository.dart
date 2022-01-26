import 'package:expense_tracker_app/src/models/frequent_transaction.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/models/transaction_input.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getAllTransactions();

  Future<Transaction> addTransaction(TransactionInput transaction);
  Future<FrequentTransaction> readFrequentTransactions();

  Stream<List<Transaction>> onTransactionsChange();
}
