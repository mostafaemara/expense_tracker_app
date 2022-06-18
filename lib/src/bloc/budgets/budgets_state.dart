import 'package:expense_tracker_app/src/data/models/budget.dart';

class BudgetState {
  final bool isLoading;
  final List<Budget> budgets;
  final int selectedMonth;

  BudgetState(this.isLoading, this.budgets, this.selectedMonth);
  BudgetState.init()
      : isLoading = true,
        budgets = [],
        selectedMonth = DateTime.now().month;
  BudgetState copyWith({
    bool? isLoading,
    List<Budget>? budgets,
    int? selectedMonth,
  }) {
    return BudgetState(
      isLoading ?? this.isLoading,
      budgets ?? this.budgets,
      selectedMonth ?? this.selectedMonth,
    );
  }
}
