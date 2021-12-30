import 'package:expense_tracker_app/src/models/category.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getExpenseCategories();
  Future<List<Category>> getIncomeCategories();
  Future<List<Category>> getTransferCategories();
  Future<List<Category>> getAllCategories();
  Future<Category> getCategoryById(String id);
}
