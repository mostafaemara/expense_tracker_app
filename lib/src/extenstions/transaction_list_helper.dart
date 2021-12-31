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

  List<Transaction> filterByAccountId(String id) {
    final List<Transaction> filteredTransaction = [];

    for (final transaction in this) {
      if (transaction.accountId == id) {
        filteredTransaction.add(transaction);
      }
    }
    return filteredTransaction;
  }

  List<Transaction> filterToExpense() {
    final List<Transaction> filteredTransaction = [];

    for (final transaction in this) {
      transaction.type.whenOrNull(
        expense: () {
          filteredTransaction.add(transaction);
        },
      );
    }
    return filteredTransaction;
  }

  List<Transaction> lastThree() {
    if (length >= 3) {
      return sublist(length - 3);
    } else if (length >= 2) {
      return sublist(length - 2);
    } else if (length == 1) {
      return sublist(length - 1);
    }
    return [];
  }

  double totalAmount() {
    double totalAmount = 0;

    for (final transaction in this) {
      final amount = transaction.amount;
      transaction.type.when(
        expense: () {
          totalAmount -= amount;
        },
        income: () {
          totalAmount += amount;
        },
        sentTransfer: () {
          totalAmount -= amount;
        },
        recivedTransfer: () {
          totalAmount += amount;
        },
      );
    }
    return totalAmount;
  }

  double totalExpenseAmount() {
    double totalAmount = 0;

    for (final transaction in this) {
      final amount = transaction.amount;
      transaction.type.whenOrNull(
        expense: () {
          totalAmount += amount;
        },
        sentTransfer: () {
          totalAmount += amount;
        },
      );
    }
    return totalAmount;
  }

  double totalIncomeAmount() {
    double totalAmount = 0;

    for (final transaction in this) {
      final amount = transaction.amount;
      transaction.type.whenOrNull(
        income: () {
          totalAmount += amount;
        },
        recivedTransfer: () {
          totalAmount += amount;
        },
      );
    }
    return totalAmount;
  }
}
