import 'package:expense_tracker_app/src/bloc/categories/categories_cubit.dart';
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:expense_tracker_app/src/models/multilingual.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension CategoryListHelper on List<Category> {
  String categoryIconById(String id) {
    return firstWhere((element) => element.id == id).iconUrl;
  }

  Multilingual categoryTitleById(String id) {
    return firstWhere((element) => element.id == id).title;
  }

  Category categoryById(String id) {
    return firstWhere((element) => element.id == id);
  }
}

extension CategoriesHelper on BuildContext {
  List<Category> categories(TransactionType type) {
    if (type == TransactionType.expense) {
      return read<CategoriesCubit>().state.expenseCategories;
    } else {
      return read<CategoriesCubit>().state.incomeCategories;
    }
  }
}
