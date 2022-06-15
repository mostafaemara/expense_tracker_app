import 'package:expense_tracker_app/src/data/models/budget.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/common/category_tag.dart';
import 'package:expense_tracker_app/src/view/common/percentage_bar.dart';
import 'package:flutter/cupertino.dart';

class BudgetListItem extends StatelessWidget {
  const BudgetListItem(
      {Key? key, required this.budget, required this.onPressed})
      : super(key: key);
  final Budget budget;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    bool isExceededLimit = budget.amountSpent > budget.amount;
    final remaining = budget.amount - budget.amountSpent < 0
        ? 0
        : budget.amount - budget.amountSpent;

    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryTag(
                  title: budget.category.title, color: budget.category.color),
              if (isExceededLimit)
                Container(
                  child: const Center(
                    child: Text(
                      "!",
                      style: TextStyle(color: AppColors.light),
                    ),
                  ),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.red),
                )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Remaining \$$remaining",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          PercentageBar(
              totalAmount: budget.amount,
              color: budget.category.color,
              amount: budget.amountSpent),
          const SizedBox(
            height: 8,
          ),
          Text(
            "\$${budget.amountSpent} of \$${budget.amount} ",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.light20),
          ),
          if (isExceededLimit)
            const SizedBox(
              height: 8,
            ),
          if (isExceededLimit)
            const Text(
              "You’ve exceed the limit!",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.red),
            )
        ]));
  }
}
