import 'package:expense_tracker_app/src/data/models/category.dart';
import 'package:expense_tracker_app/src/data/repositories/interfaces/categories_repository.dart';

class CategoriesProxy implements CategoriesRepository {
  final CategoriesRepository _categoriesRepository;

  List<Category>? _categories;

  CategoriesProxy(this._categoriesRepository);

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
