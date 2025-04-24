import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

@freezed
class Challenge with _$Challenge {
  const factory Challenge({
    required String id,
    required String title,
    required String description,
    required ChallengeType type,
    required ChallengeActivity activity,
    required int targetValue,
    required int reward, // опыт
    required String iconUrl,
    required DateTime startDate,
    required DateTime endDate,
    @Default(false) bool isCompleted,
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) => _$ChallengeFromJson(json);
}

enum ChallengeType {
  daily,
  weekly,
  monthly,
  special,
}

enum ChallengeActivity {
  steps,
  running,
  cycling,
  swimming,
  combined,
} 