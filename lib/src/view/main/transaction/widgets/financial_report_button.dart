import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class FinancialReportButton extends StatelessWidget {
  const FinancialReportButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.violet20, borderRadius: BorderRadius.circular(8)),
        height: 48,
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Text(
              "See your financial report",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColors.violet, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Image.asset(
              "assets/images/arrow_right_2.png",
              color: AppColors.violet,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
