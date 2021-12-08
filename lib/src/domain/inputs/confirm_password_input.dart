import 'package:expense_tracker_app/src/domain/failures/validation_failures.dart';
import 'package:formz/formz.dart';
import 'package:expense_tracker_app/src/domain/inputs/input_helper.dart';

class ConfirmPasswordInput
    extends FormzInput<String, ConfirmPasswordValidationFailure>
    with FormzInputHelper {
  final String password;

  const ConfirmPasswordInput.pure({this.password = ""})
      : super.pure("password");

  ConfirmPasswordInput.dirty(
      {required String? confirmPassword, required this.password})
      : super.dirty(confirmPassword ?? "");
  @override
  ConfirmPasswordValidationFailure? validator(String value) {
    if (value.isEmpty) {
      return const ConfirmPasswordValidationFailure.empty();
    }
    if (value != password) {
      return const ConfirmPasswordValidationFailure.passwordNotMatch();
    }
  }
}
