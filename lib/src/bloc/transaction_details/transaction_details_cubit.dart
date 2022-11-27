import 'dart:developer';
import 'dart:ui';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/transaction_details/transaction_details_state.dart';
import 'package:expense_tracker_app/src/helpers/exception_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/transaction.dart';
import '../../data/repositories/transaction_repository.dart';
import '../submission_status.dart';

class TransactionDetailsCubit extends Cubit<TransactionDetailsState> {
  TransactionDetailsCubit()
      : super(TransactionDetailsState(Status.loading, null, ""));
  final transactionRepo = locator<TransactionRepository>();

  void init(dynamic arg) async {
    if (arg is String) {
      try {
        final transaction = await transactionRepo.readTransaction(arg);
        emit(state.copyWith(status: Status.idle, transaction: transaction));
      } catch (e) {
        log(e.toString());
      }
    } else if (arg is Transaction) {
      emit(state.copyWith(status: Status.idle, transaction: arg));
    }
  }

  void deleteTransaction(String id) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await transactionRepo.deleteTransaction(id);
      emit(state.copyWith(error: "", status: Status.success));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(error: error, status: Status.error));
    }
  }
}
