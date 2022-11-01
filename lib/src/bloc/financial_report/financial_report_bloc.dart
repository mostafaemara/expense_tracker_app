import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_state.dart';
import 'package:expense_tracker_app/src/data/models/chart_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinancialReportCubit extends Cubit<FinancialReportState> {
  FinancialReportCubit() : super(FinancialReportState.init());
  final _transactionsRepo = locator<TransactionRepository>();
  void init(DateTime selectedDate) async {
    try {
      if (state.isLoading == false) {
        emit(state.copyWith(
          isLoading: true,
        ));
      }
      log("bloc" + selectedDate.toIso8601String());
      //TODO Add select month
      final financialReport = await _transactionsRepo.readFinancialReport(
        selectedDate,
      );
      emit(state.copyWith(
          isLoading: false,
          financialReport: financialReport,
          selectedMonth: selectedDate));
    } catch (e) {
      log(e.toString());
    }
  }

  void selectMonth(DateTime? month) async {
    if (month != null) {
      try {
        emit(state.copyWith(
          isLoading: true,
        ));
        final _financialReport =
            await _transactionsRepo.readFinancialReport(month);
        log("Month updated" + month.toIso8601String());
        emit(state.copyWith(
            isLoading: false,
            financialReport: _financialReport,
            selectedMonth: month));
      } catch (e) {
        log(e.toString() + e.runtimeType.toString());
      }
    }
  }

  void selectChart(ChartType type) {
    emit(state.copyWith(chartType: type));
  }

  void selectTransactionType(TransactionType type) async {
    emit(state.copyWith(transactionType: type));
  }
}
