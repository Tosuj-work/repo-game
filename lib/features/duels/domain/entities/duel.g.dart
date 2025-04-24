// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DuelImpl _$$DuelImplFromJson(Map<String, dynamic> json) => _$DuelImpl(
      id: json['id'] as String,
      initiatorId: json['initiatorId'] as String,
      opponentId: json['opponentId'] as String,
      type: $enumDecode(_$DuelTypeEnumMap, json['type']),
      activity: $enumDecode(_$DuelActivityEnumMap, json['activity']),
      targetValue: (json['targetValue'] as num).toInt(),
      reward: (json['reward'] as num).toInt(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      status: $enumDecodeNullable(_$DuelStatusEnumMap, json['status']) ??
          DuelStatus.pending,
      initiatorProgress: (json['initiatorProgress'] as num?)?.toInt() ?? 0,
      opponentProgress: (json['opponentProgress'] as num?)?.toInt() ?? 0,
      winnerId: json['winnerId'] as String?,
    );

Map<String, dynamic> _$$DuelImplToJson(_$DuelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'initiatorId': instance.initiatorId,
      'opponentId': instance.opponentId,
      'type': _$DuelTypeEnumMap[instance.type]!,
      'activity': _$DuelActivityEnumMap[instance.activity]!,
      'targetValue': instance.targetValue,
      'reward': instance.reward,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'status': _$DuelStatusEnumMap[instance.status]!,
      'initiatorProgress': instance.initiatorProgress,
      'opponentProgress': instance.opponentProgress,
      'winnerId': instance.winnerId,
    };

const _$DuelTypeEnumMap = {
  DuelType.quick: 'quick',
  DuelType.standard: 'standard',
  DuelType.extended: 'extended',
  DuelType.custom: 'custom',
};

const _$DuelActivityEnumMap = {
  DuelActivity.steps: 'steps',
  DuelActivity.running: 'running',
  DuelActivity.cycling: 'cycling',
  DuelActivity.swimming: 'swimming',
};

const _$DuelStatusEnumMap = {
  DuelStatus.pending: 'pending',
  DuelStatus.active: 'active',
  DuelStatus.completed: 'completed',
  DuelStatus.cancelled: 'cancelled',
};
