import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';

abstract class AccountsRepository {
  Future<List<Account>> getAccounts(String uid);
  Future<List<Transaction>> getAllTransactions(String uid);

  Future<void> addTransaction(Transaction transaction);
  Future<void> addAccount(Account account, String uid);
}
