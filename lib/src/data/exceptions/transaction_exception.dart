import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_exception.freezed.dart';

@freezed
abstract class TransactionException with _$TransactionException {
  const factory TransactionException.serverError() = _ServerError;
  const factory TransactionException.notEnoughBalance(
      {required double availbleBalance}) = _NotEnoughBalance;
}
