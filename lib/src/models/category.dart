import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker_app/src/models/multilingual.dart';

class Category extends Equatable {
  const Category(
      {required this.title, required this.iconUrl, required this.id});

  factory Category.fromDocment(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Category(
        iconUrl: doc.data()["icon"],
        title: Multilingual.fromMap(doc.data()["title"]),
        id: doc.id);
  }
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
        iconUrl: map["icon"],
        title: Multilingual.fromMap(map["title"]),
        id: map["id"]);
  }
  final Multilingual title;
  final String iconUrl;
  final String id;

  @override
  List<Object?> get props => [id];
}
