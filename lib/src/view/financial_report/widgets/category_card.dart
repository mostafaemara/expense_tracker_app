import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
    required this.isExpense,
  }) : super(key: key);

  final Category category;
  final bool isExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.light,
          border: Border.all(color: AppColors.light40, width: 1),
          borderRadius: BorderRadius.circular(24)),
      height: 64,
      width: 156,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                color: isExpense ? AppColors.red20 : AppColors.green20,
                borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              category.iconUrl,
              color: isExpense ? AppColors.red : AppColors.green,
              width: 18,
              height: 18,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            category.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColors.dark,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          )
        ]),
      ),
    );
  }
}
