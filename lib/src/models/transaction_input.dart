class TransactionInput {
  final double amount;
  final String description;
  final String attachment;
  final String accountId;
  TransactionInput(
      {required this.accountId,
      required this.amount,
      required this.description,
      required this.attachment});

  Map<String, dynamic> toMapByType() {
    if (this is ExpenseInput) {
      return (this as ExpenseInput).toMap("expense");
    } else if (this is IncomeInput) {
      return (this as IncomeInput).toMap("income");
    } else if (this is SentTransferInput) {
      return (this as IncomeInput).toMap("income");
    } else if (this is RecivedTransferInput) {
      return (this as IncomeInput).toMap("income");
    }
    throw Exception("Invalid Transaction Type");
  }
}

class ExpenseInput extends TransactionInput {
  final String category;
  ExpenseInput(
      {required String accountId,
      required this.category,
      required double amount,
      required String description,
      required String attachment})
      : super(
          accountId: accountId,
          amount: amount,
          description: description,
          attachment: attachment,
        );

  ExpenseInput.fromTransaction({
    required TransactionInput transaction,
    required this.category,
  }) : super(
          accountId: transaction.accountId,
          amount: transaction.amount,
          description: transaction.description,
          attachment: transaction.attachment,
        );

  Map<String, dynamic> toMap(String type) {
    return {
      "accountId": accountId,
      "amount": amount,
      "description": description,
      "attachment": attachment,
      "category": category,
      "type": type
    };
  }
}

class IncomeInput extends TransactionInput {
  final String category;
  IncomeInput(
      {required this.category,
      required String accountId,
      required double amount,
      required String description,
      required String attachment})
      : super(
          accountId: accountId,
          amount: amount,
          description: description,
          attachment: attachment,
        );
  IncomeInput.fromTransaction({
    required TransactionInput transaction,
    required this.category,
  }) : super(
          accountId: transaction.accountId,
          amount: transaction.amount,
          description: transaction.description,
          attachment: transaction.attachment,
        );
  Map<String, dynamic> toMap(String type) {
    return {
      "accountId": accountId,
      "amount": amount,
      "description": description,
      "attachment": attachment,
      "category": category,
      "type": type
    };
  }
}

class SentTransferInput extends TransactionInput {
  final String targetAccountId;
  SentTransferInput(
      {required this.targetAccountId,
      required String accountId,
      required double amount,
      required String description,
      required String attachment})
      : super(
          accountId: accountId,
          amount: amount,
          description: description,
          attachment: attachment,
        );
}

class RecivedTransferInput extends TransactionInput {
  final String targetAccountId;
  RecivedTransferInput(
      {required this.targetAccountId,
      required String accountId,
      required double amount,
      required String description,
      required String attachment})
      : super(
          accountId: accountId,
          amount: amount,
          description: description,
          attachment: attachment,
        );
}
