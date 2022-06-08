import 'dart:developer';

import 'package:expense_tracker_app/src/data/models/transaction.dart';

class TransactionsOfDate {
  final DateTime date;
  final List<Transaction> transactions;

  TransactionsOfDate({required this.date, required this.transactions});

  factory TransactionsOfDate.fromMap(Map<String, dynamic> map) {
    log(map['date'].toString());
    return TransactionsOfDate(
      date: DateTime.parse(map['date']),
      transactions: List<Transaction>.from(
          map['transactions']?.map((x) => Transaction.fromMap(x))),
    );
  }
}

List<TransactionsOfDate> mapArrayToTransactionsOfDates(dynamic array) {
  List<TransactionsOfDate> list = [];
  for (final map in array) {
    list.add(TransactionsOfDate.fromMap(map));
  }
  return list;
}
