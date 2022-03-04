import 'package:expense_tracker_app/src/data/repositories/date_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/proxies/accounts_proxy.dart';
import 'package:expense_tracker_app/src/data/repositories/interfaces/accounts_repository.dart';

import 'package:expense_tracker_app/src/data/repositories/firestore_date_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository_impl.dart';
import 'package:expense_tracker_app/src/data/repositories/interfaces/transaction_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/proxies/transactions_proxy.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository_impl.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';

import 'package:expense_tracker_app/src/data/repositories/auth_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/data/repositories/account_repository_impl.dart';

import 'src/data/repositories/interfaces/user_repository.dart';
import 'src/data/repositories/interfaces/auth_repository.dart';

final locator = GetIt.instance;
Future<void> initializeDependencies() async {
  locator.registerSingletonAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  locator.registerSingletonWithDependencies<UserRepository>(
      () => UserRepositoryImpl(),
      dependsOn: [SharedPreferences]);
  locator.registerSingletonWithDependencies<Api>(() => Api()..init(),
      dependsOn: [UserRepository]);

  locator.registerSingletonWithDependencies<AuthService>(
      () => AuthRepositoryImpl(),
      dependsOn: [UserRepository, Api]);
  locator.registerSingleton<DateRepository>(FSDateRepository());
  locator.registerSingletonWithDependencies<AccountsRepository>(
      () => AccountsProxy(AccountRepositoryImpl()),
      dependsOn: [Api]);

  locator.registerSingletonWithDependencies<TransactionRepository>(
      () => TransactionsProxy(TransactionRepositoryImpl()),
      dependsOn: [Api]);
  return await locator.allReady();
}
