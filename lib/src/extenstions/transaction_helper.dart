import 'package:expense_tracker_app/src/extenstions/number_helper.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TransactionColorHelper on BuildContext {
  Color transactionIconColor(TransactionType type) => type.when(
      expense: () => AppColors.red,
      income: () => AppColors.green,
      sentTransfer: () => AppColors.red,
      recivedTransfer: () => AppColors.green);

  Color transactionBackgroundColor(TransactionType type) => type.when(
      expense: () => AppColors.red20,
      income: () => AppColors.green20,
      sentTransfer: () => AppColors.red20,
      recivedTransfer: () => AppColors.green20);
}

extension TransactionFormatter on Transaction {
  String formatAmount(BuildContext context) {
    final convertedAmount = amount.translate(context);
    final locale = Localizations.localeOf(context);
    final String sign = type.when(
        expense: () => "-",
        income: () => "+",
        sentTransfer: () => "-",
        recivedTransfer: () => "+");

    late String formattedAmount;
    if (locale.languageCode == "ar") {
      formattedAmount = "$convertedAmount$sign";
    } else {
      formattedAmount = "$sign$convertedAmount";
    }
    return formattedAmount;
  }

  String formatDate() {
    final formattedDate = DateFormat('hh:mm a').format(date);

    return formattedDate;
  }
}
