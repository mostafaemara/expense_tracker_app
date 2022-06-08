import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_bloc.dart';
import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_state.dart';
import 'package:expense_tracker_app/src/data/models/chart_type.dart';
import 'package:expense_tracker_app/src/data/models/financial_report.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/view/common/linear_transaction_chart.dart';
import 'package:expense_tracker_app/src/view/financial_details/widgets/pie_transaction_chart.dart';
import 'package:expense_tracker_app/src/view/financial_details/widgets/transaction_tab_bar.dart';
import 'package:expense_tracker_app/src/view/financial_details/widgets/transactions_sheet.dart';
import 'package:expense_tracker_app/src/view/transaction/widgets/month_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FinancialDetailsPage extends StatefulWidget {
  final FinancialReport financialReport;

  const FinancialDetailsPage({
    Key? key,
    required this.financialReport,
  }) : super(key: key);

  @override
  State<FinancialDetailsPage> createState() => _FinancialDetailsPageState();
}

class _FinancialDetailsPageState extends State<FinancialDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FinancialReportCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.financialReport),
      ),
      body: BlocBuilder<FinancialReportCubit, FinancialReportState>(
        builder: ((context, state) {
          final transactions = state.transactionType == TransactionType.expense
              ? widget.financialReport.expenses
              : widget.financialReport.incomes;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MonthDropDownButton(
                      value: state.selectedMonth, onChanged: bloc.selectMonth),
                  const SizedBox(
                    height: 8,
                  ),
                  state.chartType == ChartType.pie
                      ? PieTransactionChart(
                          transactions: transactions,
                          type: TransactionType.expense,
                          isByCategory: true,
                        )
                      : LinearTransactionChart(transactions: transactions),
                  TransactionTabBar(onChange: bloc.selectTransactionType),
                  Expanded(
                    child: TransactionSheet(
                        chartType: state.chartType, transactions: transactions),
                  )
                ],
              ));
        }),
      ),
    );
  }
}
