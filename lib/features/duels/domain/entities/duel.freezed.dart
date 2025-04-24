// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Duel _$DuelFromJson(Map<String, dynamic> json) {
  return _Duel.fromJson(json);
}

/// @nodoc
mixin _$Duel {
  String get id => throw _privateConstructorUsedError;
  String get initiatorId => throw _privateConstructorUsedError;
  String get opponentId => throw _privateConstructorUsedError;
  DuelType get type => throw _privateConstructorUsedError;
  DuelActivity get activity => throw _privateConstructorUsedError;
  int get targetValue => throw _privateConstructorUsedError;
  int get reward => throw _privateConstructorUsedError; // опыт победителю
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DuelStatus get status => throw _privateConstructorUsedError;
  int get initiatorProgress => throw _privateConstructorUsedError;
  int get opponentProgress => throw _privateConstructorUsedError;
  String? get winnerId => throw _privateConstructorUsedError;

  /// Serializes this Duel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Duel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DuelCopyWith<Duel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuelCopyWith<$Res> {
  factory $DuelCopyWith(Duel value, $Res Function(Duel) then) =
      _$DuelCopyWithImpl<$Res, Duel>;
  @useResult
  $Res call(
      {String id,
      String initiatorId,
      String opponentId,
      DuelType type,
      DuelActivity activity,
      int targetValue,
      int reward,
      DateTime startDate,
      DateTime endDate,
      DuelStatus status,
      int initiatorProgress,
      int opponentProgress,
      String? winnerId});
}

/// @nodoc
class _$DuelCopyWithImpl<$Res, $Val extends Duel>
    implements $DuelCopyWith<$Res> {
  _$DuelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Duel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? initiatorId = null,
    Object? opponentId = null,
    Object? type = null,
    Object? activity = null,
    Object? targetValue = null,
    Object? reward = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? initiatorProgress = null,
    Object? opponentProgress = null,
    Object? winnerId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      initiatorId: null == initiatorId
          ? _value.initiatorId
          : initiatorId // ignore: cast_nullable_to_non_nullable
              as String,
      opponentId: null == opponentId
          ? _value.opponentId
          : opponentId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DuelType,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as DuelActivity,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as int,
      reward: null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DuelStatus,
      initiatorProgress: null == initiatorProgress
          ? _value.initiatorProgress
          : initiatorProgress // ignore: cast_nullable_to_non_nullable
              as int,
      opponentProgress: null == opponentProgress
          ? _value.opponentProgress
          : opponentProgress // ignore: cast_nullable_to_non_nullable
              as int,
      winnerId: freezed == winnerId
          ? _value.winnerId
          : winnerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DuelImplCopyWith<$Res> implements $DuelCopyWith<$Res> {
  factory _$$DuelImplCopyWith(
          _$DuelImpl value, $Res Function(_$DuelImpl) then) =
      __$$DuelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String initiatorId,
      String opponentId,
      DuelType type,
      DuelActivity activity,
      int targetValue,
      int reward,
      DateTime startDate,
      DateTime endDate,
      DuelStatus status,
      int initiatorProgress,
      int opponentProgress,
      String? winnerId});
}

/// @nodoc
class __$$DuelImplCopyWithImpl<$Res>
    extends _$DuelCopyWithImpl<$Res, _$DuelImpl>
    implements _$$DuelImplCopyWith<$Res> {
  __$$DuelImplCopyWithImpl(_$DuelImpl _value, $Res Function(_$DuelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Duel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? initiatorId = null,
    Object? opponentId = null,
    Object? type = null,
    Object? activity = null,
    Object? targetValue = null,
    Object? reward = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? initiatorProgress = null,
    Object? opponentProgress = null,
    Object? winnerId = freezed,
  }) {
    return _then(_$DuelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      initiatorId: null == initiatorId
          ? _value.initiatorId
          : initiatorId // ignore: cast_nullable_to_non_nullable
              as String,
      opponentId: null == opponentId
          ? _value.opponentId
          : opponentId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DuelType,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as DuelActivity,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as int,
      reward: null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DuelStatus,
      initiatorProgress: null == initiatorProgress
          ? _value.initiatorProgress
          : initiatorProgress // ignore: cast_nullable_to_non_nullable
              as int,
      opponentProgress: null == opponentProgress
          ? _value.opponentProgress
          : opponentProgress // ignore: cast_nullable_to_non_nullable
              as int,
      winnerId: freezed == winnerId
          ? _value.winnerId
          : winnerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DuelImpl extends _Duel {
  const _$DuelImpl(
      {required this.id,
      required this.initiatorId,
      required this.opponentId,
      required this.type,
      required this.activity,
      required this.targetValue,
      required this.reward,
      required this.startDate,
      required this.endDate,
      this.status = DuelStatus.pending,
      this.initiatorProgress = 0,
      this.opponentProgress = 0,
      this.winnerId})
      : super._();

  factory _$DuelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DuelImplFromJson(json);

  @override
  final String id;
  @override
  final String initiatorId;
  @override
  final String opponentId;
  @override
  final DuelType type;
  @override
  final DuelActivity activity;
  @override
  final int targetValue;
  @override
  final int reward;
// опыт победителю
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  @JsonKey()
  final DuelStatus status;
  @override
  @JsonKey()
  final int initiatorProgress;
  @override
  @JsonKey()
  final int opponentProgress;
  @override
  final String? winnerId;

  @override
  String toString() {
    return 'Duel(id: $id, initiatorId: $initiatorId, opponentId: $opponentId, type: $type, activity: $activity, targetValue: $targetValue, reward: $reward, startDate: $startDate, endDate: $endDate, status: $status, initiatorProgress: $initiatorProgress, opponentProgress: $opponentProgress, winnerId: $winnerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DuelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.initiatorId, initiatorId) ||
                other.initiatorId == initiatorId) &&
            (identical(other.opponentId, opponentId) ||
                other.opponentId == opponentId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.initiatorProgress, initiatorProgress) ||
                other.initiatorProgress == initiatorProgress) &&
            (identical(other.opponentProgress, opponentProgress) ||
                other.opponentProgress == opponentProgress) &&
            (identical(other.winnerId, winnerId) ||
                other.winnerId == winnerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      initiatorId,
      opponentId,
      type,
      activity,
      targetValue,
      reward,
      startDate,
      endDate,
      status,
      initiatorProgress,
      opponentProgress,
      winnerId);

  /// Create a copy of Duel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DuelImplCopyWith<_$DuelImpl> get copyWith =>
      __$$DuelImplCopyWithImpl<_$DuelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DuelImplToJson(
      this,
    );
  }
}

abstract class _Duel extends Duel {
  const factory _Duel(
      {required final String id,
      required final String initiatorId,
      required final String opponentId,
      required final DuelType type,
      required final DuelActivity activity,
      required final int targetValue,
      required final int reward,
      required final DateTime startDate,
      required final DateTime endDate,
      final DuelStatus status,
      final int initiatorProgress,
      final int opponentProgress,
      final String? winnerId}) = _$DuelImpl;
  const _Duel._() : super._();

  factory _Duel.fromJson(Map<String, dynamic> json) = _$DuelImpl.fromJson;

  @override
  String get id;
  @override
  String get initiatorId;
  @override
  String get opponentId;
  @override
  DuelType get type;
  @override
  DuelActivity get activity;
  @override
  int get targetValue;
  @override
  int get reward; // опыт победителю
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  DuelStatus get status;
  @override
  int get initiatorProgress;
  @override
  int get opponentProgress;
  @override
  String? get winnerId;

  /// Create a copy of Duel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DuelImplCopyWith<_$DuelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
