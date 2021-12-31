import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/bloc/submission_state.dart';
import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/models/transaction_input.dart';

import 'package:expense_tracker_app/src/repositories/transaction_repository.dart';

class NewTransactionCubit extends Cubit<SubmissionState> {
  NewTransactionCubit(
      {required this.authCubit, required this.transactionsCubit})
      : super(const SubmissionState.idle());

  final AuthCubit authCubit;
  final TransactionsCubit transactionsCubit;
  final _transactionRepository = locator<TransactionRepository>();

  void addTransaction(TransactionInput transactionInput) {
    authCubit.state.whenOrNull(
      authenticated: (user) async {
        try {
          emit(const SubmissionState.submitting());

          final transaction = await _transactionRepository.addTransaction(
              transactionInput, user.uid);
          transactionsCubit.addTransaction(transaction);
          emit(const SubmissionState.success());
        } catch (e) {
          emit(const SubmissionState.failed(failure: "failure"));
        }
      },
    );
  }
}
