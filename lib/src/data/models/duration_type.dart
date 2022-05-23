import 'package:flutter/material.dart';

enum DurationType {
  today,
  week,
  month,
  year;

  DateTimeRange toDateRange() {
    final now = DateTime.now();
    switch (this) {
      case DurationType.today:
        return DateTimeRange(start: now, end: now);
      case DurationType.week:
        return DateTimeRange(
            start: now.subtract(const Duration(days: 7)), end: now);
      case DurationType.month:
        return DateTimeRange(
            start: now.subtract(const Duration(days: 30)), end: now);
      case DurationType.year:
        return DateTimeRange(
            start: now.subtract(const Duration(days: 365)), end: now);
    }
  }
}
