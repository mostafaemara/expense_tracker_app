import 'package:expense_tracker_app/src/domain/failures/validation_failures.dart';
import 'package:validators/validators.dart';

UsernameValidationFailure? userNameValidator(String value) {
  if (value.isEmpty) {
    return const UsernameValidationFailure.empty();
  }
  if (!isAlphanumeric(value)) {
    return const UsernameValidationFailure.invalid();
  }
  if (value.length < 4) {
    return const UsernameValidationFailure.tooShort();
  }
}

EmailValidationFailure? emailValidator(String value) {
  if (value.isEmpty) {
    return const EmailValidationFailure.empty();
  }
  if (!isEmail(value)) {
    return const EmailValidationFailure.invalid();
  }
}

PasswordValidationFailure? passwordValidator(String value) {
  if (value.isEmpty) {
    return const PasswordValidationFailure.empty();
  }
  if (value.length <= 6) {
    return const PasswordValidationFailure.shortPassword();
  }
}

ConfirmPasswordValidationFailure? confirmPasswordValidator(
    String value, String password) {
  if (value.isEmpty) {
    return const ConfirmPasswordValidationFailure.empty();
  }
  if (value != password) {
    return const ConfirmPasswordValidationFailure.passwordNotMatch();
  }
}
