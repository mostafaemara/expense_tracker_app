import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/src/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/models/category.dart';

import 'categories_repository.dart';

class FSCategoriesRepository implements CategoriesRepository {
  final _expenseCategoriesCollection = FirebaseFirestore.instance
      .collection("utils")
      .doc("expense")
      .collection("categories");

  final _incomeCategoriesCollection = FirebaseFirestore.instance
      .collection("utils")
      .doc("income")
      .collection("categories");

  @override
  Future<List<Category>> getExpenseCategories() async {
    try {
      final snapshots = await _expenseCategoriesCollection.get();

      return _documentsToCategories(snapshots.docs);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Category>> getIncomeCategories() async {
    try {
      final snapshots = await _incomeCategoriesCollection.get();

      return _documentsToCategories(snapshots.docs);
    } catch (e) {
      throw ServerException();
    }
  }

  List<Category> _documentsToCategories(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    final List<Category> categories = [];
    for (final doc in docs) {
      categories.add(Category.fromDocment(doc));
    }
    return categories;
  }
}
