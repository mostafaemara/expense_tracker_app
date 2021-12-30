part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState.init() => HomeState(
      from: DateTime.now(),
      to: DateTime.now(),
      recentTransactions: [],
      transactionsOfSelectedDuration: [],
      isLoading: true,
      income: 0,
      expeses: 0,
      balance: 0);
  factory HomeState(
      {required List<Transaction> recentTransactions,
      required List<Transaction> transactionsOfSelectedDuration,
      required double income,
      required bool isLoading,
      required DateTime from,
      required DateTime to,
      required double expeses,
      required double balance}) = _HomeState;
}
