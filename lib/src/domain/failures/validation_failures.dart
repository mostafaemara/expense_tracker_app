import 'package:freezed_annotation/freezed_annotation.dart';
part "validation_failures.freezed.dart";

@freezed
abstract class UsernameValidationFailure with _$UsernameValidationFailure {
  const factory UsernameValidationFailure.invalid() = _InvalidUserName;

  const factory UsernameValidationFailure.empty() = _Empty;
  const factory UsernameValidationFailure.tooShort() = _TooShortUserName;
}

@freezed
abstract class EmailValidationFailure with _$EmailValidationFailure {
  const factory EmailValidationFailure.invalid() = _InvalidEmail;
  const factory EmailValidationFailure.empty() = _EmailEmpty;
}

@freezed
abstract class PasswordValidationFailure with _$PasswordValidationFailure {
  const factory PasswordValidationFailure.shortPassword() = _ShortPassword;

  const factory PasswordValidationFailure.empty() = _PasswordEmpty;
}

@freezed
abstract class ConfirmPasswordValidationFailure
    with _$ConfirmPasswordValidationFailure {
  const factory ConfirmPasswordValidationFailure.passwordNotMatch() =
      _PasswordNotMatch;
  const factory ConfirmPasswordValidationFailure.empty() =
      _ConfirmPasswordEmpty;
}
