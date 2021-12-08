import 'package:expense_tracker_app/src/domain/failures/validation_failures.dart';
import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

import 'input_helper.dart';

class UsernameInput extends FormzInput<String, UsernameValidationFailure>
    with FormzInputHelper {
  const UsernameInput.pure() : super.pure("");

  const UsernameInput.dirty(String? value) : super.dirty(value ?? "");

  @override
  UsernameValidationFailure? validator(String value) {
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
}
