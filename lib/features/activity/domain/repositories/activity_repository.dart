import 'package:dartz/dartz.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/features/activity/domain/entities/activity.dart';

abstract class ActivityRepository {
  Future<Either<Failure, Activity>> recordActivity(ActivityType type, int value);
  Future<Either<Failure, DailyActivity>> getDailyActivity(DateTime date);
  Future<Either<Failure, List<DailyActivity>>> getWeeklyActivities(DateTime startDate);
  Future<Either<Failure, List<DailyActivity>>> getMonthlyActivities(DateTime startDate);
  Future<Either<Failure, int>> getTotalSteps();
  Future<Either<Failure, int>> getTotalRunDistance();
  Future<Either<Failure, int>> getTotalCycleDistance();
  Future<Either<Failure, int>> getTotalSwimDistance();
  Future<Either<Failure, bool>> syncActivitiesWithHealthData();
} 