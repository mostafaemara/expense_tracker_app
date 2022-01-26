import 'package:expense_tracker_app/src/bloc/submission_state.dart';
import 'package:expense_tracker_app/src/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/models/category.dart';

class NewTransactionState {
  final List<Category> categories;
  final SubmissionState<TransactionException> submissionState;
  final bool isInit;
  const NewTransactionState({
    required this.categories,
    required this.submissionState,
    required this.isInit,
  });

  const NewTransactionState.init()
      : isInit = false,
        categories = const [],
        submissionState = const SubmissionState.idle();

  NewTransactionState copyWith(
      {List<Category>? categories,
      bool? isInit,
      SubmissionState<TransactionException>? submissionState}) {
    return NewTransactionState(
        isInit: isInit ?? this.isInit,
        categories: categories ?? this.categories,
        submissionState: submissionState ?? this.submissionState);
  }
}
