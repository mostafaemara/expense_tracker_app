import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/main/transaction/widgets/category_filter.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    _transactionTypeTabController = TabController(
      vsync: this,
      length: 4,
    );

    _sortTypeTabController = TabController(
      vsync: this,
      length: 4,
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
                _Title(
                  title: "Filter Transaction",
                ),
                _RestButton()
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const _Title(
              title: "Filter By",
            ),
            const SizedBox(
              height: 16,
            ),
            TabBar(
              onTap: (value) {
                final transCubit =
                    context.read<TransactionCubit>().restFilter();

                switch (value) {
                  case 0:
                    break;
                  default:
                }
              },
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
                Tab(
                  text: "Transfer",
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
            const _Title(
              title: "Sort By",
            ),
            const SizedBox(
              height: 16,
            ),
            TabBar(
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
            const _Title(
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
                    },
                    child: Text(AppLocalizations.of(context)!.apply))),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _RestButton extends StatelessWidget {
  const _RestButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 71,
      height: 32,
      child: ElevatedButton(
        onPressed: () {
          context.read<TransactionCubit>().restFilter();
        },
        child: const Text(
          "Rest",
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColors.violet20,
          onPrimary: AppColors.violet,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
