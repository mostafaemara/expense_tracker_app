import 'package:expense_tracker_app/src/data/models/account.dart';

class AccountsState {
  final bool isLoading;
  final List<Account> accounts;

  const AccountsState(this.isLoading, this.accounts);
  const AccountsState.init()
      : isLoading = true,
        accounts = const [];
  AccountsState copyWith({
    bool? isLoading,
    List<Account>? accounts,
  }) {
    return AccountsState(
      isLoading ?? this.isLoading,
      accounts ?? this.accounts,
    );
  }

  double accountsBalance() {
    double balance = 0;

    for (final a in accounts) {
      balance += a.balance;
    }
    return balance;
  }
}
