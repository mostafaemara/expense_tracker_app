import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:expense_tracker_app/src/application/home/home_cubit.dart';

import 'package:expense_tracker_app/src/data/models/duration_type.dart';

import 'package:expense_tracker_app/src/styles/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'transaction_list.dart';

class RecentTransaction extends StatefulWidget {
  const RecentTransaction({Key? key}) : super(key: key);

  @override
  State<RecentTransaction> createState() => _RecentTransactionState();
}

class _RecentTransactionState extends State<RecentTransaction>
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            onTap: (value) {
              late DurationType type;
              switch (value) {
                case 0:
                  type = const DurationType.today();

                  break;
                case 1:
                  type = const DurationType.week();
                  break;
                case 2:
                  type = const DurationType.month();
                  break;
                case 3:
                  type = const DurationType.year();
                  break;
              }

              context.read<HomeCubit>().selectSpendDuration(type);
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
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.recentTransaction,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Theme.of(context).colorScheme.primary,
                      primary: Theme.of(context).colorScheme.secondary),
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.seeAll))
            ],
          ),
          SizedBox(
            height: 290,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return TransactionList(
                  transactions: state.recentTransactions,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
