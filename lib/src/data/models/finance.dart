class Finance {
  final double balance;
  final double income;
  final double expense;

  Finance({required this.balance, required this.income, required this.expense});

  factory Finance.fromMap(Map<String, dynamic> map) {
    return Finance(
      balance: map['balance']?.toDouble(),
      income: map['incomes']?.toDouble(),
      expense: map['expenses']?.toDouble(),
    );
  }
}
