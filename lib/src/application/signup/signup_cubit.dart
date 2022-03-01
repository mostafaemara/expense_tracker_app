import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';

import 'package:expense_tracker_app/src/data/exceptions/auth_exception.dart';
import 'package:expense_tracker_app/src/data/models/inputs/signup_input.dart';
import 'package:expense_tracker_app/src/data/repositories/interfaces/auth_repository.dart';

import '../auth/auth_cubit.dart';
import '../submission_state.dart';

class SignupCubit extends Cubit<SubmissionState> {
  final _authService = locator<AuthService>();
  final AuthCubit _authCubit;
  SignupCubit(this._authCubit) : super(const SubmissionState.idle());

  void signUp(
      {required String email,
      required String password,
      required String username}) async {
    try {
      emit(const SubmissionState.submitting());
      final user = await _authService.signup(
          SignupInput(email: email, password: password, name: username));
      emit(const SubmissionState.success());

      _authCubit.setAuthenticated(user);
    } on AuthException catch (e) {
      emit(SubmissionState.failed(failure: e.error));
    }
  }
}
