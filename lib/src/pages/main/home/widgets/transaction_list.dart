import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:flutter/material.dart';

import 'transaction_list_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);
  final List<Transaction> transactions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          transactions.length,
          (index) => TransactionListItem(
                transaction: transactions[index],
              )),
    );
  }
}
