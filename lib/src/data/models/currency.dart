enum Currency {
  usd("USD", "\$"),
  egp("EGP", "E£");

  final String symbol;
  final String code;
  const Currency(this.code, this.symbol);

  factory Currency.parse(String code) {
    switch (code) {
      case "USD":
        return Currency.usd;
      case "EGP":
        return Currency.egp;
      default:
        throw const FormatException("Invalid currency");
    }
  }
}
