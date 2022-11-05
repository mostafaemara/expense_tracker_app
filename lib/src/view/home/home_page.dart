import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/home/home_cubit.dart';
import 'package:expense_tracker_app/src/data/models/duration_type.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/common/transaction_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/head.dart';
import 'widgets/duration_tabbar.dart';
import '../common/linear_transaction_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    context.read<HomeCubit>().init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          color: AppColors.homeTopWidgetBackgroundEndColor,
          child: RefreshIndicator(
            onRefresh: () async {
              await context.read<HomeCubit>().init();
            },
            child: SingleChildScrollView(
              child: Container(
                color: AppColors.light,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Head(),
                    const SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 16,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.spendFrequency,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    LinearTransactionChart(
                      transactions: state.transactionsOfSelectedDuration,
                    ),
                    DurationTabbar(
                      onChanged: (DurationType type) {
                        context.read<HomeCubit>().selectSpendDuration(type);
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
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
                                  foregroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
                              onPressed: () {
                                AutoRouter.of(context)
                                    .navigate(const TransactionRoute());
                              },
                              child: Text(AppLocalizations.of(context)!.seeAll))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 290,
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return Column(
                            children: List.generate(
                                state.recentTransactions.length,
                                (index) => TransactionListItem(
                                      transaction:
                                          state.recentTransactions[index],
                                      onPressed: () async {
                                        final result =
                                            await AutoRouter.of(context).push(
                                                TransactionDetailsRoute(
                                                    transaction: state
                                                            .recentTransactions[
                                                        index]));

                                        if (result != null) {
                                          context.read<HomeCubit>().init();
                                        }
                                      },
                                    )),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
