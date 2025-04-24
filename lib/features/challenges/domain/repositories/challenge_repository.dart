import 'package:dartz/dartz.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/features/challenges/domain/entities/challenge.dart';

abstract class ChallengeRepository {
  Future<Either<Failure, List<Challenge>>> getActiveChallenges();
  Future<Either<Failure, List<Challenge>>> getCompletedChallenges();
  Future<Either<Failure, Challenge>> getChallengeById(String id);
  Future<Either<Failure, Challenge>> completeChallenge(String id);
  Future<Either<Failure, List<Challenge>>> getDailyChallenges();
  Future<Either<Failure, List<Challenge>>> getWeeklyChallenges();
  Future<Either<Failure, List<Challenge>>> getMonthlyChallenges();
} 