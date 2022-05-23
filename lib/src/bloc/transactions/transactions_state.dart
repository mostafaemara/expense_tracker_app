import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/data/models/transactions_of_date.dart';

class TransactionsState {
  final SortType sortType;
  final List<String>? selectedCategories;
  final TransactionType? transactionType;
  final bool isLoading;
  final List<TransactionsOfDate> transactionsOfDates;
  final List<Category> categories;

  const TransactionsState(
      {required this.isLoading,
      required this.categories,
      this.transactionType,
      required this.transactionsOfDates,
      required this.sortType,
      this.selectedCategories});

  const TransactionsState.init()
      : isLoading = true,
        categories = const [],
        transactionType = null,
        sortType = SortType.newest,
        selectedCategories = null,
        transactionsOfDates = const [];

  TransactionsState copyWith(
      {SortType? sortType,
      List<String>? selectedCategories,
      TransactionType? transactionType,
      List<TransactionsOfDate>? transactionsOfDates,
      List<Category>? categories,
      bool? isLoading}) {
    return TransactionsState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      sortType: sortType ?? this.sortType,
      selectedCategories: selectedCategories ?? selectedCategories,
      transactionType: transactionType ?? this.transactionType,
      transactionsOfDates: transactionsOfDates ?? this.transactionsOfDates,
    );
  }
}
