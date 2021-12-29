import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_input.freezed.dart';

@freezed
abstract class TransactionInput with _$TransactionInput {
  const TransactionInput._();
  const factory TransactionInput.expense(
      {required TransactionInputData transactionInputData,
      required String category}) = _ExpenseInput;
  const factory TransactionInput.income(
      {required TransactionInputData transactionInputData,
      required String category}) = _IncomeInput;
  const factory TransactionInput.sentTransfer(
      {required TransactionInputData transactionInputData,
      required String targetAccountId}) = _SentTransferInput;
  const factory TransactionInput.recivedTransfer(
      {required TransactionInputData transactionInputData,
      required String targetAccountId}) = _RecivedTransferInput;

  Map<String, dynamic> toMap() {
    return when(
        expense: _expenseToMap,
        income: _incomeToMap,
        sentTransfer: _sentTransferToMap,
        recivedTransfer: _recivedTransferToMap);
  }

  Map<String, dynamic> _expenseToMap(
      TransactionInputData transactionInputData, String category) {
    return {
      ...transactionInputData.toMap(),
      'category': category,
      "type": "expense"
    };
  }

  Map<String, dynamic> _incomeToMap(
      TransactionInputData transactionInputData, String category) {
    return {
      ...transactionInputData.toMap(),
      'category': category,
      "type": "income"
    };
  }

  Map<String, dynamic> _sentTransferToMap(
      TransactionInputData transactionInputData, String targetAccountId) {
    return {
      ...transactionInputData.toMap(),
      'targetAccount': targetAccountId,
      "type": "sent"
    };
  }

  Map<String, dynamic> _recivedTransferToMap(
      TransactionInputData transactionInputData, String targetAccountId) {
    return {
      ...transactionInputData.toMap(),
      'targetAccount': targetAccountId,
      "type": "recived"
    };
  }
}

class TransactionInputData {
  final double amount;
  final String description;
  final String attachment;
  final String accountId;
  TransactionInputData(
      {required this.accountId,
      required this.amount,
      required this.description,
      required this.attachment});

  Map<String, dynamic> toMap() {
    return {
      "accountId": accountId,
      "amount": amount,
      "description": description,
      "attachment": attachment,
    };
  }
}
