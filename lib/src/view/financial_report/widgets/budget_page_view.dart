import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/financial_report/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BudgetPageView extends StatelessWidget {
  final List<Category> categories;
  final int budgets;
  final int exceededBudgets;

  const BudgetPageView({
    Key? key,
    required this.categories,
    required this.budgets,
    required this.exceededBudgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: AppColors.violet,
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
            Text(
              "$exceededBudgets ${AppLocalizations.of(context)!.ofOf} $budgets ${AppLocalizations.of(context)!.budgetExceed}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.light,
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                  categories.length,
                  (index) => CategoryCard(
                        category: categories[index],
                        isExpense: true,
                      )),
            ),
            const Spacer(),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.light, onPrimary: AppColors.violet),
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.seeFullDetail)),
            ),
            const SizedBox(
              height: 62,
            ),
          ],
        ));
  }
}
