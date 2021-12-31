import 'package:expense_tracker_app/src/models/account.dart';

extension AccountListHelper on List<Account> {
  double totalBalance() {
    double totalBalance = 0;
    for (final account in this) {
      totalBalance += account.balance;
    }
    return totalBalance;
  }
}