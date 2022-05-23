import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/models/inputs/account_input.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';

import '../old_sub_state/submission_state.dart';

class NewAccountCubit extends Cubit<SubmissionState> {
  final _accountsRepository = locator<TransactionRepository>();

  NewAccountCubit() : super(const SubmissionState.idle());

  void addNewAccount(
    AccountInput accountInput,
  ) async {
    try {
      emit(const SubmissionState.submitting());
      await _accountsRepository.addAccount(
        accountInput,
      );

      emit(const SubmissionState.success());
    } catch (e) {
      emit(const SubmissionState.failed(failure: null));
    }
  }
}
