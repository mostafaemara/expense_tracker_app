part 'transaction_form_type.freezed.dart';

abstract class TransactionFormType with _$TransactionFormType {
  const factory TransactionFormType.expense() = _Expense;
  const factory TransactionFormType.income() = _Income;
  const factory TransactionFormType.transfer() = _Transfer;
}
