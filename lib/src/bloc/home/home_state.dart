part of 'home_cubit.dart';

class HomeState {
  const HomeState.init()
      : selectedDuration = DurationType.today,
        recentTransactions = const [],
        transactionsOfSelectedDuration = const [],
        isLoading = true,
        income = 0,
        expeses = 0,
        balance = 0,
        user = const User(email: "", id: "", image: "", name: "", token: "");
  HomeState(
      {required this.recentTransactions,
      required this.transactionsOfSelectedDuration,
      required this.income,
      required this.isLoading,
      required this.selectedDuration,
      required this.expeses,
      required this.balance,
      required this.user});

  final List<Transaction> recentTransactions;
  final List<Transaction> transactionsOfSelectedDuration;
  final double income;
  final bool isLoading;
  final DurationType selectedDuration;
  final double expeses;
  final double balance;
  final User user;

  HomeState copyWith(
      {List<Transaction>? recentTransactions,
      List<Transaction>? spendTransactions,
      double? income,
      bool? isLoading,
      DurationType? selectedDuration,
      double? expeses,
      double? balance,
      User? user}) {
    return HomeState(
        recentTransactions: recentTransactions ?? this.recentTransactions,
        transactionsOfSelectedDuration:
            spendTransactions ?? transactionsOfSelectedDuration,
        income: income ?? this.income,
        isLoading: isLoading ?? this.isLoading,
        selectedDuration: selectedDuration ?? this.selectedDuration,
        expeses: expeses ?? this.expeses,
        balance: balance ?? this.balance,
        user: user ?? this.user);
  }
}
