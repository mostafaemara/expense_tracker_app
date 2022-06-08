import 'package:equatable/equatable.dart';

import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  const Category(
      {required this.transactionType,
      required this.color,
      required this.title,
      required this.iconUrl,
      required this.id});

  final String title;
  final String iconUrl;
  final String id;
  final Color color;
  final TransactionType transactionType;

  @override
  List<Object?> get props => [id];

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
        color: Color(int.parse(map["color"])),
        title: map['title']["en"],
        iconUrl: map['icon'],
        id: map['id'],
        transactionType: TransactionType.parse(map["type"]));
  }
}
