import 'package:freezed_annotation/freezed_annotation.dart';

part "duration_type.freezed.dart";

@freezed
abstract class DurationType with _$DurationType {
  const factory DurationType.today() = _Today;
  const factory DurationType.week() = _Week;
  const factory DurationType.month() = _Month;
  const factory DurationType.year() = _Year;
}
