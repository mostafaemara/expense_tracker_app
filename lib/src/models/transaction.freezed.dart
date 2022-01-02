// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransactionTypeTearOff {
  const _$TransactionTypeTearOff();

  _Expense expense() {
    return const _Expense();
  }

  _Income income() {
    return const _Income();
  }

  _SentTransfer sentTransfer() {
    return const _SentTransfer();
  }

  _RecivedTransfer recivedTransfer() {
    return const _RecivedTransfer();
  }
}

/// @nodoc
const $TransactionType = _$TransactionTypeTearOff();

/// @nodoc
mixin _$TransactionType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expense,
    required TResult Function() income,
    required TResult Function() sentTransfer,
    required TResult Function() recivedTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? sentTransfer,
    TResult Function()? recivedTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? sentTransfer,
    TResult Function()? recivedTransfer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Expense value) expense,
    required TResult Function(_Income value) income,
    required TResult Function(_SentTransfer value) sentTransfer,
    required TResult Function(_RecivedTransfer value) recivedTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_SentTransfer value)? sentTransfer,
    TResult Function(_RecivedTransfer value)? recivedTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_SentTransfer value)? sentTransfer,
    TResult Function(_RecivedTransfer value)? recivedTransfer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionTypeCopyWith<$Res> {
  factory $TransactionTypeCopyWith(
          TransactionType value, $Res Function(TransactionType) then) =
      _$TransactionTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionTypeCopyWithImpl<$Res>
    implements $TransactionTypeCopyWith<$Res> {
  _$TransactionTypeCopyWithImpl(this._value, this._then);

  final TransactionType _value;
  // ignore: unused_field
  final $Res Function(TransactionType) _then;
}

/// @nodoc
abstract class _$ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) then) =
      __$ExpenseCopyWithImpl<$Res>;
}

/// @nodoc
class __$ExpenseCopyWithImpl<$Res> extends _$TransactionTypeCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(_Expense _value, $Res Function(_Expense) _then)
      : super(_value, (v) => _then(v as _Expense));

  @override
  _Expense get _value => super._value as _Expense;
}

/// @nodoc

class _$_Expense extends _Expense {
  const _$_Expense() : super._();

  @override
  String toString() {
    return 'TransactionType.expense()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Expense);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expense,
    required TResult Function() income,
    required TResult Function() sentTransfer,
    required TResult Function() recivedTransfer,
  }) {
    return expense();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? sentTransfer,
    TResult Function()? recivedTransfer,
  }) {
    return expense?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? sentTransfer,
    TResult Function()? recivedTransfer,
    required TResult orElse(),
  }) {
    if (expense != null) {
      return expense();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Expense value) expense,
    required TResult Function(_Income value) income,
    required TResult Function(_SentTransfer value) sentTransfer,
    required TResult Function(_RecivedTransfer value) recivedTransfer,
  }) {
    return expense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_SentTransfer value)? sentTransfer,
    TResult Function(_RecivedTransfer value)? recivedTransfer,
  }) {
    return expense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_SentTransfer value)? sentTransfer,
    TResult Function(_RecivedTransfer value)? recivedTransfer,
    required TResult orElse(),
  }) {
    if (expense != null) {
      return expense(this);
    }
    return orElse();
  }
}

abstract class _Expense extends TransactionType {
  const factory _Expense() = _$_Expense;
  const _Expense._() : super._();
}

/// @nodoc
abstract class _$IncomeCopyWith<$Res> {
  factory _$IncomeCopyWith(_Income value, $Res Function(_Income) then) =
      __$IncomeCopyWithImpl<$Res>;
}

/// @nodoc
class __$IncomeCopyWithImpl<$Res> extends _$TransactionTypeCopyWithImpl<$Res>
    implements _$IncomeCopyWith<$Res> {
  __$IncomeCopyWithImpl(_Income _value, $Res Function(_Income) _then)
      : super(_value, (v) => _then(v as _Income));

  @override
  _Income get _value => super._value as _Income;
}

/// @nodoc

class _$_Income extends _Income {
  const _$_Income() : super._();

  @override
  String toString() {
    return 'TransactionType.income()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Income);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expense,
    required TResult Function() income,
    required TResult Function() sentTransfer,
    required TResult Function() recivedTransfer,
  }) {
    return income();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? sentTransfer,
    TResult Function()? recivedTransfer,
  }) {
    return income?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? sentTransfer,
    TResult Function()? recivedTransfer,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Expense value) expense,
    required TResult Function(_Income value) income,
    required TResult Function(_SentTransfer value) sentTransfer,
    required TResult Function(_RecivedTransfer value) recivedTransfer,
  }) {
    return income(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_SentTransfer value)? sentTransfer,
    TResult Function(_RecivedTransfer value)? recivedTransfer,
  }) {
    return income?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_SentTransfer value)? sentTransfer,
    TResult Function(_RecivedTransfer value)? recivedTransfer,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income(this);
    }
    return orElse();
  }
}

abstract class _Income extends TransactionType {
  const factory _Income() = _$_Income;
  const _Income._() : super._();
}

/// @nodoc
abstract class _$SentTransferCopyWith<$Res> {
  factory _$SentTransferCopyWith(
          _SentTransfer value, $Res Function(_SentTransfer) then) =
      __$SentTransferCopyWithImpl<$Res>;
}

/// @nodoc
class __$SentTransferCopyWithImpl<$Res>
    extends _$TransactionTypeCopyWithImpl<$Res>
    implements _$SentTransferCopyWith<$Res> {
  __$SentTransferCopyWithImpl(
      _SentTransfer _value, $Res Function(_SentTransfer) _then)
      : super(_value, (v) => _then(v as _SentTransfer));

  @override
  _SentTransfer get _value => super._value as _SentTransfer;
}

/// @nodoc

class _$_SentTransfer extends _SentTransfer {
  const _$_SentTransfer() : super._();

  @override
  String toString() {
    return 'TransactionType.sentTransfer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SentTransfer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expense,
    required TResult Function() income,
    required TResult Function() sentTransfer,
    required TResult Function() recivedTransfer,
  }) {
    return sentTransfer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? sentTransfer,
    TResult Function()? recivedTransfer,
  }) {
    return sentTransfer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? sentTransfer,
    TResult Function()? recivedTransfer,
    required TResult orElse(),
  }) {
    if (sentTransfer != null) {
      return sentTransfer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Expense value) expense,
    required TResult Function(_Income value) income,
    required TResult Function(_SentTransfer value) sentTransfer,
    required TResult Function(_RecivedTransfer value) recivedTransfer,
  }) {
    return sentTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_SentTransfer value)? sentTransfer,
    TResult Function(_RecivedTransfer value)? recivedTransfer,
  }) {
    return sentTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_SentTransfer value)? sentTransfer,
    TResult Function(_RecivedTransfer value)? recivedTransfer,
    required TResult orElse(),
  }) {
    if (sentTransfer != null) {
      return sentTransfer(this);
    }
    return orElse();
  }
}

abstract class _SentTransfer extends TransactionType {
  const factory _SentTransfer() = _$_SentTransfer;
  const _SentTransfer._() : super._();
}

/// @nodoc
abstract class _$RecivedTransferCopyWith<$Res> {
  factory _$RecivedTransferCopyWith(
          _RecivedTransfer value, $Res Function(_RecivedTransfer) then) =
      __$RecivedTransferCopyWithImpl<$Res>;
}

/// @nodoc
class __$RecivedTransferCopyWithImpl<$Res>
    extends _$TransactionTypeCopyWithImpl<$Res>
    implements _$RecivedTransferCopyWith<$Res> {
  __$RecivedTransferCopyWithImpl(
      _RecivedTransfer _value, $Res Function(_RecivedTransfer) _then)
      : super(_value, (v) => _then(v as _RecivedTransfer));

  @override
  _RecivedTransfer get _value => super._value as _RecivedTransfer;
}

/// @nodoc

class _$_RecivedTransfer extends _RecivedTransfer {
  const _$_RecivedTransfer() : super._();

  @override
  String toString() {
    return 'TransactionType.recivedTransfer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RecivedTransfer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expense,
    required TResult Function() income,
    required TResult Function() sentTransfer,
    required TResult Function() recivedTransfer,
  }) {
    return recivedTransfer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? sentTransfer,
    TResult Function()? recivedTransfer,
  }) {
    return recivedTransfer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? sentTransfer,
    TResult Function()? recivedTransfer,
    required TResult orElse(),
  }) {
    if (recivedTransfer != null) {
      return recivedTransfer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Expense value) expense,
    required TResult Function(_Income value) income,
    required TResult Function(_SentTransfer value) sentTransfer,
    required TResult Function(_RecivedTransfer value) recivedTransfer,
  }) {
    return recivedTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_SentTransfer value)? sentTransfer,
    TResult Function(_RecivedTransfer value)? recivedTransfer,
  }) {
    return recivedTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_SentTransfer value)? sentTransfer,
    TResult Function(_RecivedTransfer value)? recivedTransfer,
    required TResult orElse(),
  }) {
    if (recivedTransfer != null) {
      return recivedTransfer(this);
    }
    return orElse();
  }
}

abstract class _RecivedTransfer extends TransactionType {
  const factory _RecivedTransfer() = _$_RecivedTransfer;
  const _RecivedTransfer._() : super._();
}
