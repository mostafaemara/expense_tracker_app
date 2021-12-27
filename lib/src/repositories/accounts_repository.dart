import 'package:expense_tracker_app/src/models/account.dart';

abstract class AccountsRepository {
  Future<List<Account>> getAccounts(String uid);

  Future<void> addAccount(Account account, String uid);
}
