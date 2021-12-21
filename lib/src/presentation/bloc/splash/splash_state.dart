part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initialize() = _Initialize;
  const factory SplashState.redirectToSetUpAccount() = _RedirectToSetUpAccount;
  const factory SplashState.redirectToHome() = _RedirectToHome;
  const factory SplashState.redirectToLogin() = _RedirectToLogin;
}
