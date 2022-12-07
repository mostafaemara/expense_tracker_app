import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/account_details/account_details_state.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction_filter.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  AccountDetailsCubit() : super(const AccountDetailsState.init());

  final transactionRepo = locator<TransactionRepository>();

  void init(Account account) async {
    try {
      final transactions = await transactionRepo.getTransactionsOfDates(
          accountId: account.id,
          type: TransactionFilter.all,
          sortType: SortType.newest);

      emit(state.copyWith(
          account: account, isLoading: false, transactions: transactions));
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }
}
