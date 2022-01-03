import 'package:expense_tracker_app/src/models/category.dart';

import 'package:expense_tracker_app/src/models/transaction.dart';

class TransactionInput {
  final TransactionType type;
  final Category category;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;

  TransactionInput(
      {required this.accountId,
      required this.type,
      required this.category,
      required this.amount,
      required this.description,
      required this.attachment});

  Map<String, dynamic> toMap() {
    return {
      "type": type.toMap(),
      "category": category.id,
      "accountId": accountId,
      "amount": amount,
      "description": description,
      "attachment": attachment,
    };
  }

  Transaction toTransaction(String id, DateTime date) {
    return Transaction(
        date: date,
        type: type,
        category: category,
        id: id,
        accountId: accountId,
        amount: amount,
        description: description,
        attachment: attachment);
  }
}
