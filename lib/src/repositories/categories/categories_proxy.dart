import 'dart:developer';

import 'package:expense_tracker_app/src/models/category.dart';
import 'package:expense_tracker_app/src/repositories/categories/categories_repository.dart';

class CategoriesProxy implements CategoriesRepository {
  final CategoriesRepository _categoriesRepository;
  List<Category>? _expenseCategories;
  List<Category>? _incomeCategories;
  List<Category>? _categories;

  CategoriesProxy(this._categoriesRepository);
  @override
  Future<List<Category>> getExpenseCategories() async {
    return _expenseCategories ??=
        await _categoriesRepository.getExpenseCategories();
  }

  @override
  Future<List<Category>> getIncomeCategories() async {
    return _incomeCategories ??=
        await _categoriesRepository.getIncomeCategories();
  }

  @override
  Future<List<Category>> getAllCategories() async {
    return _categories ??= await _categoriesRepository.getAllCategories();
  }

  @override
  Future<List<Category>> getTransferCategories() {
    // TODO: implement getTransferCategories
    throw UnimplementedError();
  }

  @override
  Future<Category> getCategoryById(String id) async {
    _categories ??= await _categoriesRepository.getAllCategories();

    return _categories!.firstWhere(
      (element) => element.id == id,
    );
  }
}
