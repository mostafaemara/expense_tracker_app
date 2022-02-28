import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/models/user.dart';
import 'package:expense_tracker_app/src/repositories/interfaces/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository {
  final SharedPreferences _db = locator.get<SharedPreferences>();
  final _key = "user";
  @override
  Future<User?> readUser() async {
    final userJson = _db.getString(_key);
    if (userJson != null) {
      return User.fromJson(userJson);
    }
    return null;
  }

  @override
  Future<void> writeUser(User user) async {
    await _db.setString(_key, user.toJson());
  }

  @override
  Future<void> deleteUser() async {
    await _db.remove(_key);
  }
}
