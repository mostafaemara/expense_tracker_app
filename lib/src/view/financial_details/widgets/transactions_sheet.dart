import 'dart:developer';

import 'package:expense_tracker_app/src/data/models/chart_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/helpers/transaction_helper.dart';
import 'package:expense_tracker_app/src/view/common/transaction_list_item.dart';
import 'package:expense_tracker_app/src/view/financial_details/widgets/transactions_of_category_listview.dart';
import 'package:flutter/cupertino.dart';

class TransactionSheet extends StatelessWidget {
  const TransactionSheet(
      {Key? key,
      required this.chartType,
      required this.transactions,
      required this.amount})
      : super(key: key);

  final ChartType chartType;
  final List<Transaction> transactions;
  final double amount;
  @override
  Widget build(BuildContext context) {
    log("helloozz" + chartType.toString());
    return chartType == ChartType.linear
        ? ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (_, i) => TransactionListItem(
                  onPressed: () {},
                  transaction: transactions[i],
                  key: Key(transactions[i].id),
                ))
        : TransactionOfCategoryListView(
            transactions: transactions.groupByCategory(),
            amount: amount,
          );
  }
}
