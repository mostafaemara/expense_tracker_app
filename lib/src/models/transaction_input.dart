import 'package:cloud_firestore/cloud_firestore.dart' as firebase;
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:expense_tracker_app/src/models/periodic_type.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';

class TransactionInput {
  final TransactionType type;
  final Category category;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;
  final bool repeat;
  late final DateTime? endDate;
  late final PeriodicType? periodicType;

  TransactionInput(
      {required this.accountId,
      this.endDate,
      this.repeat = false,
      required this.type,
      required this.category,
      required this.amount,
      required this.description,
      required this.attachment});

  Map<String, dynamic> toTransactionMap() {
    return {
      "type": type.toMap(),
      "category": category.id,
      "accountId": accountId,
      "amount": amount,
      "description": description,
      "attachment": attachment,
    };
  }

  Map<String, dynamic> toFrequentTransactionMap() {
    final _endDateTimeStamp = firebase.Timestamp.fromDate(endDate!);

    return {
      "periodicType": periodicType!.toMap(),
      "endDate": _endDateTimeStamp,
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
