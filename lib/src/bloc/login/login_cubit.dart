import 'package:bloc/bloc.dart';

import 'package:expense_tracker_app/src/data/exceptions/auth_exception.dart';
import 'package:expense_tracker_app/src/data/exceptions/connection_exception.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/data/models/inputs/login_input.dart';
import 'package:expense_tracker_app/src/data/repositories/auth_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';
import 'package:expense_tracker_app/src/manger/connection_manger.dart';

import '../../../../injection.dart';
import '../submission_state.dart';

class LoginCubit extends Cubit<SubmissionState> {
  LoginCubit() : super(const SubmissionState.init());

  final _authService = locator<AuthRepository>();
  final _userRepo = locator<UserRepository>();
  final _connectionManger = locator.get<ConnectionManger>();
  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(
          submissionStatus: SubmissionStatus.submitting, error: ""));
      await _connectionManger.checkConnection();

      final user = await _authService
          .login(LoginInput(email: email, password: password));

      await _userRepo.writeUser(user);

      emit(state.copyWith(
          submissionStatus: SubmissionStatus.success, error: ""));
    } on AuthException catch (e) {
      emit(state.copyWith(error: e.message));
    } on ServerException {
      emit(state.copyWith(
          submissionStatus: SubmissionStatus.error, error: "server"));
    } on ConnectionException {
      emit(state.copyWith(
          submissionStatus: SubmissionStatus.error, error: "no internet "));
    }
  }
}
