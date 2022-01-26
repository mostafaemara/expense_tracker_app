import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker_app/src/models/multilingual.dart';

import 'transaction_type.dart';

class Category extends Equatable {
  const Category(
      {required this.transactionType,
      required this.title,
      required this.iconUrl,
      required this.id});

  factory Category.fromDocment(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final type = doc.data()["type"] as String;
    return Category(
        transactionType: type.fromMap(),
        iconUrl: doc.data()["icon"],
        title: Multilingual.fromMap(doc.data()["title"]),
        id: doc.id);
  }
  factory Category.fromMap(Map<String, dynamic> map) {
    final type = map["type"] as String;
    return Category(
        transactionType: type.fromMap(),
        iconUrl: map["icon"],
        title: Multilingual.fromMap(map["title"]),
        id: map["id"]);
  }
  final Multilingual title;
  final String iconUrl;
  final String id;
  final TransactionType transactionType;

  @override
  List<Object?> get props => [id];
}
