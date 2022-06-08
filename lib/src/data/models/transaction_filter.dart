enum TransactionFilter {
  all("all"),
  expense("expense"),
  income("income");

  final String value;

  const TransactionFilter(this.value);
}
