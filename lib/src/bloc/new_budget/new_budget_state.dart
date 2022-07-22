import 'package:expense_tracker_app/src/bloc/submission_status.dart';

import '../../data/models/category.dart';

class NewBudgetState {
  final List<Category> categories;
  final Status status;

  final String error;

  const NewBudgetState(
      {required this.categories, required this.status, required this.error});

  const NewBudgetState.init()
      : categories = const [],
        error = "",
        status = Status.idle;

  NewBudgetState copyWith(
      {List<Category>? categories, String? error, Status? status}) {
    return NewBudgetState(
        error: error ?? this.error,
        categories: categories ?? this.categories,
        status: status ?? this.status);
  }
}
