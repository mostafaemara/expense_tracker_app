import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';

import 'transaction_type.dart';

class Transaction {
  final String id;
  final DateTime date;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;
  final Category category;
  final String targetAccountId;
  final TransactionType type;

  Transaction(
      {required this.date,
      required this.type,
      required this.category,
      this.targetAccountId = "",
      required this.id,
      required this.accountId,
      required this.amount,
      required this.description,
      required this.attachment});

  factory Transaction.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc, Category category) {
    final map = doc.data();
    final Timestamp timestamp = map["date"];
    final DateTime date = timestamp.toDate();
    final type = map["type"] as String;
    return Transaction(
        targetAccountId: map["targetAccount"] ?? "",
        date: date,
        id: doc.id,
        accountId: map["accountId"],
        amount: map["amount"].toDouble(),
        description: map["description"],
        attachment: map["attachment"],
        type: type.fromMap(),
        category: category);
  }
}
