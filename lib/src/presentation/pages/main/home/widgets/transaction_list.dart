import 'package:expense_tracker_app/src/presentation/pages/main/home/widgets/transaction_list_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TransactionListItem(),
      itemCount: 4,
    );
  }
}
