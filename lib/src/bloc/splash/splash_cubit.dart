import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/repositories/accounts_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._authCubit) : super(const SplashState.initialize()) {
    _authStreamSubscription =
        _authCubit.stream.listen((authState) => _handleAuthState(authState));
  }

  final AuthCubit _authCubit;
  final _accountsRepo = locator<AccountsRepository>();
  late StreamSubscription _authStreamSubscription;

  void _handleAuthState(AuthState authState) {
    authState.when(
      authenticated: (user) => _handleAccountSetupCheck(user.uid),
      notAuthenticated: () => emit(const SplashState.redirectToLogin()),
    );
  }

  void _handleAccountSetupCheck(String uid) async {
    final accountsIsEmpty = await _accountsRepo.accountsIsEmpty(uid);

    if (accountsIsEmpty) {
      emit(const SplashState.redirectToSetUpAccount());
    } else {
      emit(const SplashState.redirectToHome());
    }
  }

  void dispose() {
    _authStreamSubscription.cancel();
  }
}
