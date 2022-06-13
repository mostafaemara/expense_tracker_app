import 'package:expense_tracker_app/src/data/models/transaction_of_category.dart';
import 'package:expense_tracker_app/src/view/financial_details/widgets/transaction_of_category_list_item.dart';
import 'package:flutter/material.dart';

class TransactionOfCategoryListView extends StatelessWidget {
  const TransactionOfCategoryListView(
      {Key? key, required this.transactions, required this.amount})
      : super(key: key);

  final List<TransactionOfCategory> transactions;
  final double amount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (_, i) => TransactionOfCategoryListItem(
          transactionOfCategory: transactions[i], totalAmount: amount),
    );
  }
}
