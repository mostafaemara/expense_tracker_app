import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/exceptions/auth_exception.dart';
import 'package:expense_tracker_app/src/services/auth_service.dart';

import '../../../../injection.dart';
import '../submission_state.dart';

class LoginCubit extends Cubit<SubmissionState> {
  LoginCubit(this._authCubit) : super(const SubmissionState.idle());

  final _authService = locator<AuthService>();
  final AuthCubit _authCubit;
  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(const SubmissionState.submitting());
      final user = await _authService.login(email, password);
      emit(const SubmissionState.success());

      _authCubit.setAuthenticated(user);
    } on AuthException catch (e) {
      emit(SubmissionState.failed(failure: e.error));
    }
  }
}
