import 'package:expense_tracker_app/src/data/models/account_type.dart';

class AccountInput {
  AccountInput(
      {required this.balance, required this.title, required this.accountType});

  final String title;
  final AccountType accountType;
  final double balance;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': accountType.name(),
      'balance': balance,
    };
  }
}
