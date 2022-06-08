import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';

import '../submission_status.dart';

class NewTransactionState {
  final List<Category> categories;
  final Status status;

  final List<Account> accounts;
  final String error;

  const NewTransactionState(
      {required this.categories,
      required this.status,
      required this.accounts,
      required this.error});

  const NewTransactionState.init()
      : accounts = const [],
        categories = const [],
        error = "",
        status = Status.idle;

  NewTransactionState copyWith(
      {List<Category>? categories,
      List<Account>? accounts,
      String? error,
      Status? status}) {
    return NewTransactionState(
        error: error ?? this.error,
        accounts: accounts ?? this.accounts,
        categories: categories ?? this.categories,
        status: status ?? this.status);
  }
}
