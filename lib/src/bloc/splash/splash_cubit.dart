import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';

import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initialize());

  final _accountsRepo = locator<TransactionRepositoryImpl>();
  final _authService = locator<UserRepository>();

  void init() async {
    final user = await _authService.readUser();
    if (user != null) {
      _handleAccountSetupCheck(user.id);
    } else {
      emit(const SplashState.redirectToLogin());
    }
  }

  void _handleAccountSetupCheck(String uid) async {
    final accountsIsEmpty = await _accountsRepo.accountsIsEmpty();

    if (accountsIsEmpty) {
      emit(const SplashState.redirectToSetUpAccount());
    } else {
      emit(const SplashState.redirectToHome());
    }
  }
}
