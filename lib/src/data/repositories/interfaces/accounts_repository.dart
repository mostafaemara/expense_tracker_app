import 'package:expense_tracker_app/src/data/models/account.dart';

abstract class AccountsRepository {
  Future<List<Account>> getAccounts();

  Future<Account> addAccount(
    AccountInput account,
  );
  Future<bool> accountsIsEmpty();

  Stream<List<Account>> onAccountsChange();
}
