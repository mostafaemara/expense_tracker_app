import 'dart:developer';

import 'package:equatable/equatable.dart';

import 'package:expense_tracker_app/src/data/models/multilingual.dart';

import 'transaction_type.dart';

class Category extends Equatable {
  const Category(
      {required this.transactionType,
      required this.title,
      required this.iconUrl,
      required this.id});

  final Multilingual title;
  final String iconUrl;
  final String id;
  final TransactionType transactionType;

  @override
  List<Object?> get props => [id];

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
        title: Multilingual.fromMap(map['title']),
        iconUrl: map['icon'],
        id: map['id'],
        transactionType: parse(map["type"]));
  }
}
