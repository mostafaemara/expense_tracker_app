import 'package:cached_network_image/cached_network_image.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import "../../../../extenstions/transaction_helper.dart";
import "../../../../extenstions/multilingual_helper.dart";

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({Key? key, required this.transaction})
      : super(key: key);
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final type = transaction.getType();
    final _transactionIconColor = context.transactionIconColor(type);
    final _transactionBackgroundColor = context.transactionColor(type);
    final hour = DateFormat('hh:mm a').format(DateTime.now());

    return Container(
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
                  imageUrl: context.transactionIconUrl(transaction),
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
                  context
                      .categoryTitle(transaction)
                      .translate(context)
                      .toUpperCase(),
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
                  "-\$80",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: _transactionIconColor,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  hour,
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
    );
  }
}
