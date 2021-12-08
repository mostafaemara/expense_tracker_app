import 'package:formz/formz.dart';

mixin FormzInputHelper<T, E> on FormzInput<T, E> {
  E? getErrorOrNull() {
    if (invalid) {
      return error;
    }
  }
}
