import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SpendFrequencyChart extends StatelessWidget {
  const SpendFrequencyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 16,
            ),
            child: Text(
              AppLocalizations.of(context)!.spendFrequency,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: SfCartesianChart(
              series: [
                SplineSeries<ExpenseData, DateTime>(
                  color: Theme.of(context).colorScheme.primary,
                  width: 5,
                  dataSource: getChartData(),
                  xValueMapper: (datum, index) => datum.date,
                  yValueMapper: (datum, index) => datum.amount,
                )
              ],
              plotAreaBorderWidth: 0,
              primaryXAxis: DateTimeAxis(
                  isVisible: false,
                  maximum: DateTime(2021, 11, 8),
                  minimum: DateTime(2021, 11, 1),
                  majorGridLines: const MajorGridLines(width: 0)),
              primaryYAxis: NumericAxis(
                  isVisible: false,
                  majorGridLines: const MajorGridLines(width: 0)),
            ),
          )
        ],
      ),
    );
  }
}

List<ExpenseData> getChartData() {
  final List<ExpenseData> expenseData = [
    ExpenseData(DateTime(2021, 11, 1), 500),
    ExpenseData(DateTime(2021, 11, 2), 100),
    ExpenseData(DateTime(2021, 11, 4), 1000),
    ExpenseData(DateTime(2021, 11, 5), 300),
    ExpenseData(DateTime(2021, 11, 6), 220),
    ExpenseData(DateTime(2021, 11, 7), 600),
    ExpenseData(DateTime(2021, 11, 8), 20),
  ];
  return expenseData;
}

class ExpenseData {
  final DateTime date;
  final double amount;

  ExpenseData(this.date, this.amount);
}
