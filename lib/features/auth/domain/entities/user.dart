import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String? photoUrl;
  final int level;
  final int experience;
  final int stepsCount;
  final int runDistance; // в метрах
  final int cycleDistance; // в метрах
  final int swimDistance; // в метрах
  final List<String> achievements;
  final List<String> completedChallenges;
  final Map<String, dynamic> characterCustomization;
  final int duelsWon;
  final int duelsLost;
  
  // Дополнительные поля персональной информации
  final int? height; // в сантиметрах
  final int? weight; // в килограммах
  final int? age;
  final String? sex; // 'male' или 'female'
  final String? mainActivity; // 'walking', 'running', 'cycling', 'swimming'

  const User({
    required this.id,
    required this.username,
    required this.email,
    this.photoUrl,
    this.level = 1,
    this.experience = 0,
    this.stepsCount = 0,
    this.runDistance = 0,
    this.cycleDistance = 0,
    this.swimDistance = 0,
    this.achievements = const [],
    this.completedChallenges = const [],
    this.characterCustomization = const {},
    this.duelsWon = 0,
    this.duelsLost = 0,
    this.height,
    this.weight,
    this.age,
    this.sex,
    this.mainActivity,
  });

  // Вычисляемые поля
  int get totalDuels => duelsWon + duelsLost;
  
  double get winRate => totalDuels == 0 ? 0 : duelsWon / totalDuels;
  
  // Сколько опыта нужно для следующего уровня
  int get expToNextLevel => level * 100;
  
  // Прогресс к следующему уровню (от 0 до 1)
  double get levelProgress => experience / expToNextLevel;

  // Копирование объекта с изменением отдельных полей
  User copyWith({
    String? id,
    String? username,
    String? email,
    String? photoUrl,
    int? level,
    int? experience,
    int? stepsCount,
    int? runDistance,
    int? cycleDistance,
    int? swimDistance,
    List<String>? achievements,
    List<String>? completedChallenges,
    Map<String, dynamic>? characterCustomization,
    int? duelsWon,
    int? duelsLost,
    int? height,
    int? weight,
    int? age,
    String? sex,
    String? mainActivity,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      level: level ?? this.level,
      experience: experience ?? this.experience,
      stepsCount: stepsCount ?? this.stepsCount,
      runDistance: runDistance ?? this.runDistance,
      cycleDistance: cycleDistance ?? this.cycleDistance,
      swimDistance: swimDistance ?? this.swimDistance,
      achievements: achievements ?? this.achievements,
      completedChallenges: completedChallenges ?? this.completedChallenges,
      characterCustomization: characterCustomization ?? this.characterCustomization,
      duelsWon: duelsWon ?? this.duelsWon,
      duelsLost: duelsLost ?? this.duelsLost,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      mainActivity: mainActivity ?? this.mainActivity,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          username == other.username &&
          email == other.email &&
          photoUrl == other.photoUrl &&
          level == other.level &&
          experience == other.experience &&
          stepsCount == other.stepsCount &&
          runDistance == other.runDistance &&
          cycleDistance == other.cycleDistance &&
          swimDistance == other.swimDistance &&
          listEquals(achievements, other.achievements) &&
          listEquals(completedChallenges, other.completedChallenges) &&
          mapEquals(characterCustomization, other.characterCustomization) &&
          duelsWon == other.duelsWon &&
          duelsLost == other.duelsLost &&
          height == other.height &&
          weight == other.weight &&
          age == other.age &&
          sex == other.sex &&
          mainActivity == other.mainActivity;

  @override
  int get hashCode =>
      id.hashCode ^
      username.hashCode ^
      email.hashCode ^
      photoUrl.hashCode ^
      level.hashCode ^
      experience.hashCode ^
      stepsCount.hashCode ^
      runDistance.hashCode ^
      cycleDistance.hashCode ^
      swimDistance.hashCode ^
      achievements.hashCode ^
      completedChallenges.hashCode ^
      characterCustomization.hashCode ^
      duelsWon.hashCode ^
      duelsLost.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      age.hashCode ^
      sex.hashCode ^
      mainActivity.hashCode;
} 
