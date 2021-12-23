enum AccountType { bankAccount, wallet }

class Account {
  final String title;
  final AccountType accountType;
  final double balance;
  final String id;

  Account.input(
      {required this.balance,
      required this.title,
      this.id = "",
      required this.accountType});
  Account(
      {required this.balance,
      required this.title,
      required this.id,
      required this.accountType});

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": accountType == AccountType.bankAccount ? "bankAccount" : "wallet",
      "balance": balance,
    };
  }

  Account copyWithId(String id) =>
      Account(accountType: accountType, balance: balance, title: title, id: id);

  // double get balance {
  //   double _balance = 0;
  //   for (final transaction in transactions) {
  //     if (transaction is Expense) {
  //       _balance -= transaction.amount;
  //     }
  //     if (transaction is Income) {
  //       _balance += transaction.amount;
  //     }
  //     if (transactions is SentTransfer) {
  //       _balance -= transaction.amount;
  //     }

  //     if (transaction is RecivedTransfer) {
  //       _balance += transaction.amount;
  //     }
  //   }
  //   return _balance;
  // }
}
