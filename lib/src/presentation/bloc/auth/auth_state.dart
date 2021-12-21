part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.authenticated({required User user}) = _Authenticated;

  const factory AuthState.notAuthenticated() = _NotAuthenticated;
}
