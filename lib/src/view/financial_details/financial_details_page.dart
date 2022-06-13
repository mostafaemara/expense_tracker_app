import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_bloc.dart';
import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_state.dart';
import 'package:expense_tracker_app/src/data/models/chart_type.dart';
import 'package:expense_tracker_app/src/data/models/financial_report.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/helpers/transaction_helper.dart';
import 'package:expense_tracker_app/src/view/common/linear_transaction_chart.dart';
import 'package:expense_tracker_app/src/view/financial_details/widgets/chart_tab_bar.dart';
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
          final _transactions = state.transactionType == TransactionType.expense
              ? state.financialReport.expenses
              : state.financialReport.incomes;

          final amount = state.transactionType == TransactionType.expense
              ? state.financialReport.expensesAmount
              : state.financialReport.incomesAmount;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MonthDropDownButton(
                          value: state.selectedMonth,
                          onChanged: bloc.selectMonth),
                      ChartTabBar(onChange: bloc.selectChart)
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  state.chartType == ChartType.pie
                      ? PieTransactionChart(
                          transactions: _transactions.groupByCategory(),
                          totalAmount: amount,
                        )
                      : LinearTransactionChart(transactions: _transactions),
                  const SizedBox(
                    height: 58,
                  ),
                  TransactionTabBar(onChange: bloc.selectTransactionType),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: TransactionSheet(
                        amount: amount,
                        chartType: state.chartType,
                        transactions: _transactions),
                  )
                ],
              ));
        }),
      ),
    );
  }
}
