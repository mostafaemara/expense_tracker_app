import 'package:expense_tracker_app/src/data/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';

import '../submission_state.dart';

class NewTransferState {
  final SubmissionState<TransactionException> submissionState;
  final bool isInit;
  final List<Account> accounts;
  final List<Account> targetAccounts;

  final String? selectedAccount;
  final String? selectedTargetAccount;
  final String? selectedAttachment;

  const NewTransferState({
    required this.targetAccounts,
    required this.selectedTargetAccount,
    required this.selectedAttachment,
    required this.selectedAccount,
    required this.submissionState,
    required this.isInit,
    required this.accounts,
  });

  const NewTransferState.init()
      : isInit = false,
        selectedTargetAccount = null,
        selectedAttachment = null,
        selectedAccount = null,
        targetAccounts = const [],
        accounts = const [],
        submissionState = const SubmissionState.idle();

  NewTransferState copyWith(
      {List<Account>? accounts,
      List<Account>? targetAccounts,
      bool? isInit,
      String? selectedAccount,
      String? selectedTargetAccount,
      String? selectedAttachment,
      SubmissionState<TransactionException>? submissionState}) {
    return NewTransferState(
        selectedTargetAccount:
            selectedTargetAccount ?? this.selectedTargetAccount,
        targetAccounts: targetAccounts ?? this.targetAccounts,
        selectedAttachment: selectedAttachment ?? this.selectedAttachment,
        selectedAccount: selectedAccount ?? this.selectedAccount,
        accounts: accounts ?? this.accounts,
        isInit: isInit ?? this.isInit,
        submissionState: submissionState ?? this.submissionState);
  }
}
