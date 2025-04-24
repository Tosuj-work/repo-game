import 'package:dartz/dartz.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/features/duels/domain/entities/duel.dart';

abstract class DuelRepository {
  Future<Either<Failure, List<Duel>>> getActiveDuels();
  Future<Either<Failure, List<Duel>>> getCompletedDuels();
  Future<Either<Failure, List<Duel>>> getPendingDuels();
  Future<Either<Failure, Duel>> getDuelById(String id);
  Future<Either<Failure, Duel>> createDuel({
    required String opponentId, 
    required DuelType type, 
    required DuelActivity activity, 
    required int targetValue,
  });
  Future<Either<Failure, Duel>> acceptDuel(String id);
  Future<Either<Failure, Duel>> rejectDuel(String id);
  Future<Either<Failure, Duel>> cancelDuel(String id);
  Future<Either<Failure, Duel>> updateDuelProgress(String id, int progress);
} 