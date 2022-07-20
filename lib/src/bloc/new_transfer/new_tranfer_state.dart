import 'package:expense_tracker_app/src/bloc/submission_status.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';

class NewTransferState {
  final Status status;

  final List<Account> accounts;

  final String error;
  const NewTransferState(
      {required this.status, required this.accounts, required this.error});

  const NewTransferState.init()
      : accounts = const [],
        error = "",
        status = Status.idle;

  NewTransferState copyWith(
      {List<Account>? accounts, String? error, Status? status}) {
    return NewTransferState(
        accounts: accounts ?? this.accounts,
        status: status ?? this.status,
        error: error ?? this.error);
  }
}
