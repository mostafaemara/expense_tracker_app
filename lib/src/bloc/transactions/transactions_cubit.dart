import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction_filter.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'transactions_state.dart';

class TransactionCubit extends Cubit<TransactionsState> {
  final _transactionsRepo = locator<TransactionRepository>();
  TransactionCubit() : super(const TransactionsState.init());

  void init() async {
    try {
      final transactionsOfDates =
          await _transactionsRepo.getTransactionsOfDates();
      final categories = await _transactionsRepo.getAllCategories();
      emit(state.copyWith(
          categories: categories,
          isLoading: false,
          transactionsOfDates: transactionsOfDates));
    } catch (e) {
      log(e.toString());
    }
  }

  void applyFilter() async {
    try {
      emit(state.copyWith(
        isLoading: true,
      ));
      final transactionsOfDates =
          await _transactionsRepo.getTransactionsOfDates(
              categories: state.selectedCategories,
              sortType: state.sortType,
              type: state.transactionType);
      emit(state.copyWith(
          isFilterActive: true,
          isLoading: false,
          transactionsOfDates: transactionsOfDates));
    } catch (e) {
      log(e.toString());
    }
  }

  void selectTransactionType(TransactionFilter? type) {
    emit(state.copyWith(transactionType: type));
  }

  void selectSortType(SortType sortType) {
    emit(state.copyWith(sortType: sortType));
  }

  void selectCategories(List<String> categories) {
    emit(state.copyWith(selectedCategories: categories));
  }

  void restFilter() async {
    emit(state.copyWith(
        isFilterActive: false,
        transactionType: TransactionFilter.all,
        sortType: SortType.newest,
        selectedCategories: []));
    try {
      emit(state.copyWith(
        isLoading: true,
      ));
      final transactionsOfDates =
          await _transactionsRepo.getTransactionsOfDates(
              categories: state.selectedCategories,
              sortType: state.sortType,
              type: state.transactionType);
      emit(state.copyWith(
          isLoading: false, transactionsOfDates: transactionsOfDates));
    } catch (e) {
      log(e.toString());
    }
  }
}
