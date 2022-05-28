import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_state.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'financial_report_state.dart';

class FinancialReportCubit extends Cubit<FinancialReportState> {
  FinancialReportCubit() : super(FinancialReportState.init());
  final _transactionsRepo = locator<TransactionRepository>();
  void init() async {
    try {
      if (state.isLoading == false) {
        emit(state.copyWith(
          isLoading: true,
        ));
      }
      //TODO Add select month
      final financialReport =
          await _transactionsRepo.readFinancialReport(DateTime.now());
      emit(state.copyWith(isLoading: false, financialReport: financialReport));
    } catch (e) {
      log(e.toString());
    }
  }
}
