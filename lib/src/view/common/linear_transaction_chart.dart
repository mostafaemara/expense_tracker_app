import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:expense_tracker_app/src/data/models/transaction.dart';

class LinearTransactionChart extends StatelessWidget {
  final List<Transaction> transactions;

  const LinearTransactionChart({
    Key? key,
    required this.transactions,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          PositionedDirectional(
              start: 16,
              top: 8,
              child: Text(
                "\$ ${totalAmount()}",
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              )),
          SfCartesianChart(
            series: [
              SplineSeries<Transaction, DateTime>(
                color: Theme.of(context).colorScheme.primary,
                width: 5,
                dataSource: transactions,
                xValueMapper: (datum, index) => datum.date,
                yValueMapper: (datum, index) => datum.amount,
              )
            ],
            plotAreaBorderWidth: 0,
            primaryXAxis: DateTimeAxis(
                isVisible: false,
                majorGridLines: const MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(
                isVisible: false,
                majorGridLines: const MajorGridLines(width: 0)),
          ),
        ],
      ),
    );
  }

  double totalAmount() {
    double amount = 0;

    for (final t in transactions) {
      amount += t.amount;
    }

    return amount;
  }
}
