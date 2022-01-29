import 'package:expense_tracker_app/src/extenstions/number_helper.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/models/transaction_type.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TransactionColorHelper on BuildContext {
  Color transactionIconColor(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return AppColors.red;
      case TransactionType.income:
        return AppColors.green;
      case TransactionType.sent:
        return AppColors.red;
      case TransactionType.received:
        return AppColors.green;
      case TransactionType.transfer:
        throw const FormatException("invalid type");
    }
  }

  Color transactionBackgroundColor(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return AppColors.red20;
      case TransactionType.income:
        return AppColors.green20;
      case TransactionType.sent:
        return AppColors.red20;
      case TransactionType.received:
        return AppColors.green20;
      case TransactionType.transfer:
        throw const FormatException("invalid type");
    }
  }
}

extension TransactionFormatter on Transaction {
  String formatAmount(BuildContext context) {
    final convertedAmount = amount.translate(context);
    final locale = Localizations.localeOf(context);
    String sign = "";

    switch (type) {
      case TransactionType.expense:
        sign = "-";
        break;
      case TransactionType.income:
        sign = "+";
        break;
      case TransactionType.sent:
        sign = "-";
        break;
      case TransactionType.received:
        sign = "+";
        break;
      case TransactionType.transfer:
        throw const FormatException("invalid type");
    }

    late String formattedAmount;
    if (locale.languageCode == "ar") {
      formattedAmount = "$convertedAmount$sign";
    } else {
      formattedAmount = "$sign$convertedAmount";
    }
    return formattedAmount;
  }

  String formatTimeHHMMAMPM() {
    final formattedDate = DateFormat('hh:mm a').format(date);

    return formattedDate;
  }

  String formatDate() {
    final formattedDate = DateFormat('EEEE d MMM y hh:mm').format(date);

    return formattedDate;
  }
}
