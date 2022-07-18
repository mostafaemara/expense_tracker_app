import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/inputs/account_input.dart';

class AccountRepository {
  final _api = locator<Api>().dio;

  Future<Account> addAccount(
    AccountInput account,
  ) async {
    try {
      final response =
          await _api.post(ApiConfig.accountPath, data: account.toMap());
      log(response.data.toString());
      return Account.fromMap(response.data["data"]);
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  Future<List<Account>> getAccounts() async {
    try {
      final response = await _api.get(
        ApiConfig.accountPath,
      );

      return _accountsFromArray(response.data["data"]!);
    } on DioError catch (e) {
      throw e.mapToAppExceptions();
    }
  }

  List<Account> _accountsFromArray(List<dynamic> array) {
    final List<Account> accounts = [];
    for (final map in array) {
      accounts.add(Account.fromMap(map));
    }
    return accounts;
  }

  Future<bool> accountsIsEmpty() async {
    final accounts = await getAccounts();
    if (accounts.isEmpty) {
      return true;
    }

    return false;
  }
}
