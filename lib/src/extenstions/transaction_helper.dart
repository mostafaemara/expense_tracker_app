import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

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
