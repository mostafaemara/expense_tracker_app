import 'dart:ui';

import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';

class Transaction {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final String description;
  final String attachment;
  final Account account;
  final Category category;

  final TransactionType type;

  Transaction(
      {required this.date,
      required this.title,
      required this.type,
      required this.category,
      required this.id,
      required this.account,
      required this.amount,
      required this.description,
      required this.attachment});

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      title: map["title"],
      id: map['id'],
      date: DateTime.parse(map['created_at']),
      amount: map['amount'].toDouble(),
      description: map['description'] ?? '',
      attachment: map['attachment'] ?? '',
      account: Account.fromMap(map['account']),
      category: Category.fromMap(map['category']),
      type: TransactionType.parse(map['type']),
    );
  }
}

List<Transaction> mapArrayToTransactions(dynamic array) {
  List<Transaction> transactions = [];
  for (final map in array) {
    transactions.add(Transaction.fromMap(map));
  }
  return transactions;
}

enum TransactionType {
  expense("expense"),
  income("income");

  final String value;

  const TransactionType(
    this.value,
  );

  factory TransactionType.parse(String value) {
    switch (value) {
      case "expense":
        return TransactionType.expense;
      case "income":
        return TransactionType.income;

      default:
        throw const FormatException("invalid transaction type");
    }
  }

  Color toColor() {
    switch (this) {
      case TransactionType.expense:
        return AppColors.red;

      case TransactionType.income:
        return AppColors.green;
    }
  }
}
