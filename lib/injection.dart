import 'package:expense_tracker_app/src/services/auth_service_impl.dart';
import 'package:get_it/get_it.dart';

import 'src/repositories/firestore_user_repository.dart';
import 'src/repositories/user_repository.dart';
import 'src/services/auth_service.dart';

final locator = GetIt.instance;
Future<void> initializeDependencies() async {
  locator.registerSingleton<UserRepository>(FirestoreUserRepository());
  locator.registerSingleton<AuthService>(AuthServiceImpl());
  //locator.registerSingleton<AccountsRepository>(AccountsRepository());
}
