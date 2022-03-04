import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

import '../transaction_type.dart';

class TransactionInput {
  final TransactionType type;
  final Category category;
  final String title;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;

  TransactionInput(
      {required this.accountId,
      required this.title,
      required this.type,
      required this.category,
      required this.amount,
      required this.description,
      this.attachment = ""});

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": type.name(),
      "category": category.id,
      "account": accountId,
      "amount": amount,
      "description": description,
      "attachment": attachment,
    };
  }
}
