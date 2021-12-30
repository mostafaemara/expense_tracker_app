import 'package:expense_tracker_app/src/extenstions/number_helper.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TransactionColorHelper on BuildContext {
  Color transactionIconColor(Transaction transaction) => transaction.when(
      expense: (__, _) => AppColors.red,
      income: (__, _) => AppColors.green,
      sentTransfer: (__, _, ___) => AppColors.red,
      recivedTransfer: (__, ___, _) => AppColors.green);

  Color transactionBackgroundColor(Transaction transaction) => transaction.when(
      expense: (__, _) => AppColors.red20,
      income: (__, _) => AppColors.green20,
      sentTransfer: (__, ___, _) => AppColors.red20,
      recivedTransfer: (__, ___, _) => AppColors.green20);
}

extension TransactionHelper on Transaction {
  String formatAmount(BuildContext context) {
    final amount = transactionData.amount.translate(context);
    final locale = Localizations.localeOf(context);
    final String sign = when(
        expense: (_, __) => "-",
        income: (_, __) => "+",
        sentTransfer: (_, __, ___) => "-",
        recivedTransfer: (_, __, ___) => "+");

    late String formattedAmount;
    if (locale.languageCode == "ar") {
      formattedAmount = "$amount$sign";
    } else {
      formattedAmount = "$sign$amount";
    }
    return formattedAmount;
  }

  String formatDate() {
    final formattedDate = DateFormat('hh:mm a').format(transactionData.date);

    return formattedDate;
  }
}
