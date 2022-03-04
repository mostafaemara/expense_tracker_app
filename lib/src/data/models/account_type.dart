enum AccountType { bankAccount, wallet }

extension AccountTypeMapper on AccountType {
  String name() {
    switch (this) {
      case AccountType.bankAccount:
        return "bankAccount";

      case AccountType.wallet:
        return "wallet";
    }
  }
}

AccountType parse(String value) {
  switch (value) {
    case "bankAccount":
      return AccountType.bankAccount;

    case "wallet":
      return AccountType.wallet;

    default:
      throw const FormatException();
  }
}
