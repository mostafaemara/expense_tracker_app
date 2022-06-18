import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum UsernameValidationFailure {
  empty,
  invalid,
  tooShort;

  String translate(BuildContext context) {
    switch (this) {
      case UsernameValidationFailure.empty:
        return AppLocalizations.of(context)!.enterUserName;
      case UsernameValidationFailure.invalid:
        return AppLocalizations.of(context)!.invalidUserName;
      case UsernameValidationFailure.tooShort:
        return AppLocalizations.of(context)!.userNameIsTooShort;
    }
  }
}

UsernameValidationFailure? userNameValidator(String value) {
  if (value.isEmpty) {
    return UsernameValidationFailure.empty;
  }
  if (!isAlphanumeric(value)) {
    return UsernameValidationFailure.invalid;
  }
  if (value.length < 4) {
    return UsernameValidationFailure.tooShort;
  }
  return null;
}

enum EmailValidationFailure {
  empty,
  invalid;

  String translate(BuildContext context) {
    switch (this) {
      case EmailValidationFailure.empty:
        return AppLocalizations.of(context)!.enterEmail;

      case EmailValidationFailure.invalid:
        return AppLocalizations.of(context)!.enterValidEmail;
    }
  }
}

EmailValidationFailure? emailValidator(String value) {
  if (value.isEmpty) {
    return EmailValidationFailure.empty;
  }
  if (!isEmail(value)) {
    return EmailValidationFailure.invalid;
  }
  return null;
}

enum PasswordValidationFailure {
  empty,
  shortPassword;

  String translate(BuildContext context) {
    switch (this) {
      case PasswordValidationFailure.empty:
        return AppLocalizations.of(context)!.enterPassword;

      case PasswordValidationFailure.shortPassword:
        return AppLocalizations.of(context)!.passwordTooShort;
    }
  }
}

PasswordValidationFailure? passwordValidator(String value) {
  if (value.isEmpty) {
    return PasswordValidationFailure.empty;
  }
  if (value.length <= 6) {
    return PasswordValidationFailure.shortPassword;
  }
  return null;
}

enum ConfirmPasswordValidationFailure {
  empty,
  passwordNotMatch;

  String translate(BuildContext context) {
    switch (this) {
      case ConfirmPasswordValidationFailure.empty:
        return AppLocalizations.of(context)!.enterConfirmPassword;
      case ConfirmPasswordValidationFailure.passwordNotMatch:
        return AppLocalizations.of(context)!.passwordNotMatch;
    }
  }
}

ConfirmPasswordValidationFailure? confirmPasswordValidator(
    String value, String password) {
  if (value.isEmpty) {
    return ConfirmPasswordValidationFailure.empty;
  }
  if (value != password) {
    return ConfirmPasswordValidationFailure.passwordNotMatch;
  }
  return null;
}

enum FormFieldFailure {
  empty;

  String translate(BuildContext context) {
    return AppLocalizations.of(context)!.enterField;
  }
}

FormFieldFailure? formFieldValidator(String value) {
  if (value.isEmpty) {
    return FormFieldFailure.empty;
  }
  return null;
}
