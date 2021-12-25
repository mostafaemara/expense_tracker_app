import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:expense_tracker_app/src/repositories/categories/categories_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit()
      : super(CategoriesState(expenseCategories: [], incomeCategories: []));

  final _categoriesRepo = locator<CategoriesRepository>();

  void init() async {
    final expenseCategories = await _categoriesRepo.getExpenseCategories();
    final incomeCategories = await _categoriesRepo.getIncomeCategories();

    emit(CategoriesState(
        expenseCategories: expenseCategories,
        incomeCategories: incomeCategories));
  }
}
