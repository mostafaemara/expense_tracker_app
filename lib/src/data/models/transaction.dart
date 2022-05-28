import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';

class Transaction {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final String description;
  final String attachment;
  final Account account;
  final Category category;

  final TransactionType type;

  Transaction(
      {required this.date,
      required this.title,
      required this.type,
      required this.category,
      required this.id,
      required this.account,
      required this.amount,
      required this.description,
      required this.attachment});

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      title: map["title"],
      id: map['id'],
      date: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      amount: map['amount']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
      attachment: map['attachment'] ?? '',
      account: Account.fromMap(map['account']),
      category: Category.fromMap(map['category']),
      type: TransactionType.parse(map['type']),
    );
  }
}

List<Transaction> mapArrayToTransactions(dynamic array) {
  List<Transaction> transactions = [];
  for (final map in array) {
    transactions.add(Transaction.fromMap(map));
  }
  return transactions;
}

enum TransactionType {
  expense("expense"),
  income("income");

  final String value;

  const TransactionType(
    this.value,
  );

  factory TransactionType.parse(String value) {
    switch (value) {
      case "expense":
        return TransactionType.expense;
      case "income":
        return TransactionType.income;

      default:
        throw const FormatException("invalid transaction type");
    }
  }
}
