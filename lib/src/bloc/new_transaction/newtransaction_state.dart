import 'package:expense_tracker_app/src/data/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';

import '../submission_state.dart';

class NewTransactionState {
  final List<Category> categories;
  final SubmissionState<TransactionException> submissionState;
  final bool isInit;
  final List<Account> accounts;
  final List<Account> targetAccounts;

  final Category? selectedCategory;
  final String? selectedAccount;
  final String? selectedTargetAccount;
  final String? selectedAttachment;

  const NewTransactionState({
    required this.targetAccounts,
    required this.selectedTargetAccount,
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
        selectedTargetAccount = null,
        selectedAttachment = null,
        selectedCategory = null,
        selectedAccount = null,
        targetAccounts = const [],
        accounts = const [],
        categories = const [],
        submissionState = const SubmissionState.idle();

  NewTransactionState copyWith(
      {List<Category>? categories,
      List<Account>? accounts,
      List<Account>? targetAccounts,
      bool? isInit,
      Category? selectedCategory,
      String? selectedAccount,
      String? selectedTargetAccount,
      String? selectedAttachment,
      SubmissionState<TransactionException>? submissionState}) {
    return NewTransactionState(
        selectedTargetAccount:
            selectedTargetAccount ?? this.selectedTargetAccount,
        targetAccounts: targetAccounts ?? this.targetAccounts,
        selectedAttachment: selectedAttachment ?? this.selectedAttachment,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        selectedAccount: selectedAccount ?? this.selectedAccount,
        accounts: accounts ?? this.accounts,
        isInit: isInit ?? this.isInit,
        categories: categories ?? this.categories,
        submissionState: submissionState ?? this.submissionState);
  }
}
