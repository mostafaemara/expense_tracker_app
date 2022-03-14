import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/data/models/transaction_type.dart';

class TransactionsState {
  final List<Transaction> todayTransactions;
  final List<Transaction> yesterdayTransactions;
  final TransactionType? transactionType;
  final SortType? sortType;
  final String? category;

  TransactionsState(
      {required this.todayTransactions,
      required this.yesterdayTransactions,
      this.transactionType,
      this.sortType,
      this.category});

  factory TransactionsState.init() => TransactionsState(
        todayTransactions: [],
        yesterdayTransactions: [],
      );

  TransactionsState copyWith({
    List<Transaction>? todayTransactions,
    List<Transaction>? yesterdayTransactions,
    TransactionType? transactionType,
    SortType? sortType,
    String? category,
  }) {
    return TransactionsState(
      todayTransactions: todayTransactions ?? this.todayTransactions,
      yesterdayTransactions:
          yesterdayTransactions ?? this.yesterdayTransactions,
      transactionType: transactionType ?? this.transactionType,
      sortType: sortType ?? this.sortType,
      category: category ?? this.category,
    );
  }
}
