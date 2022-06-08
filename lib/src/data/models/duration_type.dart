import 'package:flutter/material.dart';

enum DurationType {
  today,
  week,
  month,
  year;

  DateTimeRange toDateRange() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    switch (this) {
      case DurationType.today:
        return DateTimeRange(
            start: today, end: today.add(const Duration(days: 1)));
      case DurationType.week:
        return DateTimeRange(
            start: today.subtract(const Duration(days: 7)),
            end: today.add(const Duration(days: 1)));
      case DurationType.month:
        return DateTimeRange(
            start: today.subtract(const Duration(days: 30)),
            end: today.add(const Duration(days: 1)));
      case DurationType.year:
        return DateTimeRange(
            start: today.subtract(const Duration(days: 365)),
            end: today.add(const Duration(days: 1)));
    }
  }
}
