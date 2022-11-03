import 'dart:ui';

import 'package:bloc/bloc.dart';

import 'package:expense_tracker_app/src/data/models/inputs/login_input.dart';
import 'package:expense_tracker_app/src/data/repositories/auth_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';
import 'package:expense_tracker_app/src/helpers/exception_helper.dart';
import 'package:expense_tracker_app/src/manger/connection_manger.dart';

import '../../../../injection.dart';
import '../submission_status.dart';

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
      emit(state.copyWith(submissionStatus: Status.loading, error: ""));
      await _connectionManger.checkConnection();

      final user = await _authService
          .login(LoginInput(email: email, password: password));

      await _userRepo.writeUser(user);

      emit(state.copyWith(submissionStatus: Status.success, error: ""));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(error: error, submissionStatus: Status.error));
    }
  }

  void loginWithGoolge() async {
    try {
      emit(state.copyWith(submissionStatus: Status.loading, error: ""));
      await _connectionManger.checkConnection();

      final user = await _authService.loginWithGoogle();

      await _userRepo.writeUser(user);

      emit(state.copyWith(submissionStatus: Status.success, error: ""));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(error: error, submissionStatus: Status.error));
    }
  }
}
