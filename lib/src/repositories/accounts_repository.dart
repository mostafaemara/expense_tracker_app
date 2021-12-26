import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/models/transaction_input.dart';

abstract class AccountsRepository {
  Future<List<Account>> getAccounts(String uid);
  Future<List<Transaction>> getAllTransactions(String uid);

  Future<void> addTransaction(TransactionInput transaction, String uid);
  Future<void> addAccount(Account account, String uid);
}
