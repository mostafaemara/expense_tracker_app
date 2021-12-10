import 'package:expense_tracker_app/src/domain/failures/validation_failures.dart';
import 'package:expense_tracker_app/src/domain/inputs/input_helper.dart';
import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

import 'input.dart';

// class EmailInput extends FormzInput<String, EmailValidationFailure>
//     with FormzInputHelper {
//   const EmailInput.dirty(String value) : super.dirty(value);
//   const EmailInput.pure() : super.pure("");

//   @override
//   EmailValidationFailure? validator(String value) {
//     if (value.isEmpty) {
//       return const EmailValidationFailure.empty();
//     }
//     if (!isEmail(value)) {
//       return const EmailValidationFailure.invalid();
//     }
//   }
// }

class EmailInput extends Input<String, EmailValidationFailure> {
  EmailInput.dirty(String value) : super(value);
  EmailInput.pure() : super("");
  @override
  EmailValidationFailure? validator() {
    if (value.isEmpty) {
      return const EmailValidationFailure.empty();
    }
    if (!isEmail(value)) {
      return const EmailValidationFailure.invalid();
    }
  }
}
