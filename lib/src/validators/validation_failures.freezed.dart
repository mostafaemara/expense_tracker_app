// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'validation_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UsernameValidationFailureTearOff {
  const _$UsernameValidationFailureTearOff();

  _InvalidUserName invalid() {
    return const _InvalidUserName();
  }

  _Empty empty() {
    return const _Empty();
  }

  _TooShortUserName tooShort() {
    return const _TooShortUserName();
  }
}

/// @nodoc
const $UsernameValidationFailure = _$UsernameValidationFailureTearOff();

/// @nodoc
mixin _$UsernameValidationFailure {
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
    required TResult Function() tooShort,
  }) =>
      throw _privateConstructorUsedError;
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidUserName value) invalid,
    required TResult Function(_Empty value) empty,
    required TResult Function(_TooShortUserName value) tooShort,
  }) =>
      throw _privateConstructorUsedError;

  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidUserName value)? invalid,
    TResult Function(_Empty value)? empty,
    TResult Function(_TooShortUserName value)? tooShort,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidUserName value)? invalid,
    TResult Function(_Empty value)? empty,
    TResult Function(_TooShortUserName value)? tooShort,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsernameValidationFailureCopyWith<$Res> {
  factory $UsernameValidationFailureCopyWith(UsernameValidationFailure value,
          $Res Function(UsernameValidationFailure) then) =
      _$UsernameValidationFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$UsernameValidationFailureCopyWithImpl<$Res>
    implements $UsernameValidationFailureCopyWith<$Res> {
  _$UsernameValidationFailureCopyWithImpl(this._value, this._then);

  final UsernameValidationFailure _value;
  // ignore: unused_field
  final $Res Function(UsernameValidationFailure) _then;
}

/// @nodoc
abstract class _$InvalidUserNameCopyWith<$Res> {
  factory _$InvalidUserNameCopyWith(
          _InvalidUserName value, $Res Function(_InvalidUserName) then) =
      __$InvalidUserNameCopyWithImpl<$Res>;
}

/// @nodoc
class __$InvalidUserNameCopyWithImpl<$Res>
    extends _$UsernameValidationFailureCopyWithImpl<$Res>
    implements _$InvalidUserNameCopyWith<$Res> {
  __$InvalidUserNameCopyWithImpl(
      _InvalidUserName _value, $Res Function(_InvalidUserName) _then)
      : super(_value, (v) => _then(v as _InvalidUserName));

  @override
  _InvalidUserName get _value => super._value as _InvalidUserName;
}

/// @nodoc

class _$_InvalidUserName implements _InvalidUserName {
  const _$_InvalidUserName();

  @override
  String toString() {
    return 'UsernameValidationFailure.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InvalidUserName);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
    required TResult Function() tooShort,
  }) {
    return invalid();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
  }) {
    return invalid?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidUserName value) invalid,
    required TResult Function(_Empty value) empty,
    required TResult Function(_TooShortUserName value) tooShort,
  }) {
    return invalid(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidUserName value)? invalid,
    TResult Function(_Empty value)? empty,
    TResult Function(_TooShortUserName value)? tooShort,
  }) {
    return invalid?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidUserName value)? invalid,
    TResult Function(_Empty value)? empty,
    TResult Function(_TooShortUserName value)? tooShort,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class _InvalidUserName implements UsernameValidationFailure {
  const factory _InvalidUserName() = _$_InvalidUserName;
}

/// @nodoc
abstract class _$EmptyCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmptyCopyWithImpl<$Res>
    extends _$UsernameValidationFailureCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'UsernameValidationFailure.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
    required TResult Function() tooShort,
  }) {
    return empty();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
  }) {
    return empty?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidUserName value) invalid,
    required TResult Function(_Empty value) empty,
    required TResult Function(_TooShortUserName value) tooShort,
  }) {
    return empty(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidUserName value)? invalid,
    TResult Function(_Empty value)? empty,
    TResult Function(_TooShortUserName value)? tooShort,
  }) {
    return empty?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidUserName value)? invalid,
    TResult Function(_Empty value)? empty,
    TResult Function(_TooShortUserName value)? tooShort,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements UsernameValidationFailure {
  const factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$TooShortUserNameCopyWith<$Res> {
  factory _$TooShortUserNameCopyWith(
          _TooShortUserName value, $Res Function(_TooShortUserName) then) =
      __$TooShortUserNameCopyWithImpl<$Res>;
}

/// @nodoc
class __$TooShortUserNameCopyWithImpl<$Res>
    extends _$UsernameValidationFailureCopyWithImpl<$Res>
    implements _$TooShortUserNameCopyWith<$Res> {
  __$TooShortUserNameCopyWithImpl(
      _TooShortUserName _value, $Res Function(_TooShortUserName) _then)
      : super(_value, (v) => _then(v as _TooShortUserName));

  @override
  _TooShortUserName get _value => super._value as _TooShortUserName;
}

/// @nodoc

class _$_TooShortUserName implements _TooShortUserName {
  const _$_TooShortUserName();

  @override
  String toString() {
    return 'UsernameValidationFailure.tooShort()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TooShortUserName);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
    required TResult Function() tooShort,
  }) {
    return tooShort();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
  }) {
    return tooShort?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    TResult Function()? tooShort,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidUserName value) invalid,
    required TResult Function(_Empty value) empty,
    required TResult Function(_TooShortUserName value) tooShort,
  }) {
    return tooShort(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidUserName value)? invalid,
    TResult Function(_Empty value)? empty,
    TResult Function(_TooShortUserName value)? tooShort,
  }) {
    return tooShort?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidUserName value)? invalid,
    TResult Function(_Empty value)? empty,
    TResult Function(_TooShortUserName value)? tooShort,
    required TResult orElse(),
  }) {
    if (tooShort != null) {
      return tooShort(this);
    }
    return orElse();
  }
}

abstract class _TooShortUserName implements UsernameValidationFailure {
  const factory _TooShortUserName() = _$_TooShortUserName;
}

/// @nodoc
class _$EmailValidationFailureTearOff {
  const _$EmailValidationFailureTearOff();

  _InvalidEmail invalid() {
    return const _InvalidEmail();
  }

  _EmailEmpty empty() {
    return const _EmailEmpty();
  }
}

/// @nodoc
const $EmailValidationFailure = _$EmailValidationFailureTearOff();

/// @nodoc
mixin _$EmailValidationFailure {
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidEmail value) invalid,
    required TResult Function(_EmailEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidEmail value)? invalid,
    TResult Function(_EmailEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmail value)? invalid,
    TResult Function(_EmailEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailValidationFailureCopyWith<$Res> {
  factory $EmailValidationFailureCopyWith(EmailValidationFailure value,
          $Res Function(EmailValidationFailure) then) =
      _$EmailValidationFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailValidationFailureCopyWithImpl<$Res>
    implements $EmailValidationFailureCopyWith<$Res> {
  _$EmailValidationFailureCopyWithImpl(this._value, this._then);

  final EmailValidationFailure _value;
  // ignore: unused_field
  final $Res Function(EmailValidationFailure) _then;
}

/// @nodoc
abstract class _$InvalidEmailCopyWith<$Res> {
  factory _$InvalidEmailCopyWith(
          _InvalidEmail value, $Res Function(_InvalidEmail) then) =
      __$InvalidEmailCopyWithImpl<$Res>;
}

/// @nodoc
class __$InvalidEmailCopyWithImpl<$Res>
    extends _$EmailValidationFailureCopyWithImpl<$Res>
    implements _$InvalidEmailCopyWith<$Res> {
  __$InvalidEmailCopyWithImpl(
      _InvalidEmail _value, $Res Function(_InvalidEmail) _then)
      : super(_value, (v) => _then(v as _InvalidEmail));

  @override
  _InvalidEmail get _value => super._value as _InvalidEmail;
}

/// @nodoc

class _$_InvalidEmail implements _InvalidEmail {
  const _$_InvalidEmail();

  @override
  String toString() {
    return 'EmailValidationFailure.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InvalidEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
  }) {
    return invalid();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
  }) {
    return invalid?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidEmail value) invalid,
    required TResult Function(_EmailEmpty value) empty,
  }) {
    return invalid(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidEmail value)? invalid,
    TResult Function(_EmailEmpty value)? empty,
  }) {
    return invalid?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmail value)? invalid,
    TResult Function(_EmailEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class _InvalidEmail implements EmailValidationFailure {
  const factory _InvalidEmail() = _$_InvalidEmail;
}

/// @nodoc
abstract class _$EmailEmptyCopyWith<$Res> {
  factory _$EmailEmptyCopyWith(
          _EmailEmpty value, $Res Function(_EmailEmpty) then) =
      __$EmailEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmailEmptyCopyWithImpl<$Res>
    extends _$EmailValidationFailureCopyWithImpl<$Res>
    implements _$EmailEmptyCopyWith<$Res> {
  __$EmailEmptyCopyWithImpl(
      _EmailEmpty _value, $Res Function(_EmailEmpty) _then)
      : super(_value, (v) => _then(v as _EmailEmpty));

  @override
  _EmailEmpty get _value => super._value as _EmailEmpty;
}

/// @nodoc

class _$_EmailEmpty implements _EmailEmpty {
  const _$_EmailEmpty();

  @override
  String toString() {
    return 'EmailValidationFailure.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EmailEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidEmail value) invalid,
    required TResult Function(_EmailEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidEmail value)? invalid,
    TResult Function(_EmailEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmail value)? invalid,
    TResult Function(_EmailEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _EmailEmpty implements EmailValidationFailure {
  const factory _EmailEmpty() = _$_EmailEmpty;
}

/// @nodoc
class _$PasswordValidationFailureTearOff {
  const _$PasswordValidationFailureTearOff();

  _ShortPassword shortPassword() {
    return const _ShortPassword();
  }

  _PasswordEmpty empty() {
    return const _PasswordEmpty();
  }
}

/// @nodoc
const $PasswordValidationFailure = _$PasswordValidationFailureTearOff();

/// @nodoc
mixin _$PasswordValidationFailure {
  TResult when<TResult extends Object?>({
    required TResult Function() shortPassword,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? shortPassword,
    TResult Function()? empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? shortPassword,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  TResult map<TResult extends Object?>({
    required TResult Function(_ShortPassword value) shortPassword,
    required TResult Function(_PasswordEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ShortPassword value)? shortPassword,
    TResult Function(_PasswordEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShortPassword value)? shortPassword,
    TResult Function(_PasswordEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordValidationFailureCopyWith<$Res> {
  factory $PasswordValidationFailureCopyWith(PasswordValidationFailure value,
          $Res Function(PasswordValidationFailure) then) =
      _$PasswordValidationFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordValidationFailureCopyWithImpl<$Res>
    implements $PasswordValidationFailureCopyWith<$Res> {
  _$PasswordValidationFailureCopyWithImpl(this._value, this._then);

  final PasswordValidationFailure _value;
  // ignore: unused_field
  final $Res Function(PasswordValidationFailure) _then;
}

/// @nodoc
abstract class _$ShortPasswordCopyWith<$Res> {
  factory _$ShortPasswordCopyWith(
          _ShortPassword value, $Res Function(_ShortPassword) then) =
      __$ShortPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$ShortPasswordCopyWithImpl<$Res>
    extends _$PasswordValidationFailureCopyWithImpl<$Res>
    implements _$ShortPasswordCopyWith<$Res> {
  __$ShortPasswordCopyWithImpl(
      _ShortPassword _value, $Res Function(_ShortPassword) _then)
      : super(_value, (v) => _then(v as _ShortPassword));

  @override
  _ShortPassword get _value => super._value as _ShortPassword;
}

/// @nodoc

class _$_ShortPassword implements _ShortPassword {
  const _$_ShortPassword();

  @override
  String toString() {
    return 'PasswordValidationFailure.shortPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ShortPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() shortPassword,
    required TResult Function() empty,
  }) {
    return shortPassword();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? shortPassword,
    TResult Function()? empty,
  }) {
    return shortPassword?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? shortPassword,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_ShortPassword value) shortPassword,
    required TResult Function(_PasswordEmpty value) empty,
  }) {
    return shortPassword(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ShortPassword value)? shortPassword,
    TResult Function(_PasswordEmpty value)? empty,
  }) {
    return shortPassword?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShortPassword value)? shortPassword,
    TResult Function(_PasswordEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class _ShortPassword implements PasswordValidationFailure {
  const factory _ShortPassword() = _$_ShortPassword;
}

/// @nodoc
abstract class _$PasswordEmptyCopyWith<$Res> {
  factory _$PasswordEmptyCopyWith(
          _PasswordEmpty value, $Res Function(_PasswordEmpty) then) =
      __$PasswordEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$PasswordEmptyCopyWithImpl<$Res>
    extends _$PasswordValidationFailureCopyWithImpl<$Res>
    implements _$PasswordEmptyCopyWith<$Res> {
  __$PasswordEmptyCopyWithImpl(
      _PasswordEmpty _value, $Res Function(_PasswordEmpty) _then)
      : super(_value, (v) => _then(v as _PasswordEmpty));

  @override
  _PasswordEmpty get _value => super._value as _PasswordEmpty;
}

/// @nodoc

class _$_PasswordEmpty implements _PasswordEmpty {
  const _$_PasswordEmpty();

  @override
  String toString() {
    return 'PasswordValidationFailure.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PasswordEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() shortPassword,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? shortPassword,
    TResult Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? shortPassword,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_ShortPassword value) shortPassword,
    required TResult Function(_PasswordEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ShortPassword value)? shortPassword,
    TResult Function(_PasswordEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShortPassword value)? shortPassword,
    TResult Function(_PasswordEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _PasswordEmpty implements PasswordValidationFailure {
  const factory _PasswordEmpty() = _$_PasswordEmpty;
}

/// @nodoc
class _$ConfirmPasswordValidationFailureTearOff {
  const _$ConfirmPasswordValidationFailureTearOff();

  _PasswordNotMatch passwordNotMatch() {
    return const _PasswordNotMatch();
  }

  _ConfirmPasswordEmpty empty() {
    return const _ConfirmPasswordEmpty();
  }
}

/// @nodoc
const $ConfirmPasswordValidationFailure =
    _$ConfirmPasswordValidationFailureTearOff();

/// @nodoc
mixin _$ConfirmPasswordValidationFailure {
  TResult when<TResult extends Object?>({
    required TResult Function() passwordNotMatch,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? passwordNotMatch,
    TResult Function()? empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? passwordNotMatch,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordNotMatch value) passwordNotMatch,
    required TResult Function(_ConfirmPasswordEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PasswordNotMatch value)? passwordNotMatch,
    TResult Function(_ConfirmPasswordEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordNotMatch value)? passwordNotMatch,
    TResult Function(_ConfirmPasswordEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmPasswordValidationFailureCopyWith<$Res> {
  factory $ConfirmPasswordValidationFailureCopyWith(
          ConfirmPasswordValidationFailure value,
          $Res Function(ConfirmPasswordValidationFailure) then) =
      _$ConfirmPasswordValidationFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConfirmPasswordValidationFailureCopyWithImpl<$Res>
    implements $ConfirmPasswordValidationFailureCopyWith<$Res> {
  _$ConfirmPasswordValidationFailureCopyWithImpl(this._value, this._then);

  final ConfirmPasswordValidationFailure _value;
  // ignore: unused_field
  final $Res Function(ConfirmPasswordValidationFailure) _then;
}

/// @nodoc
abstract class _$PasswordNotMatchCopyWith<$Res> {
  factory _$PasswordNotMatchCopyWith(
          _PasswordNotMatch value, $Res Function(_PasswordNotMatch) then) =
      __$PasswordNotMatchCopyWithImpl<$Res>;
}

/// @nodoc
class __$PasswordNotMatchCopyWithImpl<$Res>
    extends _$ConfirmPasswordValidationFailureCopyWithImpl<$Res>
    implements _$PasswordNotMatchCopyWith<$Res> {
  __$PasswordNotMatchCopyWithImpl(
      _PasswordNotMatch _value, $Res Function(_PasswordNotMatch) _then)
      : super(_value, (v) => _then(v as _PasswordNotMatch));

  @override
  _PasswordNotMatch get _value => super._value as _PasswordNotMatch;
}

/// @nodoc

class _$_PasswordNotMatch implements _PasswordNotMatch {
  const _$_PasswordNotMatch();

  @override
  String toString() {
    return 'ConfirmPasswordValidationFailure.passwordNotMatch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PasswordNotMatch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() passwordNotMatch,
    required TResult Function() empty,
  }) {
    return passwordNotMatch();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? passwordNotMatch,
    TResult Function()? empty,
  }) {
    return passwordNotMatch?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? passwordNotMatch,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (passwordNotMatch != null) {
      return passwordNotMatch();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordNotMatch value) passwordNotMatch,
    required TResult Function(_ConfirmPasswordEmpty value) empty,
  }) {
    return passwordNotMatch(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PasswordNotMatch value)? passwordNotMatch,
    TResult Function(_ConfirmPasswordEmpty value)? empty,
  }) {
    return passwordNotMatch?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordNotMatch value)? passwordNotMatch,
    TResult Function(_ConfirmPasswordEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (passwordNotMatch != null) {
      return passwordNotMatch(this);
    }
    return orElse();
  }
}

abstract class _PasswordNotMatch implements ConfirmPasswordValidationFailure {
  const factory _PasswordNotMatch() = _$_PasswordNotMatch;
}

/// @nodoc
abstract class _$ConfirmPasswordEmptyCopyWith<$Res> {
  factory _$ConfirmPasswordEmptyCopyWith(_ConfirmPasswordEmpty value,
          $Res Function(_ConfirmPasswordEmpty) then) =
      __$ConfirmPasswordEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$ConfirmPasswordEmptyCopyWithImpl<$Res>
    extends _$ConfirmPasswordValidationFailureCopyWithImpl<$Res>
    implements _$ConfirmPasswordEmptyCopyWith<$Res> {
  __$ConfirmPasswordEmptyCopyWithImpl(
      _ConfirmPasswordEmpty _value, $Res Function(_ConfirmPasswordEmpty) _then)
      : super(_value, (v) => _then(v as _ConfirmPasswordEmpty));

  @override
  _ConfirmPasswordEmpty get _value => super._value as _ConfirmPasswordEmpty;
}

/// @nodoc

class _$_ConfirmPasswordEmpty implements _ConfirmPasswordEmpty {
  const _$_ConfirmPasswordEmpty();

  @override
  String toString() {
    return 'ConfirmPasswordValidationFailure.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ConfirmPasswordEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  TResult when<TResult extends Object?>({
    required TResult Function() passwordNotMatch,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? passwordNotMatch,
    TResult Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? passwordNotMatch,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordNotMatch value) passwordNotMatch,
    required TResult Function(_ConfirmPasswordEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PasswordNotMatch value)? passwordNotMatch,
    TResult Function(_ConfirmPasswordEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordNotMatch value)? passwordNotMatch,
    TResult Function(_ConfirmPasswordEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _ConfirmPasswordEmpty
    implements ConfirmPasswordValidationFailure {
  const factory _ConfirmPasswordEmpty() = _$_ConfirmPasswordEmpty;
}
