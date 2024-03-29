import 'package:expense_tracker_app/src/data/models/transaction.dart';

import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'action_button.dart';
import 'expandable_fab.dart';

class AddNewTransactionButton extends StatelessWidget {
  const AddNewTransactionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      distance: 60.0,
      children: [
        ActionButton(
          onPressed: () => context.navigateTo(
              NewTransactionRoute(transactionType: TransactionType.income)),
          icon: Image.asset(
            "assets/images/income.png",
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          color: AppColors.green,
        ),
        ActionButton(
          color: AppColors.blue,
          onPressed: () => context.navigateTo(const NewTransferRoute()),
          icon: Image.asset(
            "assets/images/currency-exchange.png",
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        ActionButton(
          color: AppColors.red,
          onPressed: () => context.navigateTo(
              NewTransactionRoute(transactionType: TransactionType.expense)),
          icon: Image.asset(
            "assets/images/expense.png",
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
