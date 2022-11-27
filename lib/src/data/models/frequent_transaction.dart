// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_tracker_app/src/data/models/frequency.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

class TransactionFrequency {
  final DateTime date;
  final double amount;

  final String title;
  final String id;
  final Frequency frequency;
  final TransactionType type;

  TransactionFrequency(
      this.date, this.amount, this.title, this.id, this.frequency, this.type);

  factory TransactionFrequency.fromMap(Map<String, dynamic> map) {
    return TransactionFrequency(
      DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
      map['amount'].toDouble(),
      map['title'] as String,
      map['id'] as String,
      Frequency.parse(map['frequency']),
      TransactionType.parse(map['type']),
    );
  }
}
