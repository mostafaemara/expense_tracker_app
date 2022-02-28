import 'package:expense_tracker_app/src/models/user.dart';

abstract class UserRepository {
  Future<User?> readUser();

  Future<void> writeUser(User user);

  Future<void> deleteUser();
}
