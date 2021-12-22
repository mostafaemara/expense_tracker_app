import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/repositories/user_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._authCubit) : super(const SplashState.initialize()) {
    _authStreamSubscription =
        _authCubit.stream.listen((authState) => _handleAuthState(authState));
  }

  final AuthCubit _authCubit;
  final _userReposiotry = locator<UserRepository>();
  late StreamSubscription _authStreamSubscription;

  void _handleAuthState(AuthState authState) {
    authState.when(
      authenticated: (user) => _handleAccountSetupCheck(user.uid),
      notAuthenticated: () => emit(const SplashState.redirectToLogin()),
    );
  }

  void _handleAccountSetupCheck(String uid) async {
    final isSetup = await _userReposiotry.getIsUserSetup(uid);

    if (isSetup) {
      emit(const SplashState.redirectToHome());
    } else {
      emit(const SplashState.redirectToSetUpAccount());
    }
  }

  void init() async {
    _authCubit.checkAuthState();
  }

  void dispose() {
    _authStreamSubscription.cancel();
  }
}
