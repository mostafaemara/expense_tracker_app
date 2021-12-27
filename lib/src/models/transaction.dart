import 'package:cloud_firestore/cloud_firestore.dart';

enum TransactionType { expense, income, sent, recived }
enum TransactionFormType { expense, income, transfer }

class Transaction {
  final String id;
  final DateTime date;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;

  TransactionType getType() {
    if (this is Expense) {
      return TransactionType.expense;
    } else if (this is Income) {
      return TransactionType.income;
    } else if (this is SentTransfer) {
      return TransactionType.sent;
    } else {
      return TransactionType.recived;
    }
  }

  Transaction(
      {required this.date,
      required this.id,
      required this.accountId,
      required this.amount,
      required this.description,
      required this.attachment});

  factory Transaction.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final String type = doc.data()["type"];
    if (type == "expense") {
      return Expense.fromDocument(doc);
    } else if (type == "income") {
      return Income.fromDocument(doc);
    } else if (type == "sent") {
      return SentTransfer.fromDocument(doc);
    } else if (type == "recived") {
      return RecivedTransfer.fromDocument(doc);
    } else {
      throw Exception("invalid Transaction type from server");
    }
  }
}

class Expense extends Transaction {
  final String category;
  Expense(
      {required DateTime date,
      required String accountId,
      required this.category,
      required double amount,
      required String id,
      required String description,
      required String attachment})
      : super(
            id: id,
            accountId: accountId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);

  factory Expense.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data();
    final Timestamp timestamp = map["date"];
    final DateTime date = timestamp.toDate();

    return Expense(
        date: date,
        accountId: map["accountId"],
        category: map["category"],
        amount: map["amount"].toDouble(),
        id: doc.id,
        description: map["description"],
        attachment: map["attachment"]);
  }
}

class Income extends Transaction {
  final String category;
  Income(
      {required DateTime date,
      required this.category,
      required String accountId,
      required double amount,
      required String id,
      required String description,
      required String attachment})
      : super(
            id: id,
            accountId: accountId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);

  factory Income.fromDocument(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data();
    final Timestamp timestamp = map["date"];
    final DateTime date = timestamp.toDate();

    return Income(
        date: date,
        accountId: map["accountId"],
        category: map["category"],
        amount: map["amount"].toDouble(),
        id: doc.id,
        description: map["description"],
        attachment: map["attachment"]);
  }
}

class SentTransfer extends Transaction {
  final String targetAccountId;
  SentTransfer(
      {required DateTime date,
      required this.targetAccountId,
      required String accountId,
      required String id,
      required double amount,
      required String description,
      required String attachment})
      : super(
            id: id,
            accountId: accountId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);

  factory SentTransfer.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data();
    final Timestamp timestamp = map["date"];
    final DateTime date = timestamp.toDate();

    return SentTransfer(
        date: date,
        accountId: map["accountId"],
        targetAccountId: map["targetAccountId"],
        amount: map["amount"].toDouble(),
        id: doc.id,
        description: map["description"],
        attachment: map["attachment"]);
  }
}

class RecivedTransfer extends Transaction {
  final String targetAccountId;
  RecivedTransfer(
      {required DateTime date,
      required this.targetAccountId,
      required String accountId,
      required double amount,
      required String description,
      required String id,
      required String attachment})
      : super(
            id: id,
            accountId: accountId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);
  factory RecivedTransfer.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data();
    final Timestamp timestamp = map["date"];
    final DateTime date = timestamp.toDate();

    return RecivedTransfer(
        date: date,
        accountId: map["accountId"],
        targetAccountId: map["targetAccountId"],
        amount: map["amount"].toDouble(),
        id: doc.id,
        description: map["description"],
        attachment: map["attachment"]);
  }
}
