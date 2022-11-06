import 'dart:io';

import 'package:expense_tracker_app/src/data/models/frequency.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

class TransactionInput {
  final TransactionType type;
  final String categoryId;
  final String title;
  final double amount;
  final String description;
  final Frequency? frequency;
  final String accountId;
  final File? attachment;

  TransactionInput(
      {required this.accountId,
      required this.title,
      required this.type,
      required this.categoryId,
      required this.amount,
      required this.description,
      this.frequency,
      this.attachment});

  Map<String, dynamic> toMap() {
    return {
      "frequency": frequency,
      "title": title,
      "type": type.value,
      "categoryId": categoryId,
      "accountId": accountId,
      "amount": amount,
      "description": description,
    };
  }
}
