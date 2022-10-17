// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Finance {
  final double balance;
  final double income;
  final double expense;

  Finance({required this.balance, required this.income, required this.expense});

  factory Finance.fromMap(Map<String, dynamic> map) {
    return Finance(
      balance: map['balance'].toDouble(),
      income: map['incomes'].toDouble(),
      expense: map['expenses'].toDouble(),
    );
  }

  factory Finance.fromJson(String source) =>
      Finance.fromMap(json.decode(source) as Map<String, dynamic>);
}
