import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/models/transaction_input.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getAllTransactions(String uid);

  Future<void> addTransaction(TransactionInput transaction, String uid);
}
