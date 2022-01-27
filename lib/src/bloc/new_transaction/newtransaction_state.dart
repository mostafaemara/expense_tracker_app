import 'package:expense_tracker_app/src/bloc/submission_state.dart';
import 'package:expense_tracker_app/src/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/models/category.dart';

class NewTransactionState {
  final List<Category> categories;
  final SubmissionState<TransactionException> submissionState;
  final bool isInit;
  final List<Account> accounts;

  final Category? selectedCategory;
  final String? selectedAccount;
  final String? selectedAttachment;

  const NewTransactionState({
    required this.selectedAttachment,
    required this.selectedAccount,
    required this.selectedCategory,
    required this.categories,
    required this.submissionState,
    required this.isInit,
    required this.accounts,
  });

  const NewTransactionState.init()
      : isInit = false,
        selectedAttachment = null,
        selectedCategory = null,
        selectedAccount = null,
        accounts = const [],
        categories = const [],
        submissionState = const SubmissionState.idle();

  NewTransactionState copyWith(
      {List<Category>? categories,
      List<Account>? accounts,
      bool? isInit,
      Category? selectedCategory,
      String? selectedAccount,
      String? selectedAttachment,
      SubmissionState<TransactionException>? submissionState}) {
    return NewTransactionState(
        selectedAttachment: selectedAttachment ?? this.selectedAttachment,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        selectedAccount: selectedAccount ?? this.selectedAccount,
        accounts: accounts ?? this.accounts,
        isInit: isInit ?? this.isInit,
        categories: categories ?? this.categories,
        submissionState: submissionState ?? this.submissionState);
  }
}
