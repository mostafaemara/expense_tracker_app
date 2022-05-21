import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';

import 'package:expense_tracker_app/src/data/exceptions/auth_exception.dart';
import 'package:expense_tracker_app/src/data/models/inputs/signup_input.dart';
import 'package:expense_tracker_app/src/data/repositories/auth_repository_impl.dart';

import '../submission_state.dart';

class SignupCubit extends Cubit<SubmissionState> {
  final _authService = locator<AuthRepository>();

  SignupCubit() : super(const SubmissionState.idle());

  void signUp(
      {required String email,
      required String password,
      required String username}) async {
    try {
      emit(const SubmissionState.submitting());
      await _authService.signup(
          SignupInput(email: email, password: password, name: username));
      emit(const SubmissionState.success());
    } on AuthException catch (e) {
      emit(SubmissionState.failed(failure: e.error));
    }
  }
}
