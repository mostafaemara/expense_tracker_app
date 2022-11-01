import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/helpers/transaction_helper.dart';
import 'package:expense_tracker_app/src/view/common/transaction_list_item.dart';
import 'package:expense_tracker_app/src/view/financial_details/widgets/transactions_of_category_listview.dart';

import 'package:flutter/material.dart';

import '../../../styles/app_colors.dart';

enum TransactionsViewType { transaction, category }

class TransactionSheet extends StatefulWidget {
  const TransactionSheet(
      {Key? key, required this.transactions, required this.amount})
      : super(key: key);

  final List<Transaction> transactions;
  final double amount;

  @override
  State<TransactionSheet> createState() => _TransactionSheetState();
}

class _TransactionSheetState extends State<TransactionSheet> {
  TransactionsViewType type = TransactionsViewType.transaction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.light60),
              borderRadius: BorderRadius.circular(40)),
          child: DropdownButton<TransactionsViewType>(
              value: type,
              isExpanded: true,
              underline: Container(),
              borderRadius: BorderRadius.circular(12),
              icon: const Icon(Icons.arrow_drop_down_sharp),
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (v) {
                if (v != null) {
                  setState(() {
                    type = v;
                  });
                }
              },
              items: const [
                DropdownMenuItem<TransactionsViewType>(
                  value: TransactionsViewType.transaction,
                  child: FittedBox(child: Text("Transaction")),
                ),
                DropdownMenuItem<TransactionsViewType>(
                  value: TransactionsViewType.category,
                  child: FittedBox(child: Text("Category")),
                )
              ]),
        ),
        Expanded(
            child: type == TransactionsViewType.transaction
                ? ListView.builder(
                    itemCount: widget.transactions.length,
                    itemBuilder: (_, i) => TransactionListItem(
                          onPressed: () {},
                          transaction: widget.transactions[i],
                          key: Key(widget.transactions[i].id),
                        ))
                : TransactionOfCategoryListView(
                    transactions: widget.transactions.groupByCategory(),
                    amount: widget.amount,
                  ))
      ],
    );
  }
}
