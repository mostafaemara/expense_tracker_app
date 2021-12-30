import 'package:expense_tracker_app/src/extenstions/date_time_helper.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';

extension TransactionListFilter on List<Transaction> {
  List<Transaction> filterByDate(DateTime from, DateTime to) {
    final List<Transaction> filteredTransaction = [];

    for (final transaction in this) {
      final date = transaction.date;

      if (date.isAfterEqual(from) && date.isBeforeEqual(to)) {
        filteredTransaction.add(transaction);
      }
    }

    return filteredTransaction;
  }
}
