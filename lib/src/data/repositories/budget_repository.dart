import 'dart:convert';
import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';

import '../exceptions/invalid_input_exception.dart';
import '../exceptions/server_exception.dart';
import '../models/budget.dart';

class BudgetRepository {
  final _api = locator<Api>().dio;
  final fbFunctions = FirebaseFunctions.instance;
  Future<List<Budget>> readBudgets(int monthNumber) async {
    try {
      final result = await fbFunctions.httpsCallable("getBudgets").call();
      final map = json.decode(result.data);
      return _mapArrayToBudgets(map);
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  List<Budget> _mapArrayToBudgets(dynamic array) {
    List<Budget> budgets = [];
    for (final map in array) {
      budgets.add(Budget.fromMap(map));
    }
    return budgets;
  }

  Future<Budget> addBudget(BudgetInput input) async {
    try {
      final result =
          await fbFunctions.httpsCallable("addBudget").call(input.toMap());

      return Budget.fromJson(result.data);
    } on FirebaseFunctionsException catch (e) {
      if (e.code == "out-of-range") {
        throw InavlidInputException(e.message!);
      }
      throw ServerException();
    }
  }

  Future<void> updateBudget(BudgetInput input, String id) async {
    try {
      await _api.patch("${ApiConfig.budgetPath}/$id", data: input.toMap());
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  Future<void> deleteBudget(String id) async {
    try {
      final response = await _api.delete(
        "${ApiConfig.budgetPath}/$id",
      );
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }
}
