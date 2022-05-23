import 'package:expense_tracker_app/src/data/models/transactions_of_date.dart';
import 'package:expense_tracker_app/src/view/main/transaction/widgets/transactions_of_date_list_item.dart';
import 'package:flutter/material.dart';

class TransactionsOfDateListView extends StatelessWidget {
  final List<TransactionsOfDate> transactionsOfDates;
  const TransactionsOfDateListView({
    Key? key,
    required this.transactionsOfDates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          children: List.generate(
            transactionsOfDates.length,
            (index) => TransactionsOfDateListItem(
              transactionsOfDate: transactionsOfDates[index],
              key: Key(transactionsOfDates[index].date.toString()),
            ),
          ),
        ));
  }
}
