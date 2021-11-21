import 'package:expense_tracker_app/src/presentation/pages/main/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: SfCartesianChart(
        primaryYAxis: NumericAxis(
            isVisible: false, majorGridLines: const MajorGridLines(width: 0)),
        primaryXAxis: NumericAxis(
            isVisible: false, majorGridLines: const MajorGridLines(width: 0)),
        series: <ChartSeries>[
          SplineSeries<ExpenseData, double>(
            color: Theme.of(context).colorScheme.primary,
            width: 5,
            dataSource: getChartData(),
            xValueMapper: (datum, index) => datum.year,
            yValueMapper: (datum, index) => datum.sales,
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
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
