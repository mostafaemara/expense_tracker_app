import 'package:bloc/bloc.dart';

import 'package:expense_tracker_app/src/data/exceptions/auth_exception.dart';
import 'package:expense_tracker_app/src/data/models/inputs/login_input.dart';
import 'package:expense_tracker_app/src/data/repositories/auth_repository_impl.dart';

import '../../../../injection.dart';
import '../submission_state.dart';

class LoginCubit extends Cubit<SubmissionState> {
  LoginCubit() : super(const SubmissionState.idle());

  final _authService = locator<AuthRepository>();

  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(const SubmissionState.submitting());
      final user = await _authService
          .login(LoginInput(email: email, password: password));
      emit(const SubmissionState.success());
    } on AuthException catch (e) {
      emit(SubmissionState.failed(failure: e.error));
    }
  }
}
