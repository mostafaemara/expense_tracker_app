import 'package:expense_tracker_app/src/domain/failures/validation_failures.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension EmailFaliureTranslator on EmailValidationFailure {
  String toLocaleString(BuildContext context) {
    return when(
        invalid: () => AppLocalizations.of(context)!.enterValidEmail,
        empty: () => AppLocalizations.of(context)!.enterEmail);
  }
}

extension UsernameFaliureTranslator on UsernameValidationFailure {
  String toLocaleString(BuildContext context) {
    return when(
        tooShort: () => AppLocalizations.of(context)!.userNameIsTooShort,
        invalid: () => AppLocalizations.of(context)!.enterUserName,
        empty: () => AppLocalizations.of(context)!.enterUserName);
  }
}

extension PasswordFaliureTranslator on PasswordValidationFailure {
  String toLocaleString(BuildContext context) {
    return when(
        shortPassword: () => AppLocalizations.of(context)!.passwordTooShort,
        empty: () => AppLocalizations.of(context)!.enterPassword);
  }
}

extension ConfirmPasswordFaliureTranslator on ConfirmPasswordValidationFailure {
  String toLocaleString(BuildContext context) {
    return when(
        passwordNotMatch: () => AppLocalizations.of(context)!.passwordNotMatch,
        empty: () => AppLocalizations.of(context)!.enterPassword);
  }
}
