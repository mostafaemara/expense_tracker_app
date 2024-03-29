import 'package:expense_tracker_app/src/helpers/date_time_helper.dart';
import 'package:expense_tracker_app/src/view/common/transaction_list_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'section_title.dart';

class TransactionsOfDateListItem extends StatelessWidget {
  final DateTime date;
  final List<TransactionListItem> transactions;
  const TransactionsOfDateListItem({
    Key? key,
    required this.transactions,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: formateDate(date, context),
        ),
        ...transactions
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
