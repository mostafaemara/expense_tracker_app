import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final SharedPreferences _db = locator.get<SharedPreferences>();
  final _key = "user";

  Future<User?> readUser() async {
    final userJson = _db.getString(_key);
    if (userJson != null) {
      return User.fromJson(userJson);
    }
    return null;
  }

  Future<void> writeUser(User user) async {
    await _db.setString(_key, user.toJson());
  }

  Future<void> deleteUser() async {
    await _db.remove(_key);
  }
}
