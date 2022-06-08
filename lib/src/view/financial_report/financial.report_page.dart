import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_bloc.dart';
import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_state.dart';
import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/financial_report/widgets/budget_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_indicator/page_indicator.dart';
import 'widgets/transaction_page_view.dart';

class FinancialReportPage extends StatefulWidget {
  const FinancialReportPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FinancialReportPage> createState() => _FinancialReportPageState();
}

class _FinancialReportPageState extends State<FinancialReportPage> {
  late PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    context
        .read<FinancialReportCubit>()
        .init(context.read<TransactionCubit>().state.selectedMonth);
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
                    highestTransaction: state.financialReport.highestExpense,
                    transactionsAmount: state.financialReport.expensesAmount,
                  ),
                  TransactionPageView(
                    transactionsAmount: state.financialReport.incomesAmount,
                    highestTransaction: state.financialReport.highestIncome,
                  ),
                  BudgetPageView(
                      budgets: state.financialReport.budgets,
                      exceededBudgets: state.financialReport.exceededBudgets)
                ],
                controller: controller,
              ),
              align: IndicatorAlign.top,
              shape: IndicatorShape.roundRectangleShape(
                  size: Size(MediaQuery.of(context).size.width / 4, 4)),
              length: 3,
              padding: const EdgeInsets.only(top: 63),
              indicatorColor: AppColors.light20,
              indicatorSelectorColor: AppColors.light,
              indicatorSpace: 10.0,
            ),
    ));
  }
}
