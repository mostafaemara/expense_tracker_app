import 'package:expense_tracker_app/src/data/models/chart_type.dart';
import 'package:expense_tracker_app/src/data/models/financial_report.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

class FinancialReportState {
  final bool isLoading;
  late final FinancialReport financialReport;

  final DateTime selectedMonth;
  final TransactionType transactionType;
  final ChartType chartType;
  FinancialReportState(
    this.isLoading,
    this.financialReport,
    this.selectedMonth,
    this.transactionType,
    this.chartType,
  );
  FinancialReportState.init()
      : isLoading = true,
        selectedMonth = DateTime(DateTime.now().year, DateTime.now().month, 1),
        chartType = ChartType.linear,
        transactionType = TransactionType.expense;

  FinancialReportState copyWith({
    bool? isLoading,
    FinancialReport? financialReport,
    DateTime? selectedMonth,
    TransactionType? transactionType,
    ChartType? chartType,
  }) {
    return FinancialReportState(
      isLoading ?? this.isLoading,
      financialReport ?? this.financialReport,
      selectedMonth ?? this.selectedMonth,
      transactionType ?? this.transactionType,
      chartType ?? this.chartType,
    );
  }
}
