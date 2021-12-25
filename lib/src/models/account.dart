import 'package:cloud_firestore/cloud_firestore.dart';
import "../extenstions/account_type_mapper.dart";

enum AccountType { bankAccount, wallet }

class Account {
  Account.input(
      {required this.balance,
      required this.title,
      this.id = "",
      required this.accountType});
  Account(
      {required this.balance,
      required this.title,
      required this.id,
      required this.accountType});

  factory Account.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data();

    return Account(
        balance: map["balance"].toDouble(),
        title: map["title"],
        id: doc.id,
        accountType: (map["type"] as String).toAccountType());
  }
  final String title;
  final AccountType accountType;
  final double balance;
  final String id;

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": accountType.toKey(),
      "balance": balance,
    };
  }

  Account copyWithId(String id) =>
      Account(accountType: accountType, balance: balance, title: title, id: id);

  // double get balance {
  //   double _balance = 0;
  //   for (final transaction in transactions) {
  //     if (transaction is Expense) {
  //       _balance -= transaction.amount;
  //     }
  //     if (transaction is Income) {
  //       _balance += transaction.amount;
  //     }
  //     if (transactions is SentTransfer) {
  //       _balance -= transaction.amount;
  //     }

  //     if (transaction is RecivedTransfer) {
  //       _balance += transaction.amount;
  //     }
  //   }
  //   return _balance;
  // }
}
