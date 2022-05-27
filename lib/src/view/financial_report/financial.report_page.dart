import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_bloc.dart';
import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_state.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/transaction_page_view.dart';

class FinancialReportPage extends StatefulWidget {
  const FinancialReportPage({Key? key}) : super(key: key);

  @override
  State<FinancialReportPage> createState() => _FinancialReportPageState();
}

class _FinancialReportPageState extends State<FinancialReportPage> {
  late PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    context.read<FinancialReportCubit>().init();
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<FinancialReportCubit, FinancialReportState>(
      builder: (context, state) => state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : PageIndicatorContainer(
              child: PageView(
                children: <Widget>[
                  TransactionPageView(
                    symbol: " 💸",
                    backgroundColor: AppColors.red20,
                    amount: state.financialReport.totalExpense,
                    biggestAmmount: state.financialReport.biggestExpense,
                    body: AppLocalizations.of(context)!.biggestSpend,
                    category: state.financialReport.highestExpenseCategory,
                    color: AppColors.red,
                    title: AppLocalizations.of(context)!.youSpend,
                  ),
                  TransactionPageView(
                    symbol: " 💰",
                    backgroundColor: AppColors.green20,
                    amount: state.financialReport.totalIncome,
                    biggestAmmount: state.financialReport.biggestIncome,
                    body: AppLocalizations.of(context)!.biggestSpend,
                    category: state.financialReport.highestIncomeCategory,
                    color: AppColors.green,
                    title: AppLocalizations.of(context)!.youEarned,
                  ),
                  const Text('4'),
                ],
                controller: controller,
              ),
              align: IndicatorAlign.top,
              shape: IndicatorShape.roundRectangleShape(
                  size: Size(MediaQuery.of(context).size.width / 5, 4)),
              length: 4,
              padding: const EdgeInsets.only(top: 63),
              indicatorColor: AppColors.light20,
              indicatorSelectorColor: AppColors.light,
              indicatorSpace: 10.0,
            ),
    ));
  }
}
