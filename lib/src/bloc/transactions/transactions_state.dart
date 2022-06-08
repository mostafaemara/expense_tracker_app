import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction_filter.dart';
import 'package:expense_tracker_app/src/data/models/transactions_of_date.dart';

class TransactionsState {
  final SortType sortType;
  final List<String> selectedCategories;
  final TransactionFilter transactionType;
  final bool isLoading;
  final List<TransactionsOfDate> transactionsOfDates;
  final List<Category> categories;
  final DateTime selectedMonth;
  const TransactionsState(
      {required this.isLoading,
      required this.categories,
      required this.transactionType,
      required this.transactionsOfDates,
      required this.sortType,
      required this.selectedMonth,
      required this.selectedCategories});

  TransactionsState.init()
      : isLoading = true,
        categories = const [],
        selectedMonth = DateTime(DateTime.now().year, DateTime.now().month, 1),
        transactionType = TransactionFilter.all,
        sortType = SortType.newest,
        selectedCategories = const [],
        transactionsOfDates = const [];

  TransactionsState copyWith(
      {SortType? sortType,
      List<String>? selectedCategories,
      TransactionFilter? transactionType,
      List<TransactionsOfDate>? transactionsOfDates,
      List<Category>? categories,
      bool? isFilterActive,
      DateTime? selectedMonth,
      bool? isLoading}) {
    return TransactionsState(
      selectedMonth: selectedMonth ?? this.selectedMonth,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      sortType: sortType ?? this.sortType,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      transactionType: transactionType ?? this.transactionType,
      transactionsOfDates: transactionsOfDates ?? this.transactionsOfDates,
    );
  }

  bool isFilterActive() {
    return !(transactionType.index == 0 &&
        sortType.index == 0 &&
        selectedCategories.isEmpty);
  }
}
