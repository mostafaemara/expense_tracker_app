enum TransferType { to, from }
enum TransactionType { expense, income, transfer }

class Transaction {
  final String id;
  final DateTime date;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;
  Transaction(
      {required this.date,
      required this.id,
      required this.accountId,
      required this.amount,
      required this.description,
      required this.attachment});
}

class Expense extends Transaction {
  final String category;
  Expense(
      {required DateTime date,
      required String accountId,
      required this.category,
      required double amount,
      required String id,
      required String description,
      required String attachment})
      : super(
            id: id,
            accountId: accountId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);
}

class Income extends Transaction {
  final String category;
  Income(
      {required DateTime date,
      required this.category,
      required String accountId,
      required double amount,
      required String id,
      required String description,
      required String attachment})
      : super(
            id: id,
            accountId: accountId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);
}

class SentTransfer extends Transaction {
  final String targetAccountId;
  SentTransfer(
      {required DateTime date,
      required this.targetAccountId,
      required String accountId,
      required String id,
      required double amount,
      required String description,
      required String attachment})
      : super(
            id: id,
            accountId: accountId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);
}

class RecivedTransfer extends Transaction {
  final String targetAccountId;
  RecivedTransfer(
      {required DateTime date,
      required this.targetAccountId,
      required String accountId,
      required double amount,
      required String description,
      required String id,
      required String attachment})
      : super(
            id: id,
            accountId: accountId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);
}
