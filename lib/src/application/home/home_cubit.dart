import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/src/data/models/duration_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

import 'package:expense_tracker_app/src/data/repositories/date_repository.dart';

import 'package:expense_tracker_app/src/extenstions/acount_list_helpers.dart';
import 'package:expense_tracker_app/src/extenstions/duration_type_helper.dart';

import 'package:expense_tracker_app/src/data/repositories/interfaces/accounts_repository.dart';

import 'package:expense_tracker_app/src/data/repositories/interfaces/transaction_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "../../extenstions/transaction_list_helper.dart";
import '../../../injection.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final _dateRepository = locator<DateRepository>();
  final _transactionRepository = locator<TransactionRepository>();
  final _accountsRepository = locator<AccountsRepository>();

  HomeCubit() : super(HomeState.init()) {
    _transactionRepository.onTransactionsChange().listen((transactions) async {
      _handleTransactionsChanges(transactions);
    });
  }

  void init() async {
    try {
      await _transactionRepository.getAllTransactions();
      final finance = await _transactionRepository.readFinance();

      emit(state.copyWith(
          balance: finance.balance,
          expeses: finance.expense,
          income: finance.income));
      //  _handleTransactionsChanges(transactions);
    } catch (e) {
      log(
        "Error Home Cubit" + e.toString(),
      );
    }
  }

  void _handleTransactionsChanges(List<Transaction> transactions) async {
    try {
      final todayDate = await _dateRepository.readCurrentTime();

      final spentTransactions =
          transactions.filterByDate(todayDate, todayDate).filterToExpense();

      final finance = await _transactionRepository.readFinance();

      final recentTransactions = transactions.lastThree();

      emit(state.copyWith(
          recentTransactions: recentTransactions,
          income: finance.income,
          expeses: finance.expense,
          balance: finance.balance,
          isLoading: false,
          transactionsOfSelectedDuration: spentTransactions,
          from: todayDate,
          to: todayDate));
    } catch (e) {
      log(e.toString());
    }
  }

  void selectSpendDuration(DurationType type) async {
    final todayDate = await _dateRepository.readCurrentTime();
    final transactions = await _transactionRepository.getAllTransactions();
    final fromDate = type.toDateTime(todayDate);
    final filteredTransactions =
        transactions.filterByDate(fromDate, todayDate).filterToExpense();

    emit(state.copyWith(
        transactionsOfSelectedDuration: filteredTransactions,
        from: fromDate,
        to: todayDate));
  }
}
