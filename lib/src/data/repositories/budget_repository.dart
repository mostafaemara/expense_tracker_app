import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';

import '../models/budget.dart';

class BudgetRepository {
  final _api = locator<Api>().dio;
  Future<List<Budget>> readBudgets(int monthNumber) async {
    try {
      final response = await _api
          .get(ApiConfig.budgetPath, queryParameters: {"month": monthNumber});
      return _mapArrayToBudgets(response.data["data"]);
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  List<Budget> _mapArrayToBudgets(dynamic array) {
    List<Budget> budgets = [];
    for (final map in array) {
      budgets.add(Budget.fromMap(map));
    }
    return budgets;
  }
}
