import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/transactions_of_date.dart';

class AccountDetailsState {
  final bool isLoading;
  final Account? account;
  final List<TransactionsOfDate> transactions;

  const AccountDetailsState(this.isLoading, this.account, this.transactions);
  const AccountDetailsState.init()
      : isLoading = true,
        account = null,
        transactions = const [];

  AccountDetailsState copyWith({
    bool? isLoading,
    Account? account,
    List<TransactionsOfDate>? transactions,
  }) {
    return AccountDetailsState(
      isLoading ?? this.isLoading,
      account ?? this.account,
      transactions ?? this.transactions,
    );
  }
}
