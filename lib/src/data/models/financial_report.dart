import 'dart:convert';

import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

class FinancialReport {
  final double totalExpense;
  final double totalIncome;
  final double biggestExpense;
  final double biggestIncome;

  final Category highestExpenseCategory;
  final Category highestIncomeCategory;
  final int budgets;
  final int exceededBudgets;
  final List<Category> exceededBudgetsCategories;
  final List<Transaction> expenses;
  final List<Transaction> incomes;

  FinancialReport(
      this.totalExpense,
      this.totalIncome,
      this.biggestExpense,
      this.biggestIncome,
      this.highestExpenseCategory,
      this.highestIncomeCategory,
      this.budgets,
      this.exceededBudgets,
      this.exceededBudgetsCategories,
      this.expenses,
      this.incomes);

  factory FinancialReport.fromMap(Map<String, dynamic> map) {
    return FinancialReport(
      map['totalExpense']?.toDouble() ?? 0.0,
      map['totalIncome']?.toDouble() ?? 0.0,
      map['biggestExpense']?.toDouble() ?? 0.0,
      map['biggestIncome']?.toDouble() ?? 0.0,
      Category.fromMap(map['highestExpenseCategory']),
      Category.fromMap(map['highestIncomeCategory']),
      map['budgets']?.toInt() ?? 0,
      map['exceededBudgets']?.toInt() ?? 0,
      List<Category>.from(
          map['exceededBudgetsCategories']?.map((x) => Category.fromMap(x))),
      List<Transaction>.from(
          map['expenses']?.map((x) => Transaction.fromMap(x))),
      List<Transaction>.from(
          map['incomes']?.map((x) => Transaction.fromMap(x))),
    );
  }

  factory FinancialReport.fromJson(String source) =>
      FinancialReport.fromMap(json.decode(source));
}
