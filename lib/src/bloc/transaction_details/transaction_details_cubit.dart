import 'dart:ui';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/helpers/exception_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/transaction_repository.dart';
import '../submission_status.dart';

class TransactionDetailsCubit extends Cubit<SubmissionState> {
  TransactionDetailsCubit() : super(const SubmissionState.init());
  final transactionRepo = locator<TransactionRepository>();
  void deleteTransaction(String id) async {
    try {
      emit(state.copyWith(error: "", submissionStatus: Status.loading));
      await transactionRepo.deleteTransaction(id);
      emit(state.copyWith(error: "", submissionStatus: Status.success));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(error: error, submissionStatus: Status.error));
    }
  }
}
