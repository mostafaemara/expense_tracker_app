import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

class TransactionInput {
  final TransactionType type;
  final Category category;
  final String title;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;
  final String targetAccount;
  TransactionInput(
      {required this.accountId,
      required this.title,
      required this.type,
      required this.category,
      required this.amount,
      required this.description,
      this.targetAccount = "",
      this.attachment = ""});

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": type.value,
      "category": category.id,
      "account": accountId,
      "amount": amount,
      "description": description,
      "attachment": attachment,
      "target": targetAccount
    };
  }
}
