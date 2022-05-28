part 'periodic_type.freezed.dart';

abstract class PeriodicType with _$PeriodicType {
  const PeriodicType._();
  const factory PeriodicType.daily() = _Daily;
  const factory PeriodicType.weekly() = _Weekly;
  const factory PeriodicType.monthly() = _Monthly;
  const factory PeriodicType.yearly() = _Yearly;
  String toMap() {
    return when(
        daily: () => "daily",
        weekly: () => "weekly",
        monthly: () => "monthly",
        yearly: () => "yearly");
  }
}
