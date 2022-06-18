import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeFilter on DateTime {
  bool isAfterEqual(DateTime date) {
    return (isAfter(date) ||
        (day == date.day && month == date.month && year == date.year));
  }

  bool isBeforeEqual(DateTime date) {
    return (isBefore(date) ||
        (day == date.day && month == date.month && year == date.year));
  }

  String formatTimeHHMMAMPM() {
    final formattedDate = DateFormat('hh:mm a').format(this);

    return formattedDate;
  }

  String formatDateDDDDdMMyhm() {
    final formattedDate = DateFormat('EEEE d MMM y hh:mm').format(this);

    return formattedDate;
  }

  String formatDateDDDDdMMy(BuildContext context) {
    final formattedDate =
        DateFormat('EEEE d MMM y', Localizations.localeOf(context).languageCode)
            .format(this);

    return formattedDate;
  }
}
