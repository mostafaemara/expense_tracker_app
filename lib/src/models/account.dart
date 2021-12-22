enum AccountType { bankAccount, wallet }

class Account {
  final String title;
  final AccountType accountType;
  final double initialBalance;
  final String id;

  Account(
      {required this.initialBalance,
      required this.title,
      required this.id,
      required this.accountType});

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
