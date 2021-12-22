import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hour = DateFormat('hh:mm a').format(DateTime.now());
    return Container(
      padding: const EdgeInsets.all(14),
      height: 90,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.red20,
                borderRadius: BorderRadius.circular(16)),
            height: 60,
            child: Image.asset(
              "assets/images/expense.png",
              color: AppColors.red,
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Title",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Salary for July",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: AppColors.light20),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "-\$80",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: AppColors.red, fontWeight: FontWeight.w600),
                ),
                Text(
                  hour,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: AppColors.light20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
