import 'package:expense_tracker_app/src/data/models/transaction.dart';

extension TransactionListFilter on List<Transaction> {
  List<Transaction> filterToExpense() {
    final List<Transaction> filteredTransaction = [];

    for (final transaction in this) {
      if (transaction.type == TransactionType.expense) {
        filteredTransaction.add(transaction);
      }
    }
    return filteredTransaction;
  }
}
