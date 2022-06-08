import 'package:expense_tracker_app/src/data/models/chart_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/view/financial_details/widgets/transactions_list_view.dart';
import 'package:flutter/cupertino.dart';

class TransactionSheet extends StatelessWidget {
  const TransactionSheet(
      {Key? key, required this.chartType, required this.transactions})
      : super(key: key);

  final ChartType chartType;
  final List<Transaction> transactions;
  @override
  Widget build(BuildContext context) {
    return TransactionsListView(transactions: transactions);
  }
}
