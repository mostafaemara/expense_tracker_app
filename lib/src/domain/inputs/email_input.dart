import 'package:expense_tracker_app/src/domain/failures/validation_failures.dart';
import 'package:expense_tracker_app/src/domain/inputs/input_helper.dart';
import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

class EmailInput extends FormzInput<String, EmailValidationFailure>
    with FormzInputHelper {
  const EmailInput.dirty(String value) : super.dirty(value);
  const EmailInput.pure() : super.pure("");

  @override
  EmailValidationFailure? validator(String value) {
    if (value.isEmpty) {
      return const EmailValidationFailure.empty();
    }
    if (!isEmail(value)) {
      return const EmailValidationFailure.invalid();
    }
  }
}
