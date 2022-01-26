import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';

import 'package:expense_tracker_app/src/extenstions/acount_list_helpers.dart';
import 'package:expense_tracker_app/src/extenstions/duration_type_helper.dart';
import 'package:expense_tracker_app/src/models/duration_type.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/repositories/date_repository.dart';
import 'package:expense_tracker_app/src/repositories/transactions/transaction_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "../../extenstions/transaction_list_helper.dart";
import '../../../injection.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final AccountsCubit accountsCubit;

  final _dateRepository = locator<DateRepository>();
  final _transactionRepository = locator<TransactionRepository>();
  HomeCubit({required this.accountsCubit}) : super(HomeState.init()) {
    _transactionRepository.onTransactionsChange().listen((transactions) async {
      _handleTransactionsChanges(transactions);
    });
  }

  void init() async {
    try {
      final transactions = await _transactionRepository.getAllTransactions();
      //  _handleTransactionsChanges(transactions);
    } catch (e) {
      log(
        "Error Home Cubit" + e.toString(),
      );
    }
  }

  void _handleTransactionsChanges(List<Transaction> transactions) async {
    final accounts = accountsCubit.state.accounts;

    final todayDate = await _dateRepository.readCurrentTime();

    final spentTransactions =
        transactions.filterByDate(todayDate, todayDate).filterToExpense();
    final totalIncome = transactions.totalIncomeAmount();
    final totalExpense = transactions.totalExpenseAmount();
    final totalAccountsBalance = accounts.totalBalance();
    final totalAmount = totalAccountsBalance + totalIncome - totalExpense;
    final recentTransactions = transactions.lastThree();

    emit(state.copyWith(
        recentTransactions: recentTransactions,
        income: totalIncome,
        expeses: totalExpense,
        balance: totalAmount,
        isLoading: false,
        transactionsOfSelectedDuration: spentTransactions,
        from: todayDate,
        to: todayDate));
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
