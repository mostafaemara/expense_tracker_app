class TransferInput {
  final double amount;

  final String fromAccountId;
  final String toAccountId;
  TransferInput({
    required this.fromAccountId,
    required this.amount,
    required this.toAccountId,
  });

  Map<String, dynamic> toMap() {
    return {
      "fromAccountId": fromAccountId,
      "amount": amount,
      "toAccountId": toAccountId
    };
  }
}
