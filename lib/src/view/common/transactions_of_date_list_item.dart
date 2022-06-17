import 'package:expense_tracker_app/src/data/models/transactions_of_date.dart';
import 'package:expense_tracker_app/src/helpers/date_time_helper.dart';
import 'package:expense_tracker_app/src/view/common/transaction_list_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'section_title.dart';

class TransactionsOfDateListItem extends StatelessWidget {
  const TransactionsOfDateListItem({Key? key, required this.transactionsOfDate})
      : super(key: key);
  final TransactionsOfDate transactionsOfDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: formateDate(transactionsOfDate.date, context),
        ),
        ...List.generate(
            transactionsOfDate.transactions.length,
            (index) => TransactionListItem(
                transaction: transactionsOfDate.transactions[index])).toList()
      ],
    );
  }

  String formateDate(DateTime date, BuildContext context) {
    if (calculateDifference(date) == 0) {
      return AppLocalizations.of(context)!.today;
    } else if (calculateDifference(date) == -1) {
      return AppLocalizations.of(context)!.yesterday;
    } else {
      return date.formatDateDDDDdMMy(context);
    }
  }

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}
