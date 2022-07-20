import 'package:expense_tracker_app/src/bloc/home/home_cubit.dart';
import 'package:expense_tracker_app/src/bloc/profile/profile_cubit.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/head.dart';
import 'widgets/recent_transaction.dart';
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
    context.read<ProfileCubit>().init();
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
                  const RecentTransaction()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
