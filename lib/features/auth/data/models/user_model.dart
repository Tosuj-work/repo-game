import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  
  const factory UserModel({
    required String id,
    required String username,
    required String email,
    String? photoUrl,
    @Default(1) int level,
    @Default(0) int experience,
    @Default(0) int stepsCount,
    @Default(0) int runDistance,
    @Default(0) int cycleDistance,
    @Default(0) int swimDistance,
    @Default([]) List<String> achievements,
    @Default([]) List<String> completedChallenges,
    @Default({}) Map<String, dynamic> characterCustomization,
    @Default(0) int duelsWon,
    @Default(0) int duelsLost,
    int? height,
    int? weight,
    int? age,
    String? sex,
    String? mainActivity,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
      
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      username: user.username,
      email: user.email,
      photoUrl: user.photoUrl,
      level: user.level,
      experience: user.experience,
      stepsCount: user.stepsCount,
      runDistance: user.runDistance,
      cycleDistance: user.cycleDistance,
      swimDistance: user.swimDistance,
      achievements: user.achievements,
      completedChallenges: user.completedChallenges,
      characterCustomization: user.characterCustomization,
      duelsWon: user.duelsWon,
      duelsLost: user.duelsLost,
      height: user.height,
      weight: user.weight,
      age: user.age,
      sex: user.sex,
      mainActivity: user.mainActivity,
    );
  }

  User toEntity() {
    return User(
      id: id,
      username: username,
      email: email,
      photoUrl: photoUrl,
      level: level,
      experience: experience,
      stepsCount: stepsCount,
      runDistance: runDistance,
      cycleDistance: cycleDistance,
      swimDistance: swimDistance,
      achievements: achievements,
      completedChallenges: completedChallenges,
      characterCustomization: characterCustomization,
      duelsWon: duelsWon,
      duelsLost: duelsLost,
      height: height,
      weight: weight,
      age: age,
      sex: sex,
      mainActivity: mainActivity,
    );
  }
} 
