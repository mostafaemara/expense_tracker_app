import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/domain/exceptions/auth_exception.dart';
import 'package:expense_tracker_app/src/domain/inputs/confirm_password_input.dart';
import 'package:expense_tracker_app/src/domain/inputs/email_input.dart';
import 'package:expense_tracker_app/src/domain/inputs/password_input.dart';
import 'package:expense_tracker_app/src/domain/inputs/username_input.dart';
import 'package:expense_tracker_app/src/domain/services/auth_service.dart';
import 'package:expense_tracker_app/src/presentation/bloc/auth/auth_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../submission_state.dart';
part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  final _authService = locator<AuthService>();
  final AuthCubit _authCubit;
  SignupCubit(this._authCubit) : super(SignupState.initial());

  void usernameChanged(String username) {
    emit(state.copyWith(
        submissionState: const SubmissionState.idle(),
        usernameInput: UsernameInput.dirty(username)));
  }

  void emailChanged(String email) {
    emit(state.copyWith(
        submissionState: const SubmissionState.idle(),
        emailInput: EmailInput.dirty(email)));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(
        submissionState: const SubmissionState.idle(),
        passwordInput: PasswordInput.dirty(password),
        confirmPasswordInput: ConfirmPasswordInput.dirty(
            confirmPassword: state.confirmPasswordInput.value,
            password: password)));
  }

  void confirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(
        submissionState: const SubmissionState.idle(),
        confirmPasswordInput: ConfirmPasswordInput.dirty(
            confirmPassword: confirmPassword,
            password: state.passwordInput.value)));
  }

  bool _formFieldsIsValid() {
    return (state.emailInput.valid &&
        state.usernameInput.valid &&
        state.confirmPasswordInput.valid &&
        state.passwordInput.valid);
  }

  void _validateInputs() {
    state.usernameInput.validator();
    state.emailInput.validator();
    state.passwordInput.validator();
    state.confirmPasswordInput.validator();
    emit(state.copyWith());
  }

  void signUp() async {
    _validateInputs();
    if (_formFieldsIsValid()) {
      try {
        emit(state.copyWith(
            submissionState: const SubmissionState.submitting()));
        final user = await _authService.signup(state.emailInput.value,
            state.passwordInput.value, state.usernameInput.value);
        emit(state.copyWith(submissionState: const SubmissionState.success()));

        _authCubit.setAuthenticated(user);
      } on AuthException catch (e) {
        emit(state.copyWith(
            submissionState: SubmissionState.failed(failure: e.error)));
      }
    }
  }
}
