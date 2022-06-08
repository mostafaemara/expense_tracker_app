import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/view/common/transaction_list_item.dart';
import 'package:flutter/widgets.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({Key? key, required this.transactions})
      : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (_, i) =>
            TransactionListItem(transaction: transactions[i]));
  }
}
