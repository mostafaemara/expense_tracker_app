import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';

import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/repositories/accounts_repository.dart';

part 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  final _accountsRepo = locator<AccountsRepository>();

  AccountsCubit() : super(AccountsState([]));

  void init() async {
    final accounts = await _accountsRepo.getAccounts();
    emit(AccountsState(accounts));
  }

  void addAccount(Account account) {
    final newAccounts = [account, ...state.accounts];
    emit(AccountsState(newAccounts));
  }

  void deleteAccount(String accountId) {
    //TODO Delete Account
  }
}
