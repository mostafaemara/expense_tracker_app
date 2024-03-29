import 'package:expense_tracker_app/src/data/models/duration_type.dart';
import 'package:expense_tracker_app/src/helpers/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:expense_tracker_app/src/data/models/transaction.dart';

import '../../bloc/config/config_cubit.dart';

class LinearTransactionChart extends StatelessWidget {
  final List<Transaction> transactions;
  final DurationType? durationType;
  const LinearTransactionChart({
    Key? key,
    required this.transactions,
    this.durationType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dateRange = durationType?.toDateRange();
    final currency = context.watch<ConfigCubit>().state.currency;
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          PositionedDirectional(
              start: 50,
              top: 8,
              child: Text(
                context.t.amountWithCurrency(totalAmount(), currency.symbol),
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              )),
          SfCartesianChart(
            series: [
              SplineSeries<Transaction, DateTime>(
                color: Theme.of(context).colorScheme.primary,
                width: 5,
                splineType: SplineType.cardinal,
                dataSource: transactions,
                xValueMapper: (datum, index) => datum.date,
                yValueMapper: (datum, index) => datum.amount,
              )
            ],
            plotAreaBorderWidth: 0,
            primaryXAxis: DateTimeAxis(
                isVisible: true,
                majorGridLines: const MajorGridLines(width: 0)),
            primaryYAxis: NumericAxis(
                isVisible: true,
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
