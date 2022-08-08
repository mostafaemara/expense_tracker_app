import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:expense_tracker_app/src/data/models/duration_type.dart';

import 'package:expense_tracker_app/src/styles/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DurationTabbar extends StatefulWidget {
  final Function(DurationType type) onChanged;
  const DurationTabbar({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<DurationTabbar> createState() => _DurationTabbarState();
}

class _DurationTabbarState extends State<DurationTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
        color: AppColors.yellow,
        fontSize: Theme.of(context).textTheme.subtitle2!.fontSize,
        fontFamily: Theme.of(context).textTheme.subtitle2!.fontFamily);
    final unselectedlabelStyle = TextStyle(
        color: AppColors.light20,
        fontSize: Theme.of(context).textTheme.subtitle2!.fontSize,
        fontFamily: Theme.of(context).textTheme.subtitle2!.fontFamily);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TabBar(
        onTap: (value) {
          late DurationType type;
          switch (value) {
            case 0:
              type = DurationType.today;

              break;
            case 1:
              type = DurationType.week;
              break;
            case 2:
              type = DurationType.month;
              break;
            case 3:
              type = DurationType.year;
              break;
          }

          widget.onChanged(type);
        },
        labelStyle: labelStyle,
        unselectedLabelStyle: unselectedlabelStyle,
        isScrollable: false,
        labelColor: AppColors.yellow,
        unselectedLabelColor: AppColors.light20,
        indicator: const BubbleTabIndicator(
          indicatorRadius: 16,
          indicatorHeight: 34.0,
          indicatorColor: AppColors.yellow20,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
          // Other flags
          // indicatorRadius: 1,
          // insets: EdgeInsets.all(1),
          // padding: EdgeInsets.all(10)
        ),
        controller: _tabController,
        tabs: [
          Tab(
            text: AppLocalizations.of(context)!.today,
          ),
          Tab(
            text: AppLocalizations.of(context)!.week,
          ),
          Tab(
            text: AppLocalizations.of(context)!.month,
          ),
          Tab(
            text: AppLocalizations.of(context)!.year,
          ),
        ],
      ),
    );
  }
}
