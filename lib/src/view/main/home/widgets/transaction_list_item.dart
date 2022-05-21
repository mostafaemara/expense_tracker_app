import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/helpers/date_time_helper.dart';
import 'package:expense_tracker_app/src/helpers/multilingual_helper.dart';

import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/transaction_helper.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({Key? key, required this.transaction})
      : super(key: key);
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final _transactionIconColor =
        context.transactionIconColor(transaction.type);
    final _transactionBackgroundColor =
        context.transactionBackgroundColor(transaction.type);

    return GestureDetector(
      onTap: () {
        context.navigateTo(TransactionDetailsRoute(transaction: transaction));
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        height: 90,
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: _transactionBackgroundColor,
                    borderRadius: BorderRadius.circular(16)),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CachedNetworkImage(
                    color: _transactionIconColor,
                    height: 40,
                    width: 40,
                    imageUrl: transaction.category.iconUrl,
                  ),
                )),
            const SizedBox(
              width: 9,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction.category.title.translate(context).toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    transaction.description,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: AppColors.light20),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction.formatAmount(context),
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: _transactionIconColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    transaction.date.formatTimeHHMMAMPM(),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: AppColors.light20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
