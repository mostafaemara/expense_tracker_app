import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'transactions_state.dart';

class TransactionCubit extends Cubit<TransactionsState> {
  TransactionCubit() : super(TransactionsState.init());

  void init() async {}

  void selectTransactionType(TransactionType type) {}
  void selectSortType(SortType sortType) {}
  void selectCategory(String category) {}
  void restFilter() {}
}
