// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransactionExceptionTearOff {
  const _$TransactionExceptionTearOff();

  _ServerError serverError() {
    return const _ServerError();
  }

  _NotEnoughBalance notEnoughBalance({required double availbleBalance}) {
    return _NotEnoughBalance(
      availbleBalance: availbleBalance,
    );
  }
}

/// @nodoc
const $TransactionException = _$TransactionExceptionTearOff();

/// @nodoc
mixin _$TransactionException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function(double availbleBalance) notEnoughBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function(double availbleBalance)? notEnoughBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function(double availbleBalance)? notEnoughBalance,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotEnoughBalance value) notEnoughBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotEnoughBalance value)? notEnoughBalance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotEnoughBalance value)? notEnoughBalance,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionExceptionCopyWith<$Res> {
  factory $TransactionExceptionCopyWith(TransactionException value,
          $Res Function(TransactionException) then) =
      _$TransactionExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionExceptionCopyWithImpl<$Res>
    implements $TransactionExceptionCopyWith<$Res> {
  _$TransactionExceptionCopyWithImpl(this._value, this._then);

  final TransactionException _value;
  // ignore: unused_field
  final $Res Function(TransactionException) _then;
}

/// @nodoc
abstract class _$ServerErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    extends _$TransactionExceptionCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError _value, $Res Function(_ServerError) _then)
      : super(_value, (v) => _then(v as _ServerError));

  @override
  _ServerError get _value => super._value as _ServerError;
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError();

  @override
  String toString() {
    return 'TransactionException.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function(double availbleBalance) notEnoughBalance,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function(double availbleBalance)? notEnoughBalance,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function(double availbleBalance)? notEnoughBalance,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotEnoughBalance value) notEnoughBalance,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotEnoughBalance value)? notEnoughBalance,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotEnoughBalance value)? notEnoughBalance,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements TransactionException {
  const factory _ServerError() = _$_ServerError;
}

/// @nodoc
abstract class _$NotEnoughBalanceCopyWith<$Res> {
  factory _$NotEnoughBalanceCopyWith(
          _NotEnoughBalance value, $Res Function(_NotEnoughBalance) then) =
      __$NotEnoughBalanceCopyWithImpl<$Res>;
  $Res call({double availbleBalance});
}

/// @nodoc
class __$NotEnoughBalanceCopyWithImpl<$Res>
    extends _$TransactionExceptionCopyWithImpl<$Res>
    implements _$NotEnoughBalanceCopyWith<$Res> {
  __$NotEnoughBalanceCopyWithImpl(
      _NotEnoughBalance _value, $Res Function(_NotEnoughBalance) _then)
      : super(_value, (v) => _then(v as _NotEnoughBalance));

  @override
  _NotEnoughBalance get _value => super._value as _NotEnoughBalance;

  @override
  $Res call({
    Object? availbleBalance = freezed,
  }) {
    return _then(_NotEnoughBalance(
      availbleBalance: availbleBalance == freezed
          ? _value.availbleBalance
          : availbleBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_NotEnoughBalance implements _NotEnoughBalance {
  const _$_NotEnoughBalance({required this.availbleBalance});

  @override
  final double availbleBalance;

  @override
  String toString() {
    return 'TransactionException.notEnoughBalance(availbleBalance: $availbleBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotEnoughBalance &&
            const DeepCollectionEquality()
                .equals(other.availbleBalance, availbleBalance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(availbleBalance));

  @JsonKey(ignore: true)
  @override
  _$NotEnoughBalanceCopyWith<_NotEnoughBalance> get copyWith =>
      __$NotEnoughBalanceCopyWithImpl<_NotEnoughBalance>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function(double availbleBalance) notEnoughBalance,
  }) {
    return notEnoughBalance(availbleBalance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function(double availbleBalance)? notEnoughBalance,
  }) {
    return notEnoughBalance?.call(availbleBalance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function(double availbleBalance)? notEnoughBalance,
    required TResult orElse(),
  }) {
    if (notEnoughBalance != null) {
      return notEnoughBalance(availbleBalance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotEnoughBalance value) notEnoughBalance,
  }) {
    return notEnoughBalance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotEnoughBalance value)? notEnoughBalance,
  }) {
    return notEnoughBalance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotEnoughBalance value)? notEnoughBalance,
    required TResult orElse(),
  }) {
    if (notEnoughBalance != null) {
      return notEnoughBalance(this);
    }
    return orElse();
  }
}

abstract class _NotEnoughBalance implements TransactionException {
  const factory _NotEnoughBalance({required double availbleBalance}) =
      _$_NotEnoughBalance;

  double get availbleBalance;
  @JsonKey(ignore: true)
  _$NotEnoughBalanceCopyWith<_NotEnoughBalance> get copyWith =>
      throw _privateConstructorUsedError;
}
