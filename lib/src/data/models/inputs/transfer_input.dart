class TransferInput {
  final String title;
  final double amount;
  final String description;
  final String attachment;
  final String account;
  final String targetAccount;
  TransferInput(
      {required this.account,
      required this.title,
      required this.amount,
      required this.description,
      required this.targetAccount,
      this.attachment = ""});

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "account": account,
      "amount": amount,
      "description": description,
      "attachment": attachment,
      "target": targetAccount
    };
  }
}
