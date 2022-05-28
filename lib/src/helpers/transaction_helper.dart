import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/helpers/number_helper.dart';

import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

extension TransactionColorHelper on BuildContext {
  Color transactionIconColor(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return AppColors.red;
      case TransactionType.income:
        return AppColors.green;
    }
  }

  Color transactionBackgroundColor(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return AppColors.red20;
      case TransactionType.income:
        return AppColors.green20;
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
    }

    late String formattedAmount;
    if (locale.languageCode == "ar") {
      formattedAmount = "$convertedAmount$sign";
    } else {
      formattedAmount = "$sign$convertedAmount";
    }
    return formattedAmount;
  }
}
