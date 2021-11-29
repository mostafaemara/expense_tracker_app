import 'package:auto_route/auto_route.dart';

import 'package:expense_tracker_app/src/presentation/pages/main/widgets/bottom_nav_bar.dart';
import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';
import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';

import 'package:flutter/material.dart';

import 'widgets/action_button.dart';
import 'widgets/expandable_fab.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        TransactionRoute(),
        TransactionRoute(),
        BudgetRoute(),
        ProfileRoute()
      ],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ExpandableFab(
        distance: 60.0,
        children: [
          ActionButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/income.png",
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            color: AppColors.green,
          ),
          ActionButton(
            color: AppColors.blue,
            onPressed: () {},
            icon: Image.asset(
              "assets/images/currency-exchange.png",
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          ActionButton(
            color: AppColors.red,
            onPressed: () {},
            icon: Image.asset(
              "assets/images/expense.png",
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavBar(
        onTap: tabsRouter.setActiveIndex,
        currentIndex: tabsRouter.activeIndex,
      ),
    );
  }
}
