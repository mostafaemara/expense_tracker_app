import 'dart:async';

import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/repositories/interfaces/accounts_repository.dart';

class AccountsProxy implements AccountsRepository {
  final AccountsRepository _accountsRepository;
  List<Account>? _accounts;

  final _controller = StreamController<List<Account>>();
  AccountsProxy(this._accountsRepository);

  @override
  Future<bool> accountsIsEmpty() async {
    _accounts ??= await _accountsRepository.getAccounts();

    return _accounts!.isEmpty;
  }

  @override
  Future<Account> addAccount(AccountInput accountInput) async {
    _accounts ??= await _accountsRepository.getAccounts();

    final account = await _accountsRepository.addAccount(accountInput);

    _accounts!.add(account);

    return account;
  }

  @override
  Future<List<Account>> getAccounts() async {
    _accounts ??= await _accountsRepository.getAccounts();
    return _accounts!;
  }

  @override
  Stream<List<Account>> onAccountsChange() => _controller.stream;
}
