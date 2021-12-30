import 'package:expense_tracker_app/src/models/account.dart';

abstract class AccountsRepository {
  Future<List<Account>> getAccounts(String uid);

  Future<Account> addAccount(AccountInput account, String uid);
  Future<bool> accountsIsEmpty(String uid);
}
