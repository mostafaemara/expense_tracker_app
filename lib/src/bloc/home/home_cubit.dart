import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';

import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/extenstions/acount_list_helpers.dart';
import 'package:expense_tracker_app/src/extenstions/duration_type_helper.dart';
import 'package:expense_tracker_app/src/models/duration_type.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/repositories/date_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "../../extenstions/transaction_list_helper.dart";
import '../../../injection.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final TransactionsCubit transactionsCubit;
  final AccountsCubit accountsCubit;

  final _dateRepository = locator<DateRepository>();
  HomeCubit({required this.transactionsCubit, required this.accountsCubit})
      : super(HomeState.init()) {
    init();
  }

  void init() async {
    transactionsCubit.stream.listen((transactionState) async {
      final transactions = transactionState.transactions;
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
    });
  }

  void selectSpendDuration(DurationType type) async {
    final todayDate = await _dateRepository.readCurrentTime();
    final transactions = transactionsCubit.state.transactions;
    final fromDate = type.toDateTime(todayDate);
    final filteredTransactions =
        transactions.filterByDate(fromDate, todayDate).filterToExpense();

    emit(state.copyWith(
        transactionsOfSelectedDuration: filteredTransactions,
        from: fromDate,
        to: todayDate));
  }
}
