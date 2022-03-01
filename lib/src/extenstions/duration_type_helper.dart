import 'package:expense_tracker_app/src/data/models/duration_type.dart';

extension DurationTypeConverter on DurationType {
  DateTime toDateTime(DateTime todayDate) => when(
      today: () => todayDate,
      week: () => todayDate.subtract(const Duration(days: 7)),
      month: () => DateTime(todayDate.year, todayDate.month - 1, todayDate.day),
      year: () => DateTime(todayDate.year - 1, todayDate.month, todayDate.day));
}
