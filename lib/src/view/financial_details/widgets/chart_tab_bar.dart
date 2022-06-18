import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:expense_tracker_app/src/data/models/chart_type.dart';
import 'package:expense_tracker_app/src/resources.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ChartTabBar extends StatefulWidget {
  const ChartTabBar({Key? key, required this.onChange}) : super(key: key);
  final void Function(ChartType type) onChange;
  @override
  State<ChartTabBar> createState() => _ChartTabBarState();
}

class _ChartTabBarState extends State<ChartTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int selectedIndex = 0;
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.light60)),
        height: 50,
        width: 100,
        child: TabBar(
          onTap: (value) {
            switch (value) {
              case 0:
                widget.onChange(ChartType.linear);

                break;
              case 1:
                widget.onChange(ChartType.pie);
                break;
            }
            setState(() {
              selectedIndex = value;
            });
          },
          splashFactory: NoSplash.splashFactory,
          indicatorPadding: EdgeInsets.zero,
          labelStyle: labelStyle,
          unselectedLabelStyle: unselectedlabelStyle,
          labelPadding: EdgeInsets.zero,
          isScrollable: false,
          labelColor: Theme.of(context).colorScheme.onPrimary,
          unselectedLabelColor: AppColors.dark,
          indicator: BubbleTabIndicator(
            indicatorHeight: 50.0,

            padding: EdgeInsets.zero, indicatorRadius: 0,

            indicatorColor: Theme.of(context).colorScheme.primary,
            tabBarIndicatorSize: TabBarIndicatorSize.label,
            // Other flags
            // indicatorRadius: 1,
            // insets: EdgeInsets.all(1),
            // padding: EdgeInsets.all(10)
          ),
          controller: _tabController,
          tabs: [
            Tab(
              child: Image.asset(
                R.icons.linearChart,
                width: 32,
                height: 32,
                color: selectedIndex == 0 ? AppColors.light : AppColors.violet,
              ),
            ),
            Tab(
              child: Image.asset(
                R.icons.pieChart,
                width: 32,
                height: 32,
                color: selectedIndex == 1 ? AppColors.light : AppColors.violet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
