enum TransactionType { expense, income, sent, received, transfer }

extension TransactionTypeMapper on TransactionType {
  String name() {
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

TransactionType parse(String value) {
  switch (value) {
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
