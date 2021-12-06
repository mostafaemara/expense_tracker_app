import 'package:expense_tracker_app/src/data/repositories/user_repository_impl.dart';
import 'package:expense_tracker_app/src/domain/services/auth_service.dart';
import 'package:expense_tracker_app/src/services/auth_service_impl.dart';
import 'package:get_it/get_it.dart';

import 'src/domain/reposiotries/user_repository.dart';

final locator = GetIt.instance;
Future<void> initializeDependencies() async {
  locator.registerSingleton<UserRepository>(UserRepositoryImpl());
  locator.registerSingleton<AuthService>(AuthServiceImpl());
}
