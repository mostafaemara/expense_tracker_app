import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_account/new_account_cubit.dart';
import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/repositories/accounts_repository.dart';

part 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  final _accountsRepo = locator<AccountsRepository>();
  final AuthCubit _authCubit;
  AccountsCubit(this._authCubit) : super(AccountsState([])) {
    _authCubit.stream.listen((state) {
      state.whenOrNull(
        authenticated: (user) => _getAccounts(user.uid),
      );
    });
  }

  void _getAccounts(String uid) async {
    final accounts = await _accountsRepo.getAccounts(uid);
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
