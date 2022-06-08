import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/data/models/sort_type.dart';
import 'package:expense_tracker_app/src/data/models/transaction_filter.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'category_filter.dart';
import 'filter_title.dart';
import 'rest_button.dart';

class FilterCard extends StatefulWidget {
  const FilterCard({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> with TickerProviderStateMixin {
  final double height = 32;
  late TabController _transactionTypeTabController;
  late TabController _sortTypeTabController;
  @override
  void initState() {
    super.initState();
    final transactionState = context.read<TransactionCubit>().state;
    _transactionTypeTabController = TabController(
      initialIndex: transactionState.transactionType.index,
      vsync: this,
      length: TransactionFilter.values.length,
    );

    _sortTypeTabController = TabController(
      initialIndex: transactionState.sortType.index,
      vsync: this,
      length: SortType.values.length,
    );
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
      child: SizedBox(
        height: 495,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                FilterTitle(
                  title: "Filter Transaction",
                ),
                RestButton()
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const FilterTitle(
              title: "Filter By",
            ),
            const SizedBox(
              height: 16,
            ),
            TabBar(
              onTap: _handleOnFilterTap,
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Expense",
                ),
                Tab(
                  text: "Income",
                ),
              ],
              isScrollable: false,
              indicatorColor: Theme.of(context).colorScheme.secondary,
              labelStyle: labelStyle,
              unselectedLabelStyle: unselectedlabelStyle,
              labelColor: Theme.of(context).colorScheme.onSecondary,
              unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
              indicator: BubbleTabIndicator(
                indicatorRadius: 16,
                indicatorHeight: 34.0,
                indicatorColor: Theme.of(context).colorScheme.secondary,
              ),
              controller: _transactionTypeTabController,
            ),
            const SizedBox(
              height: 16,
            ),
            const FilterTitle(
              title: "Sort By",
            ),
            const SizedBox(
              height: 16,
            ),
            TabBar(
              onTap: _handleOnSortTap,
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  text: "Newest",
                ),
                Tab(
                  text: "Oldest",
                ),
                Tab(
                  text: "Highest",
                ),
                Tab(
                  text: "Lowest",
                ),
              ],
              isScrollable: false,
              indicatorColor: Theme.of(context).colorScheme.secondary,
              labelStyle: labelStyle,
              unselectedLabelStyle: unselectedlabelStyle,
              labelColor: Theme.of(context).colorScheme.onSecondary,
              unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
              indicator: BubbleTabIndicator(
                indicatorRadius: 16,
                indicatorHeight: 34.0,
                indicatorColor: Theme.of(context).colorScheme.secondary,
              ),
              controller: _sortTypeTabController,
            ),
            const SizedBox(
              height: 16,
            ),
            const FilterTitle(
              title: "Category",
            ),
            const SizedBox(
              height: 16,
            ),
            const CategoryFilter(),
            const Spacer(),
            SizedBox(
                height: 56,
                child: ElevatedButton(
                    onPressed: () {
                      context.read<TransactionCubit>().applyFilter();
                      Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context)!.apply))),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _handleOnFilterTap(int index) {
    final transCubit = context.read<TransactionCubit>();

    switch (index) {
      case 0:
        transCubit.selectTransactionType(TransactionFilter.all);
        break;
      case 1:
        transCubit.selectTransactionType(TransactionFilter.expense);
        break;
      case 2:
        transCubit.selectTransactionType(TransactionFilter.income);
        break;
    }
  }

  void _handleOnSortTap(int index) {
    final transCubit = context.read<TransactionCubit>();

    switch (index) {
      case 0:
        transCubit.selectSortType(SortType.newest);
        break;
      case 1:
        transCubit.selectSortType(SortType.oldest);
        break;
      case 2:
        transCubit.selectSortType(SortType.highest);
        break;
      case 3:
        transCubit.selectSortType(SortType.lowest);
        break;
    }
  }
}
