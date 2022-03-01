// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AccountTypeTearOff {
  const _$AccountTypeTearOff();

  _Wallet wallet() {
    return const _Wallet();
  }

  _BanckAccount bankAccount() {
    return const _BanckAccount();
  }
}

/// @nodoc
const $AccountType = _$AccountTypeTearOff();

/// @nodoc
mixin _$AccountType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wallet,
    required TResult Function() bankAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? bankAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? bankAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Wallet value) wallet,
    required TResult Function(_BanckAccount value) bankAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Wallet value)? wallet,
    TResult Function(_BanckAccount value)? bankAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Wallet value)? wallet,
    TResult Function(_BanckAccount value)? bankAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountTypeCopyWith<$Res> {
  factory $AccountTypeCopyWith(
          AccountType value, $Res Function(AccountType) then) =
      _$AccountTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountTypeCopyWithImpl<$Res> implements $AccountTypeCopyWith<$Res> {
  _$AccountTypeCopyWithImpl(this._value, this._then);

  final AccountType _value;
  // ignore: unused_field
  final $Res Function(AccountType) _then;
}

/// @nodoc
abstract class _$WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) then) =
      __$WalletCopyWithImpl<$Res>;
}

/// @nodoc
class __$WalletCopyWithImpl<$Res> extends _$AccountTypeCopyWithImpl<$Res>
    implements _$WalletCopyWith<$Res> {
  __$WalletCopyWithImpl(_Wallet _value, $Res Function(_Wallet) _then)
      : super(_value, (v) => _then(v as _Wallet));

  @override
  _Wallet get _value => super._value as _Wallet;
}

/// @nodoc

class _$_Wallet extends _Wallet {
  const _$_Wallet() : super._();

  @override
  String toString() {
    return 'AccountType.wallet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Wallet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wallet,
    required TResult Function() bankAccount,
  }) {
    return wallet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? bankAccount,
  }) {
    return wallet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? bankAccount,
    required TResult orElse(),
  }) {
    if (wallet != null) {
      return wallet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Wallet value) wallet,
    required TResult Function(_BanckAccount value) bankAccount,
  }) {
    return wallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Wallet value)? wallet,
    TResult Function(_BanckAccount value)? bankAccount,
  }) {
    return wallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Wallet value)? wallet,
    TResult Function(_BanckAccount value)? bankAccount,
    required TResult orElse(),
  }) {
    if (wallet != null) {
      return wallet(this);
    }
    return orElse();
  }
}

abstract class _Wallet extends AccountType {
  const factory _Wallet() = _$_Wallet;
  const _Wallet._() : super._();
}

/// @nodoc
abstract class _$BanckAccountCopyWith<$Res> {
  factory _$BanckAccountCopyWith(
          _BanckAccount value, $Res Function(_BanckAccount) then) =
      __$BanckAccountCopyWithImpl<$Res>;
}

/// @nodoc
class __$BanckAccountCopyWithImpl<$Res> extends _$AccountTypeCopyWithImpl<$Res>
    implements _$BanckAccountCopyWith<$Res> {
  __$BanckAccountCopyWithImpl(
      _BanckAccount _value, $Res Function(_BanckAccount) _then)
      : super(_value, (v) => _then(v as _BanckAccount));

  @override
  _BanckAccount get _value => super._value as _BanckAccount;
}

/// @nodoc

class _$_BanckAccount extends _BanckAccount {
  const _$_BanckAccount() : super._();

  @override
  String toString() {
    return 'AccountType.bankAccount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BanckAccount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wallet,
    required TResult Function() bankAccount,
  }) {
    return bankAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? bankAccount,
  }) {
    return bankAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? bankAccount,
    required TResult orElse(),
  }) {
    if (bankAccount != null) {
      return bankAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Wallet value) wallet,
    required TResult Function(_BanckAccount value) bankAccount,
  }) {
    return bankAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Wallet value)? wallet,
    TResult Function(_BanckAccount value)? bankAccount,
  }) {
    return bankAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Wallet value)? wallet,
    TResult Function(_BanckAccount value)? bankAccount,
    required TResult orElse(),
  }) {
    if (bankAccount != null) {
      return bankAccount(this);
    }
    return orElse();
  }
}

abstract class _BanckAccount extends AccountType {
  const factory _BanckAccount() = _$_BanckAccount;
  const _BanckAccount._() : super._();
}
