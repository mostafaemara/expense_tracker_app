import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/src/data/models/duration_type.dart';
import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/data/models/transaction_filter.dart';

import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';

import '../../../injection.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final _transactionRepository = locator<TransactionRepository>();

  HomeCubit() : super(const HomeState.init());

  Future<void> init() async {
    try {
      final finance = await _transactionRepository.readFinance();
      final transactions = await _transactionRepository.readTransactions(
          sortType: SortType.newest, limit: 3, type: TransactionFilter.all);

      final spendTransactions = await _transactionRepository.readTransactions(
          sortType: SortType.newest,
          type: TransactionFilter.expense,
          dateTimeRange: state.selectedDuration.toDateRange());

      emit(state.copyWith(
          isLoading: false,
          spendTransactions: spendTransactions,
          recentTransactions: transactions,
          balance: finance.balance,
          expeses: finance.expense,
          income: finance.income));
    } catch (e) {
      log(
        "Error Home Cubit" + e.toString(),
      );
    }
  }

  void selectSpendDuration(
    DurationType type,
  ) async {
    try {
      emit(state.copyWith(selectedDuration: type));
      final spendTransactions = await _transactionRepository.readTransactions(
          sortType: SortType.newest,
          type: TransactionFilter.expense,
          dateTimeRange: state.selectedDuration.toDateRange());
      log(spendTransactions.length.toString());
      emit(state.copyWith(spendTransactions: spendTransactions));
    } catch (e) {
      log(
        "Error Home Cubit" + e.toString(),
      );
    }
  }
}
