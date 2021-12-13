import 'package:expense_tracker_app/src/domain/entities/transaction.dart';

enum AccountType { bankAccount, wallet }

class Account {
  final AccountType accountType;
  final String id;
  final List<Transaction> transactions;

  Account(
      {required this.id,
      required this.transactions,
      required this.accountType});

  double get balance {
    double _balance = 0;
    for (final transaction in transactions) {
      if (transaction is Expense) {
        _balance -= transaction.amount;
      }
      if (transaction is Income) {
        _balance += transaction.amount;
      }
      if (transactions is SentTransfer) {
        _balance -= transaction.amount;
      }

      if (transaction is RecivedTransfer) {
        _balance += transaction.amount;
      }
    }
    return _balance;
  }
}
