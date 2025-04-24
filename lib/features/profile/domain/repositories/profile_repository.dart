import 'package:dartz/dartz.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> getUserProfile();
  Future<Either<Failure, User>> updateUserProfile(Map<String, dynamic> userData);
  Future<Either<Failure, User>> updateCharacterCustomization(Map<String, dynamic> customization);
  Future<Either<Failure, List<String>>> getUserAchievements();
  Future<Either<Failure, List<Map<String, dynamic>>>> getUserStatistics();
} 