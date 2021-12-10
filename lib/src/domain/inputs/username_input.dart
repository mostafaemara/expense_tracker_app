import 'package:expense_tracker_app/src/domain/failures/validation_failures.dart';

import 'package:validators/validators.dart';

import 'input.dart';

class UsernameInput extends Input<String, UsernameValidationFailure> {
  UsernameInput.dirty(String value) : super(value);
  UsernameInput.pure() : super("");
  @override
  UsernameValidationFailure? validator() {
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
