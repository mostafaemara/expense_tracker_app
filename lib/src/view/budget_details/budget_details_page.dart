import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/budgets/budgets_cubit.dart';
import 'package:expense_tracker_app/src/data/models/budget.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/common/category_card.dart';
import 'package:expense_tracker_app/src/view/common/percentage_bar.dart';
import 'package:expense_tracker_app/src/view/common/remove_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetDetailsPage extends StatelessWidget {
  const BudgetDetailsPage({Key? key, required this.budget}) : super(key: key);
  final Budget budget;
  @override
  Widget build(BuildContext context) {
    bool isExceededLimit = budget.amountSpent > budget.amount;
    final remaining = budget.amount - budget.amountSpent < 0
        ? 0
        : budget.amount - budget.amountSpent;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context)
            .appBarTheme
            .iconTheme!
            .copyWith(color: AppColors.dark),
        title: Text(
          "Budget Details",
          style: Theme.of(context)
              .appBarTheme
              .titleTextStyle!
              .copyWith(color: AppColors.dark),
        ),
        actions: [
          DeleteButton(
            color: AppColors.dark,
            body: "Are you sure do you wanna remove this budget?",
            title: "Remove this budget?",
            onDeleteConfirmed: () async {
              await context.read<BudgetsCubit>().deleteBudget(budget.id);
              AutoRouter.of(context).pop(true);
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 16,
            ),
            CategoryCard(category: budget.category),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Remaining",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "\$$remaining",
              style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 32,
            ),
            PercentageBar(
                totalAmount: budget.amount,
                color: budget.category.color,
                amount: budget.amountSpent),
            const SizedBox(
              height: 32,
            ),
            if (isExceededLimit)
              Container(
                height: 40,
                width: 218,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppColors.light),
                      child: const Text(
                        "!",
                        style: TextStyle(
                            color: AppColors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      "You’ve exceed the limit",
                      style: TextStyle(color: AppColors.light, fontSize: 14),
                    )
                  ],
                ),
              ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 18)),
                    onPressed: () async {
                      final result = await AutoRouter.of(context)
                          .push(NewBudgetRoute(budget: budget));
                      if (result != null) {
                        AutoRouter.of(context).pop(result);
                      }
                    },
                    child: const Text("Edit"))),
            const SizedBox(
              height: 70,
            )
          ]),
        ),
      ),
    );
  }
}
