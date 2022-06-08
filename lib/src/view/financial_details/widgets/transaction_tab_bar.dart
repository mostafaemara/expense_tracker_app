import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransactionTabBar extends StatefulWidget {
  const TransactionTabBar({Key? key, required this.onChange}) : super(key: key);
  final void Function(TransactionType type) onChange;
  @override
  State<TransactionTabBar> createState() => _TransactionTabBarState();
}

class _TransactionTabBarState extends State<TransactionTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
        color: AppColors.dark,
        fontSize: Theme.of(context).textTheme.subtitle2!.fontSize,
        fontFamily: Theme.of(context).textTheme.subtitle2!.fontFamily);
    final unselectedlabelStyle = TextStyle(
        color: AppColors.dark,
        fontSize: Theme.of(context).textTheme.subtitle2!.fontSize,
        fontFamily: Theme.of(context).textTheme.subtitle2!.fontFamily);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: AppColors.light60, borderRadius: BorderRadius.circular(32)),
        child: TabBar(
          onTap: (value) {
            switch (value) {
              case 0:
                widget.onChange(TransactionType.expense);

                break;
              case 1:
                widget.onChange(TransactionType.income);
                break;
            }
          },
          labelStyle: labelStyle,
          unselectedLabelStyle: unselectedlabelStyle,
          isScrollable: false,
          labelColor: Theme.of(context).colorScheme.onPrimary,
          unselectedLabelColor: AppColors.dark,
          indicator: BubbleTabIndicator(
            indicatorRadius: 32,
            indicatorHeight: 48.0,
            indicatorColor: Theme.of(context).colorScheme.primary,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
            // Other flags
            // indicatorRadius: 1,
            // insets: EdgeInsets.all(1),
            // padding: EdgeInsets.all(10)
          ),
          controller: _tabController,
          tabs: [
            Tab(
              height: 48,
              text: AppLocalizations.of(context)!.expense,
            ),
            Tab(
              height: 48,
              text: AppLocalizations.of(context)!.income,
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionTab extends StatelessWidget {
  const _TransactionTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: ElevatedButton(onPressed: () {}, child: const Text("expense")),
    );
  }
}
