import 'package:expense_tracker_app/src/models/inputs/login_input.dart';
import 'package:expense_tracker_app/src/models/inputs/signup_input.dart';
import 'package:expense_tracker_app/src/models/user.dart';

abstract class AuthService {
  Future<User> login(LoginInput input);
  Future<User> signup(SignupInput input);
  Future<void> sendPasswordResetEmail(String email);
  Future<void> setNewPassword(String code, String newPassword);

  Stream<User?> onAuthChange();
}
