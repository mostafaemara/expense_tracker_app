import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';

import 'package:flutter/material.dart';

import 'common/add_new_transaction_button.dart';
import 'common/bottom_nav_bar.dart';

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
