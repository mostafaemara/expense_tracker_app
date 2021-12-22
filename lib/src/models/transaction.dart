class Transaction {
  final DateTime date;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;
  Transaction(
      {required this.date,
      required this.accountId,
      required this.amount,
      required this.description,
      required this.attachment});
}

class Expense extends Transaction {
  final String category;
  Expense(
      {required DateTime date,
      required String walletId,
      required this.category,
      required double amount,
      required String description,
      required String attachment})
      : super(
            accountId: walletId,
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
      required String walletId,
      required double amount,
      required String description,
      required String attachment})
      : super(
            accountId: walletId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);
}

enum TransferType { to, from }

class SentTransfer extends Transaction {
  final String targetWallet;
  SentTransfer(
      {required DateTime date,
      required this.targetWallet,
      required String walletId,
      required double amount,
      required String description,
      required String attachment})
      : super(
            accountId: walletId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);
}

class RecivedTransfer extends Transaction {
  final String targetWallet;
  RecivedTransfer(
      {required DateTime date,
      required this.targetWallet,
      required String walletId,
      required double amount,
      required String description,
      required String attachment})
      : super(
            accountId: walletId,
            amount: amount,
            description: description,
            attachment: attachment,
            date: date);
}
