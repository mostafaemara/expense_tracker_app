extension DateTimeFilter on DateTime {
  bool isAfterEqual(DateTime date) {
    return (isAfter(date) ||
        (day == date.day && month == date.month && year == date.year));
  }

  bool isBeforeEqual(DateTime date) {
    return (isBefore(date) ||
        (day == date.day && month == date.month && year == date.year));
  }
}
