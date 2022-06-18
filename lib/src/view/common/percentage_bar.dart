import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class PercentageBar extends StatelessWidget {
  const PercentageBar({
    Key? key,
    required this.totalAmount,
    required this.color,
    required this.amount,
  }) : super(key: key);

  final Color color;
  final double amount;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: color,
          ),
          width: (MediaQuery.of(context).size.width * amount) / totalAmount,
          height: 12,
        ),
      ),
    );
  }
}
