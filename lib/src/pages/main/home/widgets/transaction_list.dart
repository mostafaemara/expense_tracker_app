import 'package:flutter/material.dart';

import 'transaction_list_item.dart';

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
