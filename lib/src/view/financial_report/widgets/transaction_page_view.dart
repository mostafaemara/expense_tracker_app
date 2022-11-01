import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/common/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransactionPageView extends StatelessWidget {
  final double transactionsAmount;
  final Transaction highestTransaction;

  const TransactionPageView(
      {Key? key,
      required this.transactionsAmount,
      required this.highestTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isExpense = highestTransaction.type == TransactionType.expense;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: highestTransaction.type.toColor(),
        child: Column(
          children: [
            const SizedBox(
              height: 102,
            ),
            Text(
              AppLocalizations.of(context)!.thisMonth,
              style: TextStyle(
                  color: Colors.white.withOpacity(.72),
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 142,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isExpense
                      ? AppLocalizations.of(context)!.youSpend
                      : AppLocalizations.of(context)!.youEarned,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                ),
                Text(
                  " ${isExpense ? "💸" : "💰"}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            FittedBox(
              child: Text(
                "\$$transactionsAmount",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 64),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.light),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    isExpense
                        ? AppLocalizations.of(context)!.biggestSpend
                        : AppLocalizations.of(context)!.biggestIncome,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColors.dark,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                ),
                const Spacer(),
                CategoryCard(
                  category: highestTransaction.category,
                ),
                const Spacer(),
                FittedBox(
                  child: Text(
                    "\$${highestTransaction.amount}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColors.dark,
                        fontWeight: FontWeight.w500,
                        fontSize: 36),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
              ]),
            )),
            const SizedBox(
              height: 62,
            ),
          ],
        ));
  }
}
