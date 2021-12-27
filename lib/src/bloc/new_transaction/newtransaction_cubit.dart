import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/bloc/submission_state.dart';
import 'package:expense_tracker_app/src/models/transaction_input.dart';

import 'package:expense_tracker_app/src/repositories/transaction_repository.dart';

class NewTransactionCubit extends Cubit<SubmissionState> {
  NewTransactionCubit(this._authCubit) : super(const SubmissionState.idle());

  final AuthCubit _authCubit;

  final _transactionRepository = locator<TransactionRepository>();

  void addTransaction(TransactionInput transaction) {
    _authCubit.state.whenOrNull(
      authenticated: (user) async {
        try {
          emit(const SubmissionState.submitting());

          await _transactionRepository.addTransaction(transaction, user.uid);
          emit(const SubmissionState.success());
        } catch (e) {
          emit(const SubmissionState.failed(failure: "failure"));
        }
      },
    );
  }
}
