import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/budgets/budgets_state.dart';
import 'package:expense_tracker_app/src/data/repositories/budget_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetsCubit extends Cubit<BudgetState> {
  final budgetRepo = locator<BudgetRepository>();
  BudgetsCubit() : super(BudgetState.init());

  void init() async {
    try {
      final budgets = await budgetRepo.readBudgets(state.selectedMonth);

      emit(state.copyWith(budgets: budgets, isLoading: false));
    } catch (e) {
      log("Bugets Cubit Somthing went Werong" + e.toString());
    }
  }

  void selectMonth(int month) async {
    emit(state.copyWith(selectedMonth: month));

    try {
      final budgets = await budgetRepo.readBudgets(month);

      emit(state.copyWith(budgets: budgets, isLoading: false));
    } catch (e) {
      log("Bugets Cubit Somthing went Werong" + e.toString());
    }
  }

  Future<void> deleteBudget(String id) async {
    try {
      await budgetRepo.deleteBudget(id);
    } catch (e) {
      log(e.toString());
    }
  }
}
