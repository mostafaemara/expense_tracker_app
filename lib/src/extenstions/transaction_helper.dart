import 'package:expense_tracker_app/src/extenstions/category_helper.dart';
import 'package:expense_tracker_app/src/models/multilingual.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

extension TransactionHelper on BuildContext {
  static const _transferIconUrl =
      "https://firebasestorage.googleapis.com/v0/b/expense-tracker-app-8803a.appspot.com/o/icons%2Ftransaction.png?alt=media&token=831f9951-cdf9-4ed4-bac0-215b7f8b6d9e";

  String transactionIconUrl(Transaction transaction) {
    if (transaction is CategoryId) {
      final _categories = categories(transaction.getType());
      return _categories
          .categoryIconById((transaction as CategoryId).categoryId);
    }
    return _transferIconUrl;
  }

  Multilingual categoryTitle(Transaction transaction) {
    if (transaction is CategoryId) {
      final _categories = categories(transaction.getType());
      return _categories
          .categoryTitleById((transaction as CategoryId).categoryId);
    }
    return const Multilingual(english: "Transfer", arabic: "transfer");
  }
}

extension TransactionColorHelper on BuildContext {
  Color transactionIconColor(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return AppColors.red;

      case TransactionType.income:
        return AppColors.green;

      case TransactionType.sent:
        return AppColors.red;

      case TransactionType.recived:
        return AppColors.green;
    }
  }

  Color transactionColor(TransactionType type) {
    switch (type) {
      case TransactionType.expense:
        return AppColors.red20;

      case TransactionType.income:
        return AppColors.green20;

      case TransactionType.sent:
        return AppColors.red20;

      case TransactionType.recived:
        return AppColors.green20;
    }
  }
}
