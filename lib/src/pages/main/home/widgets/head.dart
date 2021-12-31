import 'package:expense_tracker_app/src/bloc/Home/home_cubit.dart';

import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'currency.dart';
import 'home_app_bar.dart';
import 'transaction_card.dart';

class Head extends StatelessWidget {
  const Head({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.homeTopWidgetBackgroundEndColor,
                    AppColors.homeTopWidgetBackgroundStartColor,
                  ])),
          child: SafeArea(
            child: Column(
              children: [
                const HomeAppBar(),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  AppLocalizations.of(context)!.accountBalance,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: AppColors.light20),
                ),
                const SizedBox(
                  height: 9,
                ),
                Currency(
                  amount: state.balance,
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TransactionCard(
                      color: AppColors.green,
                      icon: Image.asset(
                        "assets/images/income.png",
                        color: AppColors.green,
                      ),
                      title: AppLocalizations.of(context)!.income,
                      amount: state.income,
                    ),
                    TransactionCard(
                      color: AppColors.red,
                      icon: Image.asset(
                        "assets/images/expense.png",
                        color: AppColors.red,
                      ),
                      title: AppLocalizations.of(context)!.expenses,
                      amount: state.expeses,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 23,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
