import 'dart:convert';
import 'dart:developer';

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
      'type': type.value,
      'balance': balance,
      'id': id,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      title: map['title'],
      type: AccountType.parse(map['type']),
      balance: map['balance']?.toDouble(),
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));
}

enum AccountType {
  bankAccount("bankAccount"),
  wallet("wallet");

  final String value;
  const AccountType(this.value);

  factory AccountType.parse(String value) {
    log("helllo");
    if (value == "bankAccount") {
      return AccountType.bankAccount;
    } else if (value == "wallet") {
      return AccountType.wallet;
    } else {
      throw const FormatException("invalid Account Type!");
    }
  }
}
