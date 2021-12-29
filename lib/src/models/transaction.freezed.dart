// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransactionTearOff {
  const _$TransactionTearOff();

  _Expense expense(
      {required TransactionData transactionData, required Category category}) {
    return _Expense(
      transactionData: transactionData,
      category: category,
    );
  }

  _Income income(
      {required TransactionData transactionData, required Category category}) {
    return _Income(
      transactionData: transactionData,
      category: category,
    );
  }

  _SentTransfer sentTransfer(
      {required TransactionData transactionData,
      required Category category,
      required String targetAccountId}) {
    return _SentTransfer(
      transactionData: transactionData,
      category: category,
      targetAccountId: targetAccountId,
    );
  }

  _RecivedTransfer recivedTransfer(
      {required TransactionData transactionData,
      required Category category,
      required String targetAccountId}) {
    return _RecivedTransfer(
      transactionData: transactionData,
      category: category,
      targetAccountId: targetAccountId,
    );
  }
}

/// @nodoc
const $Transaction = _$TransactionTearOff();

/// @nodoc
mixin _$Transaction {
  TransactionData get transactionData => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionData transactionData, Category category)
        expense,
    required TResult Function(
            TransactionData transactionData, Category category)
        income,
    required TResult Function(TransactionData transactionData,
            Category category, String targetAccountId)
        sentTransfer,
    required TResult Function(TransactionData transactionData,
            Category category, String targetAccountId)
        recivedTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TransactionData transactionData, Category category)?
        expense,
    TResult Function(TransactionData transactionData, Category category)?
        income,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        sentTransfer,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        recivedTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionData transactionData, Category category)?
        expense,
    TResult Function(TransactionData transactionData, Category category)?
        income,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        sentTransfer,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        recivedTransfer,
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

  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call({TransactionData transactionData, Category category});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  final Transaction _value;
  // ignore: unused_field
  final $Res Function(Transaction) _then;

  @override
  $Res call({
    Object? transactionData = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      transactionData: transactionData == freezed
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionData,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc
abstract class _$ExpenseCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) then) =
      __$ExpenseCopyWithImpl<$Res>;
  @override
  $Res call({TransactionData transactionData, Category category});
}

/// @nodoc
class __$ExpenseCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(_Expense _value, $Res Function(_Expense) _then)
      : super(_value, (v) => _then(v as _Expense));

  @override
  _Expense get _value => super._value as _Expense;

  @override
  $Res call({
    Object? transactionData = freezed,
    Object? category = freezed,
  }) {
    return _then(_Expense(
      transactionData: transactionData == freezed
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionData,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$_Expense implements _Expense {
  const _$_Expense({required this.transactionData, required this.category});

  @override
  final TransactionData transactionData;
  @override
  final Category category;

  @override
  String toString() {
    return 'Transaction.expense(transactionData: $transactionData, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Expense &&
            const DeepCollectionEquality()
                .equals(other.transactionData, transactionData) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionData),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$ExpenseCopyWith<_Expense> get copyWith =>
      __$ExpenseCopyWithImpl<_Expense>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionData transactionData, Category category)
        expense,
    required TResult Function(
            TransactionData transactionData, Category category)
        income,
    required TResult Function(TransactionData transactionData,
            Category category, String targetAccountId)
        sentTransfer,
    required TResult Function(TransactionData transactionData,
            Category category, String targetAccountId)
        recivedTransfer,
  }) {
    return expense(transactionData, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TransactionData transactionData, Category category)?
        expense,
    TResult Function(TransactionData transactionData, Category category)?
        income,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        sentTransfer,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        recivedTransfer,
  }) {
    return expense?.call(transactionData, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionData transactionData, Category category)?
        expense,
    TResult Function(TransactionData transactionData, Category category)?
        income,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        sentTransfer,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        recivedTransfer,
    required TResult orElse(),
  }) {
    if (expense != null) {
      return expense(transactionData, category);
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

abstract class _Expense implements Transaction {
  const factory _Expense(
      {required TransactionData transactionData,
      required Category category}) = _$_Expense;

  @override
  TransactionData get transactionData;
  @override
  Category get category;
  @override
  @JsonKey(ignore: true)
  _$ExpenseCopyWith<_Expense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$IncomeCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$IncomeCopyWith(_Income value, $Res Function(_Income) then) =
      __$IncomeCopyWithImpl<$Res>;
  @override
  $Res call({TransactionData transactionData, Category category});
}

/// @nodoc
class __$IncomeCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$IncomeCopyWith<$Res> {
  __$IncomeCopyWithImpl(_Income _value, $Res Function(_Income) _then)
      : super(_value, (v) => _then(v as _Income));

  @override
  _Income get _value => super._value as _Income;

  @override
  $Res call({
    Object? transactionData = freezed,
    Object? category = freezed,
  }) {
    return _then(_Income(
      transactionData: transactionData == freezed
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionData,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$_Income implements _Income {
  const _$_Income({required this.transactionData, required this.category});

  @override
  final TransactionData transactionData;
  @override
  final Category category;

  @override
  String toString() {
    return 'Transaction.income(transactionData: $transactionData, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Income &&
            const DeepCollectionEquality()
                .equals(other.transactionData, transactionData) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionData),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$IncomeCopyWith<_Income> get copyWith =>
      __$IncomeCopyWithImpl<_Income>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionData transactionData, Category category)
        expense,
    required TResult Function(
            TransactionData transactionData, Category category)
        income,
    required TResult Function(TransactionData transactionData,
            Category category, String targetAccountId)
        sentTransfer,
    required TResult Function(TransactionData transactionData,
            Category category, String targetAccountId)
        recivedTransfer,
  }) {
    return income(transactionData, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TransactionData transactionData, Category category)?
        expense,
    TResult Function(TransactionData transactionData, Category category)?
        income,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        sentTransfer,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        recivedTransfer,
  }) {
    return income?.call(transactionData, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionData transactionData, Category category)?
        expense,
    TResult Function(TransactionData transactionData, Category category)?
        income,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        sentTransfer,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        recivedTransfer,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income(transactionData, category);
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

abstract class _Income implements Transaction {
  const factory _Income(
      {required TransactionData transactionData,
      required Category category}) = _$_Income;

  @override
  TransactionData get transactionData;
  @override
  Category get category;
  @override
  @JsonKey(ignore: true)
  _$IncomeCopyWith<_Income> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SentTransferCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$SentTransferCopyWith(
          _SentTransfer value, $Res Function(_SentTransfer) then) =
      __$SentTransferCopyWithImpl<$Res>;
  @override
  $Res call(
      {TransactionData transactionData,
      Category category,
      String targetAccountId});
}

/// @nodoc
class __$SentTransferCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$SentTransferCopyWith<$Res> {
  __$SentTransferCopyWithImpl(
      _SentTransfer _value, $Res Function(_SentTransfer) _then)
      : super(_value, (v) => _then(v as _SentTransfer));

  @override
  _SentTransfer get _value => super._value as _SentTransfer;

  @override
  $Res call({
    Object? transactionData = freezed,
    Object? category = freezed,
    Object? targetAccountId = freezed,
  }) {
    return _then(_SentTransfer(
      transactionData: transactionData == freezed
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionData,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      targetAccountId: targetAccountId == freezed
          ? _value.targetAccountId
          : targetAccountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SentTransfer implements _SentTransfer {
  const _$_SentTransfer(
      {required this.transactionData,
      required this.category,
      required this.targetAccountId});

  @override
  final TransactionData transactionData;
  @override
  final Category category;
  @override
  final String targetAccountId;

  @override
  String toString() {
    return 'Transaction.sentTransfer(transactionData: $transactionData, category: $category, targetAccountId: $targetAccountId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SentTransfer &&
            const DeepCollectionEquality()
                .equals(other.transactionData, transactionData) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.targetAccountId, targetAccountId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionData),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(targetAccountId));

  @JsonKey(ignore: true)
  @override
  _$SentTransferCopyWith<_SentTransfer> get copyWith =>
      __$SentTransferCopyWithImpl<_SentTransfer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionData transactionData, Category category)
        expense,
    required TResult Function(
            TransactionData transactionData, Category category)
        income,
    required TResult Function(TransactionData transactionData,
            Category category, String targetAccountId)
        sentTransfer,
    required TResult Function(TransactionData transactionData,
            Category category, String targetAccountId)
        recivedTransfer,
  }) {
    return sentTransfer(transactionData, category, targetAccountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TransactionData transactionData, Category category)?
        expense,
    TResult Function(TransactionData transactionData, Category category)?
        income,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        sentTransfer,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        recivedTransfer,
  }) {
    return sentTransfer?.call(transactionData, category, targetAccountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionData transactionData, Category category)?
        expense,
    TResult Function(TransactionData transactionData, Category category)?
        income,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        sentTransfer,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        recivedTransfer,
    required TResult orElse(),
  }) {
    if (sentTransfer != null) {
      return sentTransfer(transactionData, category, targetAccountId);
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

abstract class _SentTransfer implements Transaction {
  const factory _SentTransfer(
      {required TransactionData transactionData,
      required Category category,
      required String targetAccountId}) = _$_SentTransfer;

  @override
  TransactionData get transactionData;
  @override
  Category get category;
  String get targetAccountId;
  @override
  @JsonKey(ignore: true)
  _$SentTransferCopyWith<_SentTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RecivedTransferCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$RecivedTransferCopyWith(
          _RecivedTransfer value, $Res Function(_RecivedTransfer) then) =
      __$RecivedTransferCopyWithImpl<$Res>;
  @override
  $Res call(
      {TransactionData transactionData,
      Category category,
      String targetAccountId});
}

/// @nodoc
class __$RecivedTransferCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res>
    implements _$RecivedTransferCopyWith<$Res> {
  __$RecivedTransferCopyWithImpl(
      _RecivedTransfer _value, $Res Function(_RecivedTransfer) _then)
      : super(_value, (v) => _then(v as _RecivedTransfer));

  @override
  _RecivedTransfer get _value => super._value as _RecivedTransfer;

  @override
  $Res call({
    Object? transactionData = freezed,
    Object? category = freezed,
    Object? targetAccountId = freezed,
  }) {
    return _then(_RecivedTransfer(
      transactionData: transactionData == freezed
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionData,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      targetAccountId: targetAccountId == freezed
          ? _value.targetAccountId
          : targetAccountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RecivedTransfer implements _RecivedTransfer {
  const _$_RecivedTransfer(
      {required this.transactionData,
      required this.category,
      required this.targetAccountId});

  @override
  final TransactionData transactionData;
  @override
  final Category category;
  @override
  final String targetAccountId;

  @override
  String toString() {
    return 'Transaction.recivedTransfer(transactionData: $transactionData, category: $category, targetAccountId: $targetAccountId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecivedTransfer &&
            const DeepCollectionEquality()
                .equals(other.transactionData, transactionData) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.targetAccountId, targetAccountId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactionData),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(targetAccountId));

  @JsonKey(ignore: true)
  @override
  _$RecivedTransferCopyWith<_RecivedTransfer> get copyWith =>
      __$RecivedTransferCopyWithImpl<_RecivedTransfer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionData transactionData, Category category)
        expense,
    required TResult Function(
            TransactionData transactionData, Category category)
        income,
    required TResult Function(TransactionData transactionData,
            Category category, String targetAccountId)
        sentTransfer,
    required TResult Function(TransactionData transactionData,
            Category category, String targetAccountId)
        recivedTransfer,
  }) {
    return recivedTransfer(transactionData, category, targetAccountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TransactionData transactionData, Category category)?
        expense,
    TResult Function(TransactionData transactionData, Category category)?
        income,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        sentTransfer,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        recivedTransfer,
  }) {
    return recivedTransfer?.call(transactionData, category, targetAccountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionData transactionData, Category category)?
        expense,
    TResult Function(TransactionData transactionData, Category category)?
        income,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        sentTransfer,
    TResult Function(TransactionData transactionData, Category category,
            String targetAccountId)?
        recivedTransfer,
    required TResult orElse(),
  }) {
    if (recivedTransfer != null) {
      return recivedTransfer(transactionData, category, targetAccountId);
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

abstract class _RecivedTransfer implements Transaction {
  const factory _RecivedTransfer(
      {required TransactionData transactionData,
      required Category category,
      required String targetAccountId}) = _$_RecivedTransfer;

  @override
  TransactionData get transactionData;
  @override
  Category get category;
  String get targetAccountId;
  @override
  @JsonKey(ignore: true)
  _$RecivedTransferCopyWith<_RecivedTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}
