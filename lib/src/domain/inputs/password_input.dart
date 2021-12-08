import 'package:expense_tracker_app/src/domain/failures/validation_failures.dart';
import 'package:formz/formz.dart';

import 'input_helper.dart';

class PasswordInput extends FormzInput<String, PasswordValidationFailure>
    with FormzInputHelper {
  const PasswordInput.dirty(String value) : super.dirty(value);
  const PasswordInput.pure() : super.dirty("");
  @override
  PasswordValidationFailure? validator(String value) {
    if (value.isEmpty) {
      return const PasswordValidationFailure.empty();
    }
    if (value.length <= 6) {
      return const PasswordValidationFailure.shortPassword();
    }
  }
}
