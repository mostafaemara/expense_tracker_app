import 'package:expense_tracker_app/src/helpers/date_time_helper.dart';
import 'package:expense_tracker_app/src/helpers/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/transaction_frequencies/transaction_frequencies_cubit.dart';
import '../../../data/models/frequent_transaction.dart';
import '../../../data/models/transaction.dart';
import '../../../styles/app_colors.dart';
import '../../common/remove_button.dart';

class TransactionFrequencyTile extends StatelessWidget {
  const TransactionFrequencyTile({
    Key? key,
    required this.frequency,
  }) : super(key: key);
  final TransactionFrequency frequency;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 80,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              frequency.title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Text(
              context.t.amountWithSign(frequency.amount,
                  frequency.type == TransactionType.expense ? "-" : "+"),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: frequency.type.toColor(), fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              frequency.frequency.value.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Text(
              frequency.date.formatDateDDDDdMMyhm(),
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: AppColors.light20),
            ),
          ],
        ),
        const Spacer(),
        DeleteButton(
          color: AppColors.red,
          title: "Delete Transaction Frequency",
          body: "Delete and Stop Transaction Frequency ",
          onDeleteConfirmed: () =>
              context.read<TransactionFrequenciesCubit>().remove(frequency.id),
        )
      ]),
    );
  }
}
