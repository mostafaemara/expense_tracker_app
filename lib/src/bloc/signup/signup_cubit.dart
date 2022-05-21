import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';

import 'package:expense_tracker_app/src/data/exceptions/auth_exception.dart';
import 'package:expense_tracker_app/src/data/exceptions/connection_exception.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/data/models/inputs/signup_input.dart';
import 'package:expense_tracker_app/src/data/repositories/auth_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';
import 'package:expense_tracker_app/src/manger/connection_manger.dart';

import '../submission_state.dart';

class SignupCubit extends Cubit<SubmissionState> {
  final _authService = locator<AuthRepository>();
  final _userRepo = locator<UserRepository>();
  final _connectionManger = locator.get<ConnectionManger>();
  SignupCubit() : super(const SubmissionState.init());

  void signUp(
      {required String email,
      required String password,
      required String username}) async {
    try {
      emit(state.copyWith(
          error: "", submissionStatus: SubmissionStatus.submitting));
      await _connectionManger.checkConnection();

      final user = await _authService.signup(
          SignupInput(email: email, password: password, name: username));
      await _userRepo.writeUser(user);
      emit(state.copyWith(
          error: "", submissionStatus: SubmissionStatus.success));
    } on AuthException catch (e) {
      emit(state.copyWith(
          error: e.message, submissionStatus: SubmissionStatus.error));
    } on ServerException {
      emit(state.copyWith(
          error: "server", submissionStatus: SubmissionStatus.error));
    } on ConnectionException {
      emit(state.copyWith(
          error: "internet ", submissionStatus: SubmissionStatus.error));
    }
  }
}
