import 'package:expense_tracker_app/src/domain/entities/user.dart';

abstract class AuthService {
  Future<User> login(String email, String password);

  Future<User> signup(String email, String password, String userName);

  Future<void> sendPasswordResetEmail(String email);
  Future<void> setNewPassword(String code, String newPassword);
  Future<User?> getUser();
}
