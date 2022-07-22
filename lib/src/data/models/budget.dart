import 'dart:convert';
import 'dart:developer';

import 'package:expense_tracker_app/src/data/models/category.dart';

class Budget {
  final String id;
  final double amountSpent;
  final double amount;
  final int alertPercentage;
  final Category category;

  final bool alert;

  Budget(
    this.id,
    this.amountSpent,
    this.amount,
    this.alertPercentage,
    this.category,
    this.alert,
  );

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
        map['id'] ?? '',
        map['amountSpent']?.toDouble() ?? 0.0,
        map['amount']?.toDouble() ?? 0.0,
        map['alertPercentage'],
        Category.fromMap(map['category']),
        map["alert"]);
  }

  factory Budget.fromJson(String source) => Budget.fromMap(json.decode(source));
}

class BudgetInput {
  final double amount;
  final int alertPercentage;
  final String categoryId;
  final bool alert;

  BudgetInput(
      {required this.amount,
      required this.alertPercentage,
      required this.categoryId,
      required this.alert});

  Map<String, dynamic> toMap() {
    log(alert.toString());
    return {
      'amount': amount,
      'alertPercentage': alertPercentage,
      'categoryId': categoryId,
      "alert": alert ? 1 : 0
    };
  }
}
