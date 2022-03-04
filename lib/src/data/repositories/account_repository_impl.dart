import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';
import 'package:expense_tracker_app/src/data/api/api_config.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';

import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/inputs/account_input.dart';

import 'interfaces/accounts_repository.dart';

class AccountRepositoryImpl implements AccountsRepository {
  final _api = locator<Api>();
  @override
  Future<Account> addAccount(
    AccountInput account,
  ) async {
    log(account.toMap().toString());
    try {
      final response =
          await _api.dio.post(ApiConfig.accountPath, data: account.toMap());
      log(response.data.toString());
      log(response.data.runtimeType.toString());
      return Account.fromMap(response.data);
    } on DioError catch (e) {
      log(e.response.toString());

      throw ServerException();
    }
  }

  @override
  Future<List<Account>> getAccounts() async {
    try {
      final response = await _api.dio.get(
        ApiConfig.accountPath,
      );
      log(response.data.toString());

      return _accountsFromArray(response.data!);
    } catch (e) {
      log("Errror", error: e.toString());
      throw ServerException();
    }
  }

  List<Account> _accountsFromArray(List<dynamic> array) {
    final List<Account> accounts = [];
    for (final map in array) {
      accounts.add(Account.fromMap(map));
    }
    return accounts;
  }

  @override
  Future<bool> accountsIsEmpty() async {
    final accounts = await getAccounts();
    if (accounts.isEmpty) {
      return true;
    }

    return false;
  }

  @override
  Stream<List<Account>> onAccountsChange() {
    // TODO: implement onAccountsChange
    throw UnimplementedError();
  }
}
