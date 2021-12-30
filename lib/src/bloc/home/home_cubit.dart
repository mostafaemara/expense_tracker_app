import 'package:bloc/bloc.dart';

import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/models/duration_type.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/repositories/date_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "../../extenstions/transaction_list_helper.dart";
import '../../../injection.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final TransactionsCubit _transactionsCubit;
  final _dateRepository = locator<DateRepository>();
  HomeCubit(this._transactionsCubit) : super(HomeState.init()) {
    init();
  }

  void init() async {
    _transactionsCubit.stream.listen((transactionState) async {
      final currentDate = await _dateRepository.readCurrentTime();

      final filterTransactions =
          transactionState.transactions.filterByDate(currentDate, currentDate);
      emit(state.copyWith(
          isLoading: false,
          transactionsOfSelectedDuration: filterTransactions,
          from: currentDate,
          to: currentDate));
    });
  }

  void selectSpendDuration(DurationType type) async {
    final todayDate = await _dateRepository.readCurrentTime();
    final transactions = _transactionsCubit.state.transactions;
    late DateTime fromDate = type.when(
        today: () => todayDate,
        week: () => todayDate.subtract(const Duration(days: 7)),
        month: () =>
            DateTime(todayDate.year, todayDate.month - 1, todayDate.day),
        year: () =>
            DateTime(todayDate.year - 1, todayDate.month, todayDate.day));

    final filteredTransactions = transactions.filterByDate(fromDate, todayDate);

    emit(state.copyWith(
        transactionsOfSelectedDuration: filteredTransactions,
        from: fromDate,
        to: todayDate));
  }
}
