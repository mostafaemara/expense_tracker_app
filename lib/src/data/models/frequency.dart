enum Frequency {
  daily("daily"),
  weekly("weekly"),
  monthly("monthly"),
  yearly("yearly");

  final String value;
  const Frequency(this.value);
  factory Frequency.parse(String value) {
    switch (value) {
      case "daily":
        return Frequency.daily;
      case "weekly":
        return Frequency.weekly;
      case "monthly":
        return Frequency.monthly;
      case "yearly":
        return Frequency.yearly;
      default:
        throw const FormatException("invalid Frequency type");
    }
  }
}
