import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.color,
  }) : super(key: key);
  final Widget icon;
  final String title;
  final double amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(28))),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                  color: AppColors.light,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: icon,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: AppColors.light),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  FittedBox(
                    child: Text(
                      "${AppLocalizations.of(context)!.currencySymbol}$amount",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: AppColors.light),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
