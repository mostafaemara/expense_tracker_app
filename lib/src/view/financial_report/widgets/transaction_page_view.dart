import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransactionPageView extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final String title;
  final double amount;
  final double biggestAmmount;
  final Category category;
  final String body;
  final String symbol;
  const TransactionPageView(
      {Key? key,
      required this.title,
      required this.amount,
      required this.category,
      required this.body,
      required this.color,
      required this.backgroundColor,
      required this.biggestAmmount,
      required this.symbol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: color,
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
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                ),
                Text(
                  " $symbol",
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
            Text(
              "\$$amount",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 64),
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
                    body,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColors.dark,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
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
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.network(
                          category.iconUrl,
                          color: color,
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
                ),
                const Spacer(),
                Text(
                  "\$$biggestAmmount",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColors.dark,
                      fontWeight: FontWeight.w500,
                      fontSize: 36),
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
