import 'package:expense_tracker_app/src/data/models/financial_report.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/view/financial_details/widgets/pie_transaction_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FinancialDetailsPage extends StatelessWidget {
  final FinancialReport financialReport;
  const FinancialDetailsPage({Key? key, required this.financialReport})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.financialReport),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          PieTransactionChart(
            transactions: financialReport.expenses,
            type: TransactionType.expense,
            isByCategory: true,
          )
        ],
      )),
    );
  }
}
