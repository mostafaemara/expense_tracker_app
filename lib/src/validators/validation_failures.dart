part 'validation_failures.freezed.dart';

abstract class UsernameValidationFailure with _$UsernameValidationFailure {
  const factory UsernameValidationFailure.invalid() = _InvalidUserName;

  const factory UsernameValidationFailure.empty() = _Empty;
  const factory UsernameValidationFailure.tooShort() = _TooShortUserName;
}

abstract class EmailValidationFailure with _$EmailValidationFailure {
  const factory EmailValidationFailure.invalid() = _InvalidEmail;
  const factory EmailValidationFailure.empty() = _EmailEmpty;
}

abstract class PasswordValidationFailure with _$PasswordValidationFailure {
  const factory PasswordValidationFailure.shortPassword() = _ShortPassword;

  const factory PasswordValidationFailure.empty() = _PasswordEmpty;
}

abstract class ConfirmPasswordValidationFailure
    with _$ConfirmPasswordValidationFailure {
  const factory ConfirmPasswordValidationFailure.passwordNotMatch() =
      _PasswordNotMatch;
  const factory ConfirmPasswordValidationFailure.empty() =
      _ConfirmPasswordEmpty;
}

class EmptyFormFieldFailure {
  const EmptyFormFieldFailure();
}
