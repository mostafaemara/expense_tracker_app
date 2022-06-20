enum Language {
  english("en"),
  arabic("ar");

  final String value;
  const Language(this.value);

  factory Language.parse(String value) {
    switch (value) {
      case "en":
        return Language.english;
      case "ar":
        return Language.arabic;
      default:
        throw const FormatException("invalid language value");
    }
  }
}
