import 'transaction_type.dart';

class FrequentTransaction {
  final String id;
  final DateTime date;
  final double amount;
  final String description;
  final String attachment;
  final String accountId;
  final String category;
  final String targetAccountId;
  final TransactionType type;
  final List<RepeatedTransaction> repeatedTransactions;

  FrequentTransaction(
      {required this.date,
      required this.repeatedTransactions,
      required this.type,
      required this.category,
      this.targetAccountId = "",
      required this.id,
      required this.accountId,
      required this.amount,
      required this.description,
      required this.attachment});
}

class RepeatedTransaction {
  final String id;
  final DateTime date;

  RepeatedTransaction(this.id, this.date);
}
