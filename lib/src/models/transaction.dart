import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "transaction.freezed.dart";

@freezed
abstract class TransactionType with _$TransactionType {
  const factory TransactionType.expense() = _Expense;
  const factory TransactionType.income() = _Income;
  const factory TransactionType.sentTransfer() = _SentTransfer;
  const factory TransactionType.recivedTransfer() = _RecivedTransfer;
}

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

    return Transaction(
        targetAccountId: map["targetAccount"] ?? "",
        date: date,
        id: doc.id,
        accountId: map["accountId"],
        amount: map["amount"].toDouble(),
        description: map["description"],
        attachment: map["attachment"],
        type: _mapType(map["type"]),
        category: category);
  }
}

TransactionType _mapType(String type) {
  switch (type) {
    case "expense":
      return const TransactionType.expense();
    case "income":
      return const TransactionType.income();
    case "sent":
      return const TransactionType.sentTransfer();
    case "recived":
      return const TransactionType.recivedTransfer();
    default:
      throw Exception("invalid Transaction Type");
  }
}
