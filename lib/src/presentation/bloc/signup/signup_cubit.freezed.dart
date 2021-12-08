// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignupStateTearOff {
  const _$SignupStateTearOff();

  _SignupState call(
      {required EmailInput emailInput,
      required PasswordInput passwordInput,
      required ConfirmPasswordInput confirmPasswordInput,
      required UsernameInput usernameInput,
      required SubmissionState<AuthError> submissionState}) {
    return _SignupState(
      emailInput: emailInput,
      passwordInput: passwordInput,
      confirmPasswordInput: confirmPasswordInput,
      usernameInput: usernameInput,
      submissionState: submissionState,
    );
  }
}

/// @nodoc
const $SignupState = _$SignupStateTearOff();

/// @nodoc
mixin _$SignupState {
  EmailInput get emailInput => throw _privateConstructorUsedError;
  PasswordInput get passwordInput => throw _privateConstructorUsedError;
  ConfirmPasswordInput get confirmPasswordInput =>
      throw _privateConstructorUsedError;
  UsernameInput get usernameInput => throw _privateConstructorUsedError;
  SubmissionState<AuthError> get submissionState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupStateCopyWith<SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res>;
  $Res call(
      {EmailInput emailInput,
      PasswordInput passwordInput,
      ConfirmPasswordInput confirmPasswordInput,
      UsernameInput usernameInput,
      SubmissionState<AuthError> submissionState});

  $SubmissionStateCopyWith<AuthError, $Res> get submissionState;
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res> implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  final SignupState _value;
  // ignore: unused_field
  final $Res Function(SignupState) _then;

  @override
  $Res call({
    Object? emailInput = freezed,
    Object? passwordInput = freezed,
    Object? confirmPasswordInput = freezed,
    Object? usernameInput = freezed,
    Object? submissionState = freezed,
  }) {
    return _then(_value.copyWith(
      emailInput: emailInput == freezed
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      passwordInput: passwordInput == freezed
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      confirmPasswordInput: confirmPasswordInput == freezed
          ? _value.confirmPasswordInput
          : confirmPasswordInput // ignore: cast_nullable_to_non_nullable
              as ConfirmPasswordInput,
      usernameInput: usernameInput == freezed
          ? _value.usernameInput
          : usernameInput // ignore: cast_nullable_to_non_nullable
              as UsernameInput,
      submissionState: submissionState == freezed
          ? _value.submissionState
          : submissionState // ignore: cast_nullable_to_non_nullable
              as SubmissionState<AuthError>,
    ));
  }

  @override
  $SubmissionStateCopyWith<AuthError, $Res> get submissionState {
    return $SubmissionStateCopyWith<AuthError, $Res>(_value.submissionState,
        (value) {
      return _then(_value.copyWith(submissionState: value));
    });
  }
}

/// @nodoc
abstract class _$SignupStateCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(
          _SignupState value, $Res Function(_SignupState) then) =
      __$SignupStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailInput emailInput,
      PasswordInput passwordInput,
      ConfirmPasswordInput confirmPasswordInput,
      UsernameInput usernameInput,
      SubmissionState<AuthError> submissionState});

  @override
  $SubmissionStateCopyWith<AuthError, $Res> get submissionState;
}

/// @nodoc
class __$SignupStateCopyWithImpl<$Res> extends _$SignupStateCopyWithImpl<$Res>
    implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(
      _SignupState _value, $Res Function(_SignupState) _then)
      : super(_value, (v) => _then(v as _SignupState));

  @override
  _SignupState get _value => super._value as _SignupState;

  @override
  $Res call({
    Object? emailInput = freezed,
    Object? passwordInput = freezed,
    Object? confirmPasswordInput = freezed,
    Object? usernameInput = freezed,
    Object? submissionState = freezed,
  }) {
    return _then(_SignupState(
      emailInput: emailInput == freezed
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      passwordInput: passwordInput == freezed
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      confirmPasswordInput: confirmPasswordInput == freezed
          ? _value.confirmPasswordInput
          : confirmPasswordInput // ignore: cast_nullable_to_non_nullable
              as ConfirmPasswordInput,
      usernameInput: usernameInput == freezed
          ? _value.usernameInput
          : usernameInput // ignore: cast_nullable_to_non_nullable
              as UsernameInput,
      submissionState: submissionState == freezed
          ? _value.submissionState
          : submissionState // ignore: cast_nullable_to_non_nullable
              as SubmissionState<AuthError>,
    ));
  }
}

/// @nodoc

class _$_SignupState implements _SignupState {
  const _$_SignupState(
      {required this.emailInput,
      required this.passwordInput,
      required this.confirmPasswordInput,
      required this.usernameInput,
      required this.submissionState});

  @override
  final EmailInput emailInput;
  @override
  final PasswordInput passwordInput;
  @override
  final ConfirmPasswordInput confirmPasswordInput;
  @override
  final UsernameInput usernameInput;
  @override
  final SubmissionState<AuthError> submissionState;

  @override
  String toString() {
    return 'SignupState(emailInput: $emailInput, passwordInput: $passwordInput, confirmPasswordInput: $confirmPasswordInput, usernameInput: $usernameInput, submissionState: $submissionState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignupState &&
            const DeepCollectionEquality()
                .equals(other.emailInput, emailInput) &&
            const DeepCollectionEquality()
                .equals(other.passwordInput, passwordInput) &&
            const DeepCollectionEquality()
                .equals(other.confirmPasswordInput, confirmPasswordInput) &&
            const DeepCollectionEquality()
                .equals(other.usernameInput, usernameInput) &&
            const DeepCollectionEquality()
                .equals(other.submissionState, submissionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailInput),
      const DeepCollectionEquality().hash(passwordInput),
      const DeepCollectionEquality().hash(confirmPasswordInput),
      const DeepCollectionEquality().hash(usernameInput),
      const DeepCollectionEquality().hash(submissionState));

  @JsonKey(ignore: true)
  @override
  _$SignupStateCopyWith<_SignupState> get copyWith =>
      __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);
}

abstract class _SignupState implements SignupState {
  const factory _SignupState(
      {required EmailInput emailInput,
      required PasswordInput passwordInput,
      required ConfirmPasswordInput confirmPasswordInput,
      required UsernameInput usernameInput,
      required SubmissionState<AuthError> submissionState}) = _$_SignupState;

  @override
  EmailInput get emailInput;
  @override
  PasswordInput get passwordInput;
  @override
  ConfirmPasswordInput get confirmPasswordInput;
  @override
  UsernameInput get usernameInput;
  @override
  SubmissionState<AuthError> get submissionState;
  @override
  @JsonKey(ignore: true)
  _$SignupStateCopyWith<_SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}
