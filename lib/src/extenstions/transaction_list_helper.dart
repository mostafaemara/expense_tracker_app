import 'package:expense_tracker_app/src/extenstions/date_time_helper.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/models/transaction_type.dart';

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
      if (transaction.type == TransactionType.expense) {
        filteredTransaction.add(transaction);
      }
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

      switch (transaction.type) {
        case TransactionType.expense:
          totalAmount -= amount;
          break;
        case TransactionType.income:
          totalAmount += amount;
          break;
        case TransactionType.sent:
          totalAmount -= amount;
          break;
        case TransactionType.received:
          totalAmount += amount;
          break;
        case TransactionType.transfer:
          throw const FormatException("invalid type");
      }
    }
    return totalAmount;
  }

  double totalExpenseAmount() {
    double totalAmount = 0;

    for (final transaction in this) {
      final amount = transaction.amount;

      if (transaction.type == TransactionType.sent ||
          transaction.type == TransactionType.expense) {
        totalAmount += amount;
      }
    }
    return totalAmount;
  }

  double totalIncomeAmount() {
    double totalAmount = 0;

    for (final transaction in this) {
      final amount = transaction.amount;
      if (transaction.type == TransactionType.received ||
          transaction.type == TransactionType.income) {
        totalAmount += amount;
      }
    }
    return totalAmount;
  }
}
