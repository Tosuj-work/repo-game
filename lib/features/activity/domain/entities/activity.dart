import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  const factory Activity({
    required String id,
    required String userId,
    required ActivityType type,
    required int value, // значение (шаги, метры и т.д.)
    required DateTime date,
    Duration? duration, // длительность активности
    Map<String, dynamic>? metadata, // дополнительные данные
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
}

@freezed
class DailyActivity with _$DailyActivity {
  const factory DailyActivity({
    required DateTime date,
    required Map<ActivityType, int> activities,
  }) = _DailyActivity;

  factory DailyActivity.fromJson(Map<String, dynamic> json) => _$DailyActivityFromJson(json);

  const DailyActivity._();
  
  int getActivityValue(ActivityType type) => activities[type] ?? 0;
  
  int get totalSteps => getActivityValue(ActivityType.steps);
  int get totalRunning => getActivityValue(ActivityType.running);
  int get totalCycling => getActivityValue(ActivityType.cycling);
  int get totalSwimming => getActivityValue(ActivityType.swimming);
}

enum ActivityType {
  steps,
  running,
  cycling,
  swimming,
} 