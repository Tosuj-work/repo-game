// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
      level: (json['level'] as num?)?.toInt() ?? 1,
      experience: (json['experience'] as num?)?.toInt() ?? 0,
      stepsCount: (json['stepsCount'] as num?)?.toInt() ?? 0,
      runDistance: (json['runDistance'] as num?)?.toInt() ?? 0,
      cycleDistance: (json['cycleDistance'] as num?)?.toInt() ?? 0,
      swimDistance: (json['swimDistance'] as num?)?.toInt() ?? 0,
      achievements: (json['achievements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      completedChallenges: (json['completedChallenges'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      characterCustomization:
          json['characterCustomization'] as Map<String, dynamic>? ?? const {},
      duelsWon: (json['duelsWon'] as num?)?.toInt() ?? 0,
      duelsLost: (json['duelsLost'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      age: (json['age'] as num?)?.toInt(),
      sex: json['sex'] as String?,
      mainActivity: json['mainActivity'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'level': instance.level,
      'experience': instance.experience,
      'stepsCount': instance.stepsCount,
      'runDistance': instance.runDistance,
      'cycleDistance': instance.cycleDistance,
      'swimDistance': instance.swimDistance,
      'achievements': instance.achievements,
      'completedChallenges': instance.completedChallenges,
      'characterCustomization': instance.characterCustomization,
      'duelsWon': instance.duelsWon,
      'duelsLost': instance.duelsLost,
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
      'sex': instance.sex,
      'mainActivity': instance.mainActivity,
    };
