import 'package:expense_tracker_app/src/data/models/user.dart';

abstract class UserRepository {
  Future<User?> readUser();

  Future<void> writeUser(User user);

  Future<void> deleteUser();
}
