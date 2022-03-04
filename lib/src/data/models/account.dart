import 'dart:convert';

import 'account_type.dart';

class Account {
  Account(
      {required this.balance,
      required this.title,
      required this.id,
      required this.type});

  final String title;
  final AccountType type;
  final double balance;
  final String id;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type.name(),
      'balance': balance,
      'id': id,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      title: map['title'],
      type: parse(map['type']),
      balance: map['balance']?.toDouble(),
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));
}
