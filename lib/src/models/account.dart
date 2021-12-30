import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "account.freezed.dart";

@freezed
abstract class AccountType with _$AccountType {
  const AccountType._();
  const factory AccountType.wallet() = _Wallet;
  const factory AccountType.bankAccount() = _BanckAccount;

  String toMap() => when(
        wallet: () => "wallet",
        bankAccount: () => "bankAccount",
      );

  factory AccountType.fromMap(String value) {
    switch (value) {
      case "wallet":
        return const AccountType.wallet();
      case "bankAccount":
        return const AccountType.bankAccount();
      default:
        throw Exception("invalid Account Type");
    }
  }
}

class Account {
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
        accountType: AccountType.fromMap(map["type"]));
  }
  final String title;
  final AccountType accountType;
  final double balance;
  final String id;

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": accountType.toMap(),
      "balance": balance,
    };
  }
}

class AccountInput {
  AccountInput(
      {required this.balance, required this.title, required this.accountType});

  final String title;
  final AccountType accountType;
  final double balance;

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": accountType.toMap(),
      "balance": balance,
    };
  }

  Account toAccount(String id) {
    return Account(
        balance: balance, title: title, id: id, accountType: accountType);
  }
}
