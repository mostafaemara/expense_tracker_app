import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/models/user.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part "auth_cubit.freezed.dart";

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.notAuthenticated());

  final _authService = locator<UserRepository>();

  void setAuthenticated(User user) {
    emit(AuthState.authenticated(user: user));
  }

  void setUnAuthenticated() {
    emit(const AuthState.notAuthenticated());
  }

  void checkAuthState() async {
    final user = await _authService.readUser();
    if (user == null) {
      emit(const AuthState.notAuthenticated());
    } else {
      emit(AuthState.authenticated(user: user));
    }
  }
}
