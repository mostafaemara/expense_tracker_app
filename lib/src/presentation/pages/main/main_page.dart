import 'package:auto_route/auto_route.dart';

import 'package:expense_tracker_app/src/presentation/pages/main/widgets/bottom_nav_bar.dart';
import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';
import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';

import 'package:flutter/material.dart';

import 'widgets/action_button.dart';
import 'widgets/expandable_fab.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [HomeRoute(), TransactionRoute(), BudgetRoute(), ProfileRoute()],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ExpandableFab(
        distance: 60.0,
        children: [
          ActionButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/income.png",
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            color: AppColors.green,
          ),
          ActionButton(
            color: AppColors.blue,
            onPressed: () {},
            icon: Image.asset(
              "assets/images/currency-exchange.png",
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          ActionButton(
            color: AppColors.red,
            onPressed: () {},
            icon: Image.asset(
              "assets/images/expense.png",
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),

      //  body: SfCartesianChart(
      //  primaryYAxis: NumericAxis(
      //      isVisible: false, majorGridLines: const MajorGridLines(width: 0)),
      //   primaryXAxis: NumericAxis(
      //       isVisible: false, majorGridLines: const MajorGridLines(width: 0)),
      //   series: <ChartSeries>[
      //     SplineSeries<ExpenseData, double>(
      //       color: Theme.of(context).colorScheme.primary,
      //      width: 5,
      //     dataSource: getChartData(),
      //     xValueMapper: (datum, index) => datum.year,
      //   yValueMapper: (datum, index) => datum.sales,
      //)
      //],
      //),
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavBar(
        onTap: tabsRouter.setActiveIndex,
        currentIndex: tabsRouter.activeIndex,
      ),
    );
  }
}

List<ExpenseData> getChartData() {
  final List<ExpenseData> expenseData = [
    ExpenseData(2017, 15),
    ExpenseData(2018, 10),
    ExpenseData(2019, 20),
    ExpenseData(2020, 25),
    ExpenseData(2021, 30),
  ];
  return expenseData;
}

class ExpenseData {
  final double year;
  final double sales;

  ExpenseData(this.year, this.sales);
}
