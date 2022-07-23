import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/new_budget/new_budget_state.dart';
import 'package:expense_tracker_app/src/bloc/submission_status.dart';
import 'package:expense_tracker_app/src/data/models/budget.dart';
import 'package:expense_tracker_app/src/data/repositories/budget_repository.dart';
import 'package:expense_tracker_app/src/helpers/exception_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/transaction_repository.dart';

class NewBudgetCubit extends Cubit<NewBudgetState> {
  final _transactionRepository = locator<TransactionRepository>();
  final _budgetRepo = locator<BudgetRepository>();
  NewBudgetCubit() : super(const NewBudgetState.init());

  void init() async {
    try {
      emit(state.copyWith(
        status: Status.loading,
      ));
      final categories = await _transactionRepository.getAllCategories();

      emit(state.copyWith(
        status: Status.idle,
        categories: categories,
      ));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(error: error));
    }
  }

  void addBudget(BudgetInput input) async {
    try {
      emit(state.copyWith(
        status: Status.loading,
      ));

      await _budgetRepo.addBudget(input);

      emit(state.copyWith(status: Status.success));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(status: Status.error, error: error));
    }
  }

  void updateBudget(BudgetInput input, String id) async {
    try {
      emit(state.copyWith(
        status: Status.loading,
      ));

      await _budgetRepo.updateBudget(input, id);

      emit(state.copyWith(status: Status.success));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(status: Status.error, error: error));
    }
  }
}
