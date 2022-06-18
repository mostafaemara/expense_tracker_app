import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  final String title;
  final Color color;
  const CategoryTag({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(14)),
            width: 14,
            height: 14,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(width: 1, color: AppColors.light60),
      ),
      height: 34,
    );
  }
}
