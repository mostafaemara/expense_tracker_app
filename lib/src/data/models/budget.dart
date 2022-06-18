import 'dart:convert';

import 'package:expense_tracker_app/src/data/models/category.dart';

class Budget {
  final String id;
  final double amountSpent;
  final double amount;
  final double alertPercentage;
  final Category category;

  Budget(
    this.id,
    this.amountSpent,
    this.amount,
    this.alertPercentage,
    this.category,
  );

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      map['id'] ?? '',
      map['amountSpent']?.toDouble() ?? 0.0,
      map['amount']?.toDouble() ?? 0.0,
      map['alertPercentage']?.toDouble() ?? 0.0,
      Category.fromMap(map['category']),
    );
  }

  factory Budget.fromJson(String source) => Budget.fromMap(json.decode(source));
}
