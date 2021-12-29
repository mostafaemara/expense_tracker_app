// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransactionInputTearOff {
  const _$TransactionInputTearOff();

  _ExpenseInput expense(
      {required TransactionInputData transactionInputData,
      required String category}) {
    return _ExpenseInput(
      transactionInputData: transactionInputData,
      category: category,
    );
  }

  _IncomeInput income(
      {required TransactionInputData transactionInputData,
      required String category}) {
    return _IncomeInput(
      transactionInputData: transactionInputData,
      category: category,
    );
  }

  _SentTransferInput sentTransfer(
      {required TransactionInputData transactionInputData,
      required String targetAccountId}) {
    return _SentTransferInput(
      transactionInputData: transactionInputData,
      targetAccountId: targetAccountId,
    );
  }

  _RecivedTransferInput recivedTransfer(
      {required TransactionInputData transactionInputData,
      required String targetAccountId}) {
    return _RecivedTransferInput(
      transactionInputData: transactionInputData,
      targetAccountId: targetAccountId,
    );
  }
}

/// @nodoc
const $TransactionInput = _$TransactionInputTearOff();

/// @nodoc
mixin _$TransactionInput {
  TransactionInputData get transactionInputData =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionInputData transactionInputData, String category)
        expense,
    required TResult Function(
            TransactionInputData transactionInputData, String category)
        income,
    required TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)
        sentTransfer,
    required TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)
        recivedTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        expense,
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        income,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        sentTransfer,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        recivedTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        expense,
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        income,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        sentTransfer,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        recivedTransfer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExpenseInput value) expense,
    required TResult Function(_IncomeInput value) income,
    required TResult Function(_SentTransferInput value) sentTransfer,
    required TResult Function(_RecivedTransferInput value) recivedTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ExpenseInput value)? expense,
    TResult Function(_IncomeInput value)? income,
    TResult Function(_SentTransferInput value)? sentTransfer,
    TResult Function(_RecivedTransferInput value)? recivedTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExpenseInput value)? expense,
    TResult Function(_IncomeInput value)? income,
    TResult Function(_SentTransferInput value)? sentTransfer,
    TResult Function(_RecivedTransferInput value)? recivedTransfer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionInputCopyWith<TransactionInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionInputCopyWith<$Res> {
  factory $TransactionInputCopyWith(
          TransactionInput value, $Res Function(TransactionInput) then) =
      _$TransactionInputCopyWithImpl<$Res>;
  $Res call({TransactionInputData transactionInputData});
}

/// @nodoc
class _$TransactionInputCopyWithImpl<$Res>
    implements $TransactionInputCopyWith<$Res> {
  _$TransactionInputCopyWithImpl(this._value, this._then);

  final TransactionInput _value;
  // ignore: unused_field
  final $Res Function(TransactionInput) _then;

  @override
  $Res call({
    Object? transactionInputData = freezed,
  }) {
    return _then(_value.copyWith(
      transactionInputData: transactionInputData == freezed
          ? _value.transactionInputData
          : transactionInputData // ignore: cast_nullable_to_non_nullable
              as TransactionInputData,
    ));
  }
}

/// @nodoc
abstract class _$ExpenseInputCopyWith<$Res>
    implements $TransactionInputCopyWith<$Res> {
  factory _$ExpenseInputCopyWith(
          _ExpenseInput value, $Res Function(_ExpenseInput) then) =
      __$ExpenseInputCopyWithImpl<$Res>;
  @override
  $Res call({TransactionInputData transactionInputData, String category});
}

/// @nodoc
class __$ExpenseInputCopyWithImpl<$Res>
    extends _$TransactionInputCopyWithImpl<$Res>
    implements _$ExpenseInputCopyWith<$Res> {
  __$ExpenseInputCopyWithImpl(
      _ExpenseInput _value, $Res Function(_ExpenseInput) _then)
      : super(_value, (v) => _then(v as _ExpenseInput));

  @override
  _ExpenseInput get _value => super._value as _ExpenseInput;

  @override
  $Res call({
    Object? transactionInputData = freezed,
    Object? category = freezed,
  }) {
    return _then(_ExpenseInput(
      transactionInputData: transactionInputData == freezed
          ? _value.transactionInputData
          : transactionInputData // ignore: cast_nullable_to_non_nullable
              as TransactionInputData,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ExpenseInput extends _ExpenseInput {
  const _$_ExpenseInput(
      {required this.transactionInputData, required this.category})
      : super._();

  @override
  final TransactionInputData transactionInputData;
  @override
  final String category;

  @override
  String toString() {
    return 'TransactionInput.expense(transactionInputData: $transactionInputData, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseInput &&
            const DeepCollectionEquality()
                .equals(other.transactionInputData, transactionInputData) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionInputData),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$ExpenseInputCopyWith<_ExpenseInput> get copyWith =>
      __$ExpenseInputCopyWithImpl<_ExpenseInput>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionInputData transactionInputData, String category)
        expense,
    required TResult Function(
            TransactionInputData transactionInputData, String category)
        income,
    required TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)
        sentTransfer,
    required TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)
        recivedTransfer,
  }) {
    return expense(transactionInputData, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        expense,
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        income,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        sentTransfer,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        recivedTransfer,
  }) {
    return expense?.call(transactionInputData, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        expense,
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        income,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        sentTransfer,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        recivedTransfer,
    required TResult orElse(),
  }) {
    if (expense != null) {
      return expense(transactionInputData, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExpenseInput value) expense,
    required TResult Function(_IncomeInput value) income,
    required TResult Function(_SentTransferInput value) sentTransfer,
    required TResult Function(_RecivedTransferInput value) recivedTransfer,
  }) {
    return expense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ExpenseInput value)? expense,
    TResult Function(_IncomeInput value)? income,
    TResult Function(_SentTransferInput value)? sentTransfer,
    TResult Function(_RecivedTransferInput value)? recivedTransfer,
  }) {
    return expense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExpenseInput value)? expense,
    TResult Function(_IncomeInput value)? income,
    TResult Function(_SentTransferInput value)? sentTransfer,
    TResult Function(_RecivedTransferInput value)? recivedTransfer,
    required TResult orElse(),
  }) {
    if (expense != null) {
      return expense(this);
    }
    return orElse();
  }
}

abstract class _ExpenseInput extends TransactionInput {
  const factory _ExpenseInput(
      {required TransactionInputData transactionInputData,
      required String category}) = _$_ExpenseInput;
  const _ExpenseInput._() : super._();

  @override
  TransactionInputData get transactionInputData;
  String get category;
  @override
  @JsonKey(ignore: true)
  _$ExpenseInputCopyWith<_ExpenseInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$IncomeInputCopyWith<$Res>
    implements $TransactionInputCopyWith<$Res> {
  factory _$IncomeInputCopyWith(
          _IncomeInput value, $Res Function(_IncomeInput) then) =
      __$IncomeInputCopyWithImpl<$Res>;
  @override
  $Res call({TransactionInputData transactionInputData, String category});
}

/// @nodoc
class __$IncomeInputCopyWithImpl<$Res>
    extends _$TransactionInputCopyWithImpl<$Res>
    implements _$IncomeInputCopyWith<$Res> {
  __$IncomeInputCopyWithImpl(
      _IncomeInput _value, $Res Function(_IncomeInput) _then)
      : super(_value, (v) => _then(v as _IncomeInput));

  @override
  _IncomeInput get _value => super._value as _IncomeInput;

  @override
  $Res call({
    Object? transactionInputData = freezed,
    Object? category = freezed,
  }) {
    return _then(_IncomeInput(
      transactionInputData: transactionInputData == freezed
          ? _value.transactionInputData
          : transactionInputData // ignore: cast_nullable_to_non_nullable
              as TransactionInputData,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_IncomeInput extends _IncomeInput {
  const _$_IncomeInput(
      {required this.transactionInputData, required this.category})
      : super._();

  @override
  final TransactionInputData transactionInputData;
  @override
  final String category;

  @override
  String toString() {
    return 'TransactionInput.income(transactionInputData: $transactionInputData, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncomeInput &&
            const DeepCollectionEquality()
                .equals(other.transactionInputData, transactionInputData) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionInputData),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$IncomeInputCopyWith<_IncomeInput> get copyWith =>
      __$IncomeInputCopyWithImpl<_IncomeInput>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionInputData transactionInputData, String category)
        expense,
    required TResult Function(
            TransactionInputData transactionInputData, String category)
        income,
    required TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)
        sentTransfer,
    required TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)
        recivedTransfer,
  }) {
    return income(transactionInputData, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        expense,
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        income,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        sentTransfer,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        recivedTransfer,
  }) {
    return income?.call(transactionInputData, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        expense,
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        income,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        sentTransfer,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        recivedTransfer,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income(transactionInputData, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExpenseInput value) expense,
    required TResult Function(_IncomeInput value) income,
    required TResult Function(_SentTransferInput value) sentTransfer,
    required TResult Function(_RecivedTransferInput value) recivedTransfer,
  }) {
    return income(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ExpenseInput value)? expense,
    TResult Function(_IncomeInput value)? income,
    TResult Function(_SentTransferInput value)? sentTransfer,
    TResult Function(_RecivedTransferInput value)? recivedTransfer,
  }) {
    return income?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExpenseInput value)? expense,
    TResult Function(_IncomeInput value)? income,
    TResult Function(_SentTransferInput value)? sentTransfer,
    TResult Function(_RecivedTransferInput value)? recivedTransfer,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income(this);
    }
    return orElse();
  }
}

abstract class _IncomeInput extends TransactionInput {
  const factory _IncomeInput(
      {required TransactionInputData transactionInputData,
      required String category}) = _$_IncomeInput;
  const _IncomeInput._() : super._();

  @override
  TransactionInputData get transactionInputData;
  String get category;
  @override
  @JsonKey(ignore: true)
  _$IncomeInputCopyWith<_IncomeInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SentTransferInputCopyWith<$Res>
    implements $TransactionInputCopyWith<$Res> {
  factory _$SentTransferInputCopyWith(
          _SentTransferInput value, $Res Function(_SentTransferInput) then) =
      __$SentTransferInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {TransactionInputData transactionInputData, String targetAccountId});
}

/// @nodoc
class __$SentTransferInputCopyWithImpl<$Res>
    extends _$TransactionInputCopyWithImpl<$Res>
    implements _$SentTransferInputCopyWith<$Res> {
  __$SentTransferInputCopyWithImpl(
      _SentTransferInput _value, $Res Function(_SentTransferInput) _then)
      : super(_value, (v) => _then(v as _SentTransferInput));

  @override
  _SentTransferInput get _value => super._value as _SentTransferInput;

  @override
  $Res call({
    Object? transactionInputData = freezed,
    Object? targetAccountId = freezed,
  }) {
    return _then(_SentTransferInput(
      transactionInputData: transactionInputData == freezed
          ? _value.transactionInputData
          : transactionInputData // ignore: cast_nullable_to_non_nullable
              as TransactionInputData,
      targetAccountId: targetAccountId == freezed
          ? _value.targetAccountId
          : targetAccountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SentTransferInput extends _SentTransferInput {
  const _$_SentTransferInput(
      {required this.transactionInputData, required this.targetAccountId})
      : super._();

  @override
  final TransactionInputData transactionInputData;
  @override
  final String targetAccountId;

  @override
  String toString() {
    return 'TransactionInput.sentTransfer(transactionInputData: $transactionInputData, targetAccountId: $targetAccountId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SentTransferInput &&
            const DeepCollectionEquality()
                .equals(other.transactionInputData, transactionInputData) &&
            const DeepCollectionEquality()
                .equals(other.targetAccountId, targetAccountId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionInputData),
      const DeepCollectionEquality().hash(targetAccountId));

  @JsonKey(ignore: true)
  @override
  _$SentTransferInputCopyWith<_SentTransferInput> get copyWith =>
      __$SentTransferInputCopyWithImpl<_SentTransferInput>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionInputData transactionInputData, String category)
        expense,
    required TResult Function(
            TransactionInputData transactionInputData, String category)
        income,
    required TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)
        sentTransfer,
    required TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)
        recivedTransfer,
  }) {
    return sentTransfer(transactionInputData, targetAccountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        expense,
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        income,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        sentTransfer,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        recivedTransfer,
  }) {
    return sentTransfer?.call(transactionInputData, targetAccountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        expense,
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        income,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        sentTransfer,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        recivedTransfer,
    required TResult orElse(),
  }) {
    if (sentTransfer != null) {
      return sentTransfer(transactionInputData, targetAccountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExpenseInput value) expense,
    required TResult Function(_IncomeInput value) income,
    required TResult Function(_SentTransferInput value) sentTransfer,
    required TResult Function(_RecivedTransferInput value) recivedTransfer,
  }) {
    return sentTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ExpenseInput value)? expense,
    TResult Function(_IncomeInput value)? income,
    TResult Function(_SentTransferInput value)? sentTransfer,
    TResult Function(_RecivedTransferInput value)? recivedTransfer,
  }) {
    return sentTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExpenseInput value)? expense,
    TResult Function(_IncomeInput value)? income,
    TResult Function(_SentTransferInput value)? sentTransfer,
    TResult Function(_RecivedTransferInput value)? recivedTransfer,
    required TResult orElse(),
  }) {
    if (sentTransfer != null) {
      return sentTransfer(this);
    }
    return orElse();
  }
}

abstract class _SentTransferInput extends TransactionInput {
  const factory _SentTransferInput(
      {required TransactionInputData transactionInputData,
      required String targetAccountId}) = _$_SentTransferInput;
  const _SentTransferInput._() : super._();

  @override
  TransactionInputData get transactionInputData;
  String get targetAccountId;
  @override
  @JsonKey(ignore: true)
  _$SentTransferInputCopyWith<_SentTransferInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RecivedTransferInputCopyWith<$Res>
    implements $TransactionInputCopyWith<$Res> {
  factory _$RecivedTransferInputCopyWith(_RecivedTransferInput value,
          $Res Function(_RecivedTransferInput) then) =
      __$RecivedTransferInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {TransactionInputData transactionInputData, String targetAccountId});
}

/// @nodoc
class __$RecivedTransferInputCopyWithImpl<$Res>
    extends _$TransactionInputCopyWithImpl<$Res>
    implements _$RecivedTransferInputCopyWith<$Res> {
  __$RecivedTransferInputCopyWithImpl(
      _RecivedTransferInput _value, $Res Function(_RecivedTransferInput) _then)
      : super(_value, (v) => _then(v as _RecivedTransferInput));

  @override
  _RecivedTransferInput get _value => super._value as _RecivedTransferInput;

  @override
  $Res call({
    Object? transactionInputData = freezed,
    Object? targetAccountId = freezed,
  }) {
    return _then(_RecivedTransferInput(
      transactionInputData: transactionInputData == freezed
          ? _value.transactionInputData
          : transactionInputData // ignore: cast_nullable_to_non_nullable
              as TransactionInputData,
      targetAccountId: targetAccountId == freezed
          ? _value.targetAccountId
          : targetAccountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RecivedTransferInput extends _RecivedTransferInput {
  const _$_RecivedTransferInput(
      {required this.transactionInputData, required this.targetAccountId})
      : super._();

  @override
  final TransactionInputData transactionInputData;
  @override
  final String targetAccountId;

  @override
  String toString() {
    return 'TransactionInput.recivedTransfer(transactionInputData: $transactionInputData, targetAccountId: $targetAccountId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecivedTransferInput &&
            const DeepCollectionEquality()
                .equals(other.transactionInputData, transactionInputData) &&
            const DeepCollectionEquality()
                .equals(other.targetAccountId, targetAccountId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionInputData),
      const DeepCollectionEquality().hash(targetAccountId));

  @JsonKey(ignore: true)
  @override
  _$RecivedTransferInputCopyWith<_RecivedTransferInput> get copyWith =>
      __$RecivedTransferInputCopyWithImpl<_RecivedTransferInput>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionInputData transactionInputData, String category)
        expense,
    required TResult Function(
            TransactionInputData transactionInputData, String category)
        income,
    required TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)
        sentTransfer,
    required TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)
        recivedTransfer,
  }) {
    return recivedTransfer(transactionInputData, targetAccountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        expense,
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        income,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        sentTransfer,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        recivedTransfer,
  }) {
    return recivedTransfer?.call(transactionInputData, targetAccountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        expense,
    TResult Function(
            TransactionInputData transactionInputData, String category)?
        income,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        sentTransfer,
    TResult Function(
            TransactionInputData transactionInputData, String targetAccountId)?
        recivedTransfer,
    required TResult orElse(),
  }) {
    if (recivedTransfer != null) {
      return recivedTransfer(transactionInputData, targetAccountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExpenseInput value) expense,
    required TResult Function(_IncomeInput value) income,
    required TResult Function(_SentTransferInput value) sentTransfer,
    required TResult Function(_RecivedTransferInput value) recivedTransfer,
  }) {
    return recivedTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ExpenseInput value)? expense,
    TResult Function(_IncomeInput value)? income,
    TResult Function(_SentTransferInput value)? sentTransfer,
    TResult Function(_RecivedTransferInput value)? recivedTransfer,
  }) {
    return recivedTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExpenseInput value)? expense,
    TResult Function(_IncomeInput value)? income,
    TResult Function(_SentTransferInput value)? sentTransfer,
    TResult Function(_RecivedTransferInput value)? recivedTransfer,
    required TResult orElse(),
  }) {
    if (recivedTransfer != null) {
      return recivedTransfer(this);
    }
    return orElse();
  }
}

abstract class _RecivedTransferInput extends TransactionInput {
  const factory _RecivedTransferInput(
      {required TransactionInputData transactionInputData,
      required String targetAccountId}) = _$_RecivedTransferInput;
  const _RecivedTransferInput._() : super._();

  @override
  TransactionInputData get transactionInputData;
  String get targetAccountId;
  @override
  @JsonKey(ignore: true)
  _$RecivedTransferInputCopyWith<_RecivedTransferInput> get copyWith =>
      throw _privateConstructorUsedError;
}
