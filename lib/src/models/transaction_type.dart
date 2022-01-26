enum TransactionType { expense, income, sent, received, transfer }

extension TransactionTypeMapper on TransactionType {
  String toMap() {
    switch (this) {
      case TransactionType.expense:
        return "expense";
      case TransactionType.income:
        return "income";
      case TransactionType.sent:
        return "sent";
      case TransactionType.received:
        return "received";
      case TransactionType.transfer:
        return "transfer";
    }
  }
}

extension StringMapper on String {
  TransactionType fromMap() {
    switch (this) {
      case "expense":
        return TransactionType.expense;
      case "income":
        return TransactionType.income;
      case "sent":
        return TransactionType.sent;
      case "received":
        return TransactionType.received;
      case "transfer":
        return TransactionType.transfer;
      default:
        throw const FormatException("invalid Transaction type");
    }
  }
}
