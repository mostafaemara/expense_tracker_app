import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';

import 'transaction_type.dart';

class Transaction {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final String description;
  final String attachment;
  final Account account;
  final Category category;
  final String targetAccountId;
  final TransactionType type;

  Transaction(
      {required this.date,
      required this.title,
      required this.type,
      required this.category,
      this.targetAccountId = "",
      required this.id,
      required this.account,
      required this.amount,
      required this.description,
      required this.attachment});

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      title: map["title"],
      id: map['id'],
      date: DateTime.parse(map['createdAt']),
      amount: map['amount']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
      attachment: map['attachment'] ?? '',
      account: Account.fromMap(map['account']),
      category: Category.fromMap(map['category']),
      targetAccountId: map['targetAccount'] ?? '',
      type: parse(map['type']),
    );
  }
}
