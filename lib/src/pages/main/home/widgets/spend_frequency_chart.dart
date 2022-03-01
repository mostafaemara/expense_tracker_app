import 'package:expense_tracker_app/src/application/home/home_cubit.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpendFrequencyChart extends StatelessWidget {
  const SpendFrequencyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = context.watch<HomeCubit>().state;
    final spentTransactions = homeState.transactionsOfSelectedDuration;
    final from = homeState.from;
    final to = homeState.to;
    return SizedBox(
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Expanded(
            child: SfCartesianChart(
              series: [
                SplineSeries<Transaction, DateTime>(
                  color: Theme.of(context).colorScheme.primary,
                  width: 5,
                  dataSource: spentTransactions,
                  xValueMapper: (datum, index) => datum.date,
                  yValueMapper: (datum, index) => datum.amount,
                )
              ],
              plotAreaBorderWidth: 0,
              primaryXAxis: DateTimeAxis(

                  //    isVisible: false,
                  majorGridLines: const MajorGridLines(width: 0)),
              primaryYAxis: NumericAxis(
                  // isVisible: false,
                  majorGridLines: const MajorGridLines(width: 0)),
            ),
          )
        ],
      ),
    );
  }
}
