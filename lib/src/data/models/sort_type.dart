enum SortType { newest, lowest, highest, oldest }

extension SortTypeMapper on SortType {
  String name() {
    switch (this) {
      case SortType.highest:
        return "highest";
      case SortType.lowest:
        return "lowest";
      case SortType.newest:
        return "newest";
      case SortType.oldest:
        return "oldest";
    }
  }
}

SortType parse(String value) {
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
