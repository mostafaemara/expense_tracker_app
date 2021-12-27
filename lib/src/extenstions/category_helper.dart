import 'package:expense_tracker_app/src/bloc/categories/categories_cubit.dart';
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension CategoryListHelper on List<Category> {
  String categoryIconById(String id) {
    print("--------------------------------------------------------" + id);
    return firstWhere((element) => element.id == id).iconUrl;
  }

  Category categoryById(String id) {
    return firstWhere((element) => element.id == id);
  }
}

extension CategoriesHelper on BuildContext {
  List<Category> categories(TransactionType type) {
    if (type == TransactionType.expense) {
      print("-------------------------------------------------------Expense");
      return read<CategoriesCubit>().state.expenseCategories;
    } else {
      print("-------------------------------------------------------income");
      return read<CategoriesCubit>().state.incomeCategories;
    }
  }

  String iconUrlById(String id, TransactionType type) {
    final categories = categories(type);
  }
}
