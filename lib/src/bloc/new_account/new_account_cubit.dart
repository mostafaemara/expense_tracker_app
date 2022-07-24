import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/submission_status.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/inputs/account_input.dart';
import 'package:expense_tracker_app/src/data/repositories/account_repository.dart';
import 'package:expense_tracker_app/src/helpers/exception_helper.dart';
import 'package:flutter/material.dart';

class NewAccountCubit extends Cubit<SubmissionState> {
  final _accountsRepository = locator<AccountRepository>();

  NewAccountCubit() : super(const SubmissionState.init());

  void addNewAccount(
    AccountInput accountInput,
  ) async {
    try {
      emit(state.copyWith(submissionStatus: Status.loading, error: ""));
      await _accountsRepository.addAccount(
        accountInput,
      );

      emit(state.copyWith(submissionStatus: Status.success, error: ""));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(error: error, submissionStatus: Status.error));
    }
  }

  void updateAccount({
    required String id,
    required String title,
    required AccountType type,
  }) async {
    try {
      emit(state.copyWith(submissionStatus: Status.loading, error: ""));
      await _accountsRepository.updateAccount(id: id, title: title, type: type);

      emit(state.copyWith(submissionStatus: Status.success, error: ""));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(error: error, submissionStatus: Status.error));
    }
  }
}
