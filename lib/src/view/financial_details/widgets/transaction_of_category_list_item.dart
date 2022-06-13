import 'package:expense_tracker_app/src/data/models/transaction_of_category.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
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
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: transactionOfCategory.category.color,
                      borderRadius: BorderRadius.circular(14)),
                  width: 14,
                  height: 14,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  transactionOfCategory.category.title,
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(width: 1, color: AppColors.light60),
            ),
            height: 34,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.light40,
            ),
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transactionOfCategory.category.color,
                ),
                width: (width * transactionOfCategory.amount) / totalAmount,
                height: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
