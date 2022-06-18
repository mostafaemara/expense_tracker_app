part of 'home_cubit.dart';

class HomeState {
  const HomeState.init()
      : selectedDuration = DurationType.today,
        recentTransactions = const [],
        transactionsOfSelectedDuration = const [],
        isLoading = true,
        income = 0,
        expeses = 0,
        balance = 0;
  HomeState(
      {required this.recentTransactions,
      required this.transactionsOfSelectedDuration,
      required this.income,
      required this.isLoading,
      required this.selectedDuration,
      required this.expeses,
      required this.balance});

  final List<Transaction> recentTransactions;
  final List<Transaction> transactionsOfSelectedDuration;
  final double income;
  final bool isLoading;
  final DurationType selectedDuration;
  final double expeses;
  final double balance;

  HomeState copyWith({
    List<Transaction>? recentTransactions,
    List<Transaction>? spendTransactions,
    double? income,
    bool? isLoading,
    DurationType? selectedDuration,
    double? expeses,
    double? balance,
  }) {
    return HomeState(
      recentTransactions: recentTransactions ?? this.recentTransactions,
      transactionsOfSelectedDuration:
          spendTransactions ?? transactionsOfSelectedDuration,
      income: income ?? this.income,
      isLoading: isLoading ?? this.isLoading,
      selectedDuration: selectedDuration ?? this.selectedDuration,
      expeses: expeses ?? this.expeses,
      balance: balance ?? this.balance,
    );
  }
}
