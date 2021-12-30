part of 'categories_cubit.dart';

class CategoriesState {
  CategoriesState(
      {required this.expenseCategories,
      required this.categories,
      required this.incomeCategories});
  final List<Category> expenseCategories;
  final List<Category> incomeCategories;
  final List<Category> categories;
}
