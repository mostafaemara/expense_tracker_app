import 'package:expense_tracker_app/src/data/models/transaction.dart';

class TransactionInput {
  final TransactionType type;
  final String categoryId;
  final String title;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;

  TransactionInput(
      {required this.accountId,
      required this.title,
      required this.type,
      required this.categoryId,
      required this.amount,
      required this.description,
      this.attachment = ""});

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": type.value,
      "categoryId": categoryId,
      "accountId": accountId,
      "amount": amount,
      "description": description,
      "attachment": attachment,
    };
  }
}
