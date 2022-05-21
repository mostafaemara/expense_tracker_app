import 'package:expense_tracker_app/src/validators/validation_failures.dart';

EmptyFormFieldFailure? formFieldValidator(String value) {
  if (value.isEmpty) {
    return const EmptyFormFieldFailure();
  }
}
