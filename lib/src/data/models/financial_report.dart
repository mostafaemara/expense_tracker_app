import 'dart:convert';

import 'package:expense_tracker_app/src/data/models/transaction.dart';

import 'budget.dart';

class FinancialReport {
  final double expensesAmount;
  final double incomesAmount;
  final Transaction highestExpense;
  final Transaction highestIncome;

  final List<Budget> budgets;
  final List<Budget> exceededBudgets;

  final List<Transaction> expenses;
  final List<Transaction> incomes;

  FinancialReport(
      this.expensesAmount,
      this.incomesAmount,
      this.highestExpense,
      this.highestIncome,
      this.budgets,
      this.exceededBudgets,
      this.expenses,
      this.incomes);

  factory FinancialReport.fromMap(Map<String, dynamic> map) {
    return FinancialReport(
      map['expensesAmount']?.toDouble() ?? 0.0,
      map['incomesAmount']?.toDouble() ?? 0.0,
      Transaction.fromMap(map['highestExpense']),
      Transaction.fromMap(map['highestIncome']),
      List<Budget>.from(map['budgets']?.map((x) => Budget.fromMap(x))),
      List<Budget>.from(map['exceededBudgets']?.map((x) => Budget.fromMap(x))),
      List<Transaction>.from(
          map['expenses']?.map((x) => Transaction.fromMap(x))),
      List<Transaction>.from(
          map['incomes']?.map((x) => Transaction.fromMap(x))),
    );
  }

  factory FinancialReport.fromJson(String source) =>
      FinancialReport.fromMap(json.decode(source));
}
