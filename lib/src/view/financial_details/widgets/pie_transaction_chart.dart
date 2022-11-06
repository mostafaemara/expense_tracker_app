import 'package:expense_tracker_app/src/data/models/transaction_of_category.dart';
import 'package:expense_tracker_app/src/helpers/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../bloc/config/config_cubit.dart';

class PieTransactionChart extends StatelessWidget {
  const PieTransactionChart({
    Key? key,
    required this.transactions,
    required this.totalAmount,
  }) : super(key: key);
  final List<TransactionOfCategory> transactions;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    final currency = context.watch<ConfigCubit>().state.currency;
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          SfCircularChart(
            series: <CircularSeries<TransactionOfCategory, String>>[
              DoughnutSeries<TransactionOfCategory, String>(
                  radius: "100",
                  innerRadius: "80",
                  dataSource: transactions,
                  xValueMapper: (datum, index) => datum.category.title,
                  yValueMapper: (datum, index) => datum.amount,
                  pointColorMapper: (d, index) => d.category.color,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside,
                  ),
                  dataLabelMapper: (datum, index) => datum.category.title),
            ],
          ),
          Center(
              child: SizedBox(
            width: 115,
            child: FittedBox(
              child: Text(
                context.t.amountWithCurrency(totalAmount, currency.symbol),
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
