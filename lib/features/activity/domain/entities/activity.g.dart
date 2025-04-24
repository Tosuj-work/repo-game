// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
      value: (json['value'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: (json['duration'] as num).toInt()),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$ActivityTypeEnumMap[instance.type]!,
      'value': instance.value,
      'date': instance.date.toIso8601String(),
      'duration': instance.duration?.inMicroseconds,
      'metadata': instance.metadata,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.steps: 'steps',
  ActivityType.running: 'running',
  ActivityType.cycling: 'cycling',
  ActivityType.swimming: 'swimming',
};

_$DailyActivityImpl _$$DailyActivityImplFromJson(Map<String, dynamic> json) =>
    _$DailyActivityImpl(
      date: DateTime.parse(json['date'] as String),
      activities: (json['activities'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$ActivityTypeEnumMap, k), (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$DailyActivityImplToJson(_$DailyActivityImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'activities': instance.activities
          .map((k, e) => MapEntry(_$ActivityTypeEnumMap[k]!, e)),
    };
