import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieTransactionChart extends StatelessWidget {
  const PieTransactionChart(
      {Key? key,
      required this.transactions,
      required this.type,
      required this.isByCategory})
      : super(key: key);
  final List<Transaction> transactions;
  final TransactionType type;
  final bool isByCategory;
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
          SfCircularChart(
            series: <CircularSeries<Transaction, String>>[
              DoughnutSeries<Transaction, String>(
                  radius: "100",
                  dataSource: transactions,
                  xValueMapper: (datum, index) => datum.category.title,
                  yValueMapper: (datum, index) => datum.amount,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  dataLabelMapper: (datum, index) => datum.category.title),
            ],
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
