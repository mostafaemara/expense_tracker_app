import 'package:expense_tracker_app/src/models/account.dart';

extension AccountTypeToString on AccountType {
  String toKey() {
    switch (this) {
      case AccountType.bankAccount:
        return "bankAccount";

      case AccountType.wallet:
        return "wallet";
    }
  }
}

extension KeyToAccountType on String {
  AccountType toAccountType() {
    if (this == "bankAccount") {
      return AccountType.bankAccount;
    }
    return AccountType.wallet;
  }
}
