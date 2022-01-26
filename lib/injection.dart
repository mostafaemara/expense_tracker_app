import 'package:expense_tracker_app/src/models/uid.dart';
import 'package:expense_tracker_app/src/repositories/categories/categories_proxy.dart';
import 'package:expense_tracker_app/src/repositories/categories/categories_repository.dart';
import 'package:expense_tracker_app/src/repositories/categories/firestore_categories_repository.dart';
import 'package:expense_tracker_app/src/repositories/date_repository.dart';
import 'package:expense_tracker_app/src/repositories/firestore_accounts_repository.dart';
import 'package:expense_tracker_app/src/repositories/firestore_date_repository.dart';
import 'package:expense_tracker_app/src/repositories/transactions/firestore_transaction_repository.dart';
import 'package:expense_tracker_app/src/repositories/transactions/transaction_repository.dart';
import 'package:expense_tracker_app/src/repositories/transactions/transactions_proxy.dart';

import 'package:expense_tracker_app/src/services/auth_service_impl.dart';
import 'package:get_it/get_it.dart';

import 'src/repositories/accounts_repository.dart';
import 'src/repositories/firestore_user_repository.dart';
import 'src/repositories/user_repository.dart';
import 'src/services/auth_service.dart';

final locator = GetIt.instance;
Future<void> initializeDependencies() async {
  locator.registerSingleton<UID>(UID());
  locator.registerSingleton<UserRepository>(FirestoreUserRepository());
  locator.registerSingleton<AuthService>(AuthServiceImpl());
  locator.registerSingleton<DateRepository>(FSDateRepository());
  locator.registerSingleton<AccountsRepository>(FirestoreAccountsRepository());
  locator.registerSingleton<CategoriesRepository>(
      CategoriesProxy(FSCategoriesRepository()));
  locator.registerSingleton<TransactionRepository>(
      TransactionsProxy(FSTransactionRepository()));
}
