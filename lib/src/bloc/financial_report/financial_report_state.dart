import 'package:expense_tracker_app/src/data/models/financial_report.dart';

class FinancialReportState {
  final bool isLoading;
  late final FinancialReport financialReport;

  FinancialReportState(this.isLoading, this.financialReport);
  FinancialReportState.init() : isLoading = true;
  FinancialReportState copyWith({
    bool? isLoading,
    FinancialReport? financialReport,
  }) {
    return FinancialReportState(
      isLoading ?? this.isLoading,
      financialReport ?? this.financialReport,
    );
  }
}
