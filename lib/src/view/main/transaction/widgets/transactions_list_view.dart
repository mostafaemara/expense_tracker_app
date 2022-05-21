import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/view/main/home/widgets/transaction_list_item.dart';

import 'package:flutter/material.dart';

class TransactionListView extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionListView({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        children: List.generate(
            transactions.length,
            (index) =>
                TransactionListItem(transaction: transactions[index])).toList(),
      ),
    );
  }
}
