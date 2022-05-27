import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction_filter.dart';
import 'package:expense_tracker_app/src/data/models/transactions_of_date.dart';

class TransactionsState {
  final SortType sortType;
  final List<String>? selectedCategories;
  final TransactionFilter transactionType;
  final bool isLoading;
  final List<TransactionsOfDate> transactionsOfDates;
  final List<Category> categories;
  final bool isFilterActive;

  const TransactionsState(
      {required this.isLoading,
      required this.isFilterActive,
      required this.categories,
      required this.transactionType,
      required this.transactionsOfDates,
      required this.sortType,
      this.selectedCategories});

  const TransactionsState.init()
      : isLoading = true,
        isFilterActive = false,
        categories = const [],
        transactionType = TransactionFilter.all,
        sortType = SortType.newest,
        selectedCategories = null,
        transactionsOfDates = const [];

  TransactionsState copyWith(
      {SortType? sortType,
      List<String>? selectedCategories,
      TransactionFilter? transactionType,
      List<TransactionsOfDate>? transactionsOfDates,
      List<Category>? categories,
      bool? isFilterActive,
      bool? isLoading}) {
    return TransactionsState(
      isFilterActive: isFilterActive ?? this.isFilterActive,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      sortType: sortType ?? this.sortType,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      transactionType: transactionType ?? this.transactionType,
      transactionsOfDates: transactionsOfDates ?? this.transactionsOfDates,
    );
  }
}
