// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeImpl _$$ChallengeImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$ChallengeTypeEnumMap, json['type']),
      activity: $enumDecode(_$ChallengeActivityEnumMap, json['activity']),
      targetValue: (json['targetValue'] as num).toInt(),
      reward: (json['reward'] as num).toInt(),
      iconUrl: json['iconUrl'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChallengeImplToJson(_$ChallengeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$ChallengeTypeEnumMap[instance.type]!,
      'activity': _$ChallengeActivityEnumMap[instance.activity]!,
      'targetValue': instance.targetValue,
      'reward': instance.reward,
      'iconUrl': instance.iconUrl,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'isCompleted': instance.isCompleted,
    };

const _$ChallengeTypeEnumMap = {
  ChallengeType.daily: 'daily',
  ChallengeType.weekly: 'weekly',
  ChallengeType.monthly: 'monthly',
  ChallengeType.special: 'special',
};

const _$ChallengeActivityEnumMap = {
  ChallengeActivity.steps: 'steps',
  ChallengeActivity.running: 'running',
  ChallengeActivity.cycling: 'cycling',
  ChallengeActivity.swimming: 'swimming',
  ChallengeActivity.combined: 'combined',
};
