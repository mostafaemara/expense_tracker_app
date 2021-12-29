import 'package:expense_tracker_app/src/repositories/categories/categories_proxy.dart';
import 'package:expense_tracker_app/src/repositories/categories/categories_repository.dart';
import 'package:expense_tracker_app/src/repositories/categories/firestore_categories_repository.dart';
import 'package:expense_tracker_app/src/repositories/firestore_accounts_repository.dart';
import 'package:expense_tracker_app/src/repositories/firestore_transaction_repository.dart';
import 'package:expense_tracker_app/src/repositories/transaction_repository.dart';
import 'package:expense_tracker_app/src/services/auth_service_impl.dart';
import 'package:get_it/get_it.dart';

import 'src/repositories/accounts_repository.dart';
import 'src/repositories/firestore_user_repository.dart';
import 'src/repositories/user_repository.dart';
import 'src/services/auth_service.dart';

final locator = GetIt.instance;
Future<void> initializeDependencies() async {
  locator.registerSingleton<UserRepository>(FirestoreUserRepository());
  locator.registerSingleton<AuthService>(AuthServiceImpl());
  locator.registerSingleton<AccountsRepository>(FirestoreAccountsRepository());
  locator.registerSingleton<CategoriesRepository>(
      CategoriesProxy(FSCategoriesRepository()));
  locator.registerSingleton<TransactionRepository>(FSTransactionRepository());
}
