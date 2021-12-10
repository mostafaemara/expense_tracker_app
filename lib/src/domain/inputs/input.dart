abstract class Input<T, E> {
  final T value;
  final bool showError = false;
  E? get error => validator();
  bool get valid => error == null ? true : false;
  Input(this.value);

  E? validator();
}
