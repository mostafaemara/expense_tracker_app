import 'package:auto_route/auto_route.dart';

import 'package:expense_tracker_app/src/presentation/pages/main/widgets/bottom_nav_bar.dart';
import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';

import 'package:flutter/material.dart';

import 'widgets/add_new_transaction_button.dart';

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
      floatingActionButton: const AddNewTransactionButton(),
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavBar(
        onTap: tabsRouter.setActiveIndex,
        currentIndex: tabsRouter.activeIndex,
      ),
    );
  }
}
