import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/src/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/models/category.dart';

import 'categories_repository.dart';

class FSCategoriesRepository implements CategoriesRepository {
  final _categoriesCollection = FirebaseFirestore.instance
      .collection("utils")
      .doc("expense")
      .collection("categories");

  @override
  Future<List<Category>> getExpenseCategories() async {
    try {
      final snapshots =
          await _categoriesCollection.where("type", isEqualTo: "expense").get();

      return _documentsToCategories(snapshots.docs);
    } catch (e) {
      log("get expense categories ", error: e.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<Category>> getIncomeCategories() async {
    try {
      final snapshots =
          await _categoriesCollection.where("type", isEqualTo: "income").get();

      return _documentsToCategories(snapshots.docs);
    } catch (e) {
      log("get income categories ", error: e.toString());
      throw ServerException();
    }
  }

  List<Category> _documentsToCategories(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    List<Category> categories = [];
    for (final doc in docs) {
      categories.add(Category.fromDocment(doc));
    }
    return categories;
  }

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      final snapshots = await _categoriesCollection.get();
      final categories = _documentsToCategories(snapshots.docs);

      return categories;
    } catch (e) {
      log("get all categories ", error: e.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<Category>> getTransferCategories() {
    // TODO: implement getTransferCategories
    throw UnimplementedError();
  }
}
