import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:expense_tracker_app/src/repositories/categories/categories_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final AuthCubit _authCubit;
  CategoriesCubit(this._authCubit)
      : super(CategoriesState(
          expenseCategories: [],
          incomeCategories: [],
          categories: [],
        )) {
    _authCubit.stream.listen((state) {
      state.whenOrNull(
        authenticated: (user) {
          init();
        },
      );
    });
  }

  final _categoriesRepo = locator<CategoriesRepository>();

  void init() async {
    final expenseCategories = await _categoriesRepo.getExpenseCategories();
    final incomeCategories = await _categoriesRepo.getIncomeCategories();
    final categories = await _categoriesRepo.getAllCategories();

    emit(CategoriesState(
        categories: categories,
        expenseCategories: expenseCategories,
        incomeCategories: incomeCategories));
  }
}
