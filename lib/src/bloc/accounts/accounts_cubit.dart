import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_state.dart';
import 'package:expense_tracker_app/src/data/repositories/account_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/user_repository.dart';

class AccountsCubit extends Cubit<AccountsState> {
  final accountsRepo = locator<AccountRepository>();
  final _userRepo = locator<UserRepository>();
  AccountsCubit() : super(const AccountsState.init());

  void init() async {
    try {
      final _user = await _userRepo.readUser();
      final accounts = await accountsRepo.getAccounts(_user!.id);

      emit(state.copyWith(isLoading: false, accounts: accounts));
    } catch (e) {
      log(e.toString());
    }
  }
}
