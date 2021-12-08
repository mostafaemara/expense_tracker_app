part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    required EmailInput emailInput,
    required PasswordInput passwordInput,
    required ConfirmPasswordInput confirmPasswordInput,
    required UsernameInput usernameInput,
    required SubmissionState<AuthError> submissionState,
  }) = _SignupState;

  factory SignupState.initial() => const _SignupState(
      confirmPasswordInput: ConfirmPasswordInput.pure(),
      emailInput: EmailInput.pure(),
      passwordInput: PasswordInput.pure(),
      usernameInput: UsernameInput.pure(),
      submissionState: SubmissionState.idle());
}
