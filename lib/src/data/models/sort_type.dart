enum SortType {
  newest("newest"),
  oldest("oldest"),
  highest("highest"),
  lowest("lowest");

  final String value;

  const SortType(this.value);

  factory SortType.parse(String value) {
    switch (value) {
      case "highest":
        return SortType.highest;
      case "lowest":
        return SortType.lowest;

      case "newest":
        return SortType.newest;
      case "oldest":
        return SortType.oldest;
      default:
        throw const FormatException("invalid Transaction type");
    }
  }
}
