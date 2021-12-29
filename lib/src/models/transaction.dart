import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "transaction.freezed.dart";

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction.expense(
      {required TransactionData transactionData,
      required Category category}) = _Expense;
  const factory Transaction.income(
      {required TransactionData transactionData,
      required Category category}) = _Income;
  const factory Transaction.sentTransfer(
      {required TransactionData transactionData,
      required Category category,
      required String targetAccountId}) = _SentTransfer;
  const factory Transaction.recivedTransfer(
      {required TransactionData transactionData,
      required Category category,
      required String targetAccountId}) = _RecivedTransfer;
}

class TransactionData {
  final String id;
  final DateTime date;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;

  TransactionData(
      {required this.date,
      required this.id,
      required this.accountId,
      required this.amount,
      required this.description,
      required this.attachment});

  factory TransactionData.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data();
    final Timestamp timestamp = map["date"];
    final DateTime date = timestamp.toDate();

    return TransactionData(
        date: date,
        id: doc.id,
        accountId: map["accountId"],
        amount: map["amount"].toDouble(),
        description: map["description"],
        attachment: map["attachment"]);
  }
}
