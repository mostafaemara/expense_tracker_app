import 'package:expense_tracker_app/src/data/repositories/account_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/budget_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/config_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/date_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/notification_repository.dart';

import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';

import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';

import 'package:expense_tracker_app/src/data/repositories/auth_repository.dart';
import 'package:expense_tracker_app/src/manger/connection_manger.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;
Future<void> initializeDependencies() async {
  locator.registerSingleton<ConnectionManger>(ConnectionManger());
  locator.registerSingletonAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  locator.registerSingletonWithDependencies<ConfigRepository>(
      () => ConfigRepository(),
      dependsOn: [SharedPreferences]);
  locator.registerSingletonWithDependencies<UserRepository>(
      () => UserRepository(),
      dependsOn: [SharedPreferences]);

  locator.registerSingleton<AccountRepository>(
    AccountRepository(),
  );
  locator.registerSingleton<NotificationRepository>(
    NotificationRepository(),
  );
  locator.registerSingleton<AuthRepository>(
    AuthRepository(),
  );
  locator.registerSingleton<DateRepository>(DateRepository());
  locator.registerSingleton<TransactionRepository>(
    TransactionRepository(),
  );
  locator.registerSingleton<BudgetRepository>(
    BudgetRepository(),
  );

  return await locator.allReady();
}
