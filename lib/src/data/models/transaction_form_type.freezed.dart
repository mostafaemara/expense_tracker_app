// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_form_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransactionFormTypeTearOff {
  const _$TransactionFormTypeTearOff();

  _Expense expense() {
    return const _Expense();
  }

  _Income income() {
    return const _Income();
  }

  _Transfer transfer() {
    return const _Transfer();
  }
}

/// @nodoc
const $TransactionFormType = _$TransactionFormTypeTearOff();

/// @nodoc
mixin _$TransactionFormType {
  TResult when<TResult extends Object?>({
    required TResult Function() expense,
    required TResult Function() income,
    required TResult Function() transfer,
  }) =>
      throw _privateConstructorUsedError;

  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? transfer,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? transfer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  TResult map<TResult extends Object?>({
    required TResult Function(_Expense value) expense,
    required TResult Function(_Income value) income,
    required TResult Function(_Transfer value) transfer,
  }) =>
      throw _privateConstructorUsedError;

  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_Transfer value)? transfer,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_Transfer value)? transfer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFormTypeCopyWith<$Res> {
  factory $TransactionFormTypeCopyWith(
          TransactionFormType value, $Res Function(TransactionFormType) then) =
      _$TransactionFormTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionFormTypeCopyWithImpl<$Res>
    implements $TransactionFormTypeCopyWith<$Res> {
  _$TransactionFormTypeCopyWithImpl(this._value, this._then);

  final TransactionFormType _value;
  // ignore: unused_field
  final $Res Function(TransactionFormType) _then;
}

/// @nodoc
abstract class _$ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) then) =
      __$ExpenseCopyWithImpl<$Res>;
}

/// @nodoc
class __$ExpenseCopyWithImpl<$Res>
    extends _$TransactionFormTypeCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(_Expense _value, $Res Function(_Expense) _then)
      : super(_value, (v) => _then(v as _Expense));

  @override
  _Expense get _value => super._value as _Expense;
}

/// @nodoc

class _$_Expense implements _Expense {
  const _$_Expense();

  @override
  String toString() {
    return 'TransactionFormType.expense()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Expense);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() expense,
    required TResult Function() income,
    required TResult Function() transfer,
  }) {
    return expense();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? transfer,
  }) {
    return expense?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? transfer,
    required TResult orElse(),
  }) {
    if (expense != null) {
      return expense();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_Expense value) expense,
    required TResult Function(_Income value) income,
    required TResult Function(_Transfer value) transfer,
  }) {
    return expense(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_Transfer value)? transfer,
  }) {
    return expense?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_Transfer value)? transfer,
    required TResult orElse(),
  }) {
    if (expense != null) {
      return expense(this);
    }
    return orElse();
  }
}

abstract class _Expense implements TransactionFormType {
  const factory _Expense() = _$_Expense;
}

/// @nodoc
abstract class _$IncomeCopyWith<$Res> {
  factory _$IncomeCopyWith(_Income value, $Res Function(_Income) then) =
      __$IncomeCopyWithImpl<$Res>;
}

/// @nodoc
class __$IncomeCopyWithImpl<$Res>
    extends _$TransactionFormTypeCopyWithImpl<$Res>
    implements _$IncomeCopyWith<$Res> {
  __$IncomeCopyWithImpl(_Income _value, $Res Function(_Income) _then)
      : super(_value, (v) => _then(v as _Income));

  @override
  _Income get _value => super._value as _Income;
}

/// @nodoc

class _$_Income implements _Income {
  const _$_Income();

  @override
  String toString() {
    return 'TransactionFormType.income()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Income);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() expense,
    required TResult Function() income,
    required TResult Function() transfer,
  }) {
    return income();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? transfer,
  }) {
    return income?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? transfer,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_Expense value) expense,
    required TResult Function(_Income value) income,
    required TResult Function(_Transfer value) transfer,
  }) {
    return income(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_Transfer value)? transfer,
  }) {
    return income?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_Transfer value)? transfer,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income(this);
    }
    return orElse();
  }
}

abstract class _Income implements TransactionFormType {
  const factory _Income() = _$_Income;
}

/// @nodoc
abstract class _$TransferCopyWith<$Res> {
  factory _$TransferCopyWith(_Transfer value, $Res Function(_Transfer) then) =
      __$TransferCopyWithImpl<$Res>;
}

/// @nodoc
class __$TransferCopyWithImpl<$Res>
    extends _$TransactionFormTypeCopyWithImpl<$Res>
    implements _$TransferCopyWith<$Res> {
  __$TransferCopyWithImpl(_Transfer _value, $Res Function(_Transfer) _then)
      : super(_value, (v) => _then(v as _Transfer));

  @override
  _Transfer get _value => super._value as _Transfer;
}

/// @nodoc

class _$_Transfer implements _Transfer {
  const _$_Transfer();

  @override
  String toString() {
    return 'TransactionFormType.transfer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Transfer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() expense,
    required TResult Function() income,
    required TResult Function() transfer,
  }) {
    return transfer();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? transfer,
  }) {
    return transfer?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expense,
    TResult Function()? income,
    TResult Function()? transfer,
    required TResult orElse(),
  }) {
    if (transfer != null) {
      return transfer();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_Expense value) expense,
    required TResult Function(_Income value) income,
    required TResult Function(_Transfer value) transfer,
  }) {
    return transfer(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_Transfer value)? transfer,
  }) {
    return transfer?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Expense value)? expense,
    TResult Function(_Income value)? income,
    TResult Function(_Transfer value)? transfer,
    required TResult orElse(),
  }) {
    if (transfer != null) {
      return transfer(this);
    }
    return orElse();
  }
}

abstract class _Transfer implements TransactionFormType {
  const factory _Transfer() = _$_Transfer;
}
