import 'package:expense_tracker_app/src/domain/failures/validation_failures.dart';

import 'input.dart';

// class ConfirmPasswordInput
//     extends FormzInput<String, ConfirmPasswordValidationFailure>
//     with FormzInputHelper {
//   final String password;

//   const ConfirmPasswordInput.pure({this.password = ""})
//       : super.pure("password");

//   ConfirmPasswordInput.dirty(
//       {required String? confirmPassword, required this.password})
//       : super.dirty(confirmPassword ?? "");
//   @override
//   ConfirmPasswordValidationFailure? validator(String value) {
//     if (value.isEmpty) {
//       return const ConfirmPasswordValidationFailure.empty();
//     }
//     if (value != password) {
//       return const ConfirmPasswordValidationFailure.passwordNotMatch();
//     }
//   }
// }

class ConfirmPasswordInput
    extends Input<String, ConfirmPasswordValidationFailure> {
  final String password;
  ConfirmPasswordInput.pure()
      : password = "",
        super("");
  ConfirmPasswordInput.dirty(
      {required this.password, required String confirmPassword})
      : super(confirmPassword);

  @override
  ConfirmPasswordValidationFailure? validator() {
    if (value.isEmpty) {
      return const ConfirmPasswordValidationFailure.empty();
    }
    if (value != password) {
      return const ConfirmPasswordValidationFailure.passwordNotMatch();
    }
  }
}
