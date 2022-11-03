import 'package:expense_tracker_app/src/helpers/exception_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection.dart';
import '../../data/repositories/auth_repository.dart';
import '../submission_status.dart';

class RestPasswordBLoc extends Cubit<SubmissionState> {
  final _authService = locator<AuthRepository>();
  RestPasswordBLoc() : super(const SubmissionState.init());

  void sendRestPasswordEmail(
    String email,
  ) async {
    try {
      emit(state.copyWith(submissionStatus: Status.loading, error: ""));

      await _authService.sendPasswordResetEmail(email);

      emit(state.copyWith(submissionStatus: Status.success, error: ""));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(error: error, submissionStatus: Status.error));
    }
  }
}
