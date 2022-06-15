import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/data/models/transaction_of_category.dart';
import 'package:expense_tracker_app/src/helpers/transaction_helper.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/common/category_tag.dart';
import 'package:expense_tracker_app/src/view/common/percentage_bar.dart';
import 'package:flutter/material.dart';

class TransactionOfCategoryListItem extends StatelessWidget {
  const TransactionOfCategoryListItem(
      {Key? key,
      required this.transactionOfCategory,
      required this.totalAmount})
      : super(key: key);
  final TransactionOfCategory transactionOfCategory;
  final double totalAmount;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryTag(
                title: transactionOfCategory.category.title,
                color: transactionOfCategory.category.color,
              ),
              Text(
                transactionOfCategory.amount.formatAmount(
                  context,
                  transactionOfCategory.category.transactionType,
                ),
                style: TextStyle(
                  fontSize: 24,
                  color: transactionOfCategory.category.transactionType ==
                          TransactionType.expense
                      ? AppColors.red
                      : AppColors.green,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          PercentageBar(
              amount: transactionOfCategory.amount,
              color: transactionOfCategory.category.color,
              totalAmount: totalAmount),
        ],
      ),
    );
  }
}
