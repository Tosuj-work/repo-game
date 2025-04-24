import 'package:dartz/dartz.dart';
import 'package:repo_game/core/errors/failures.dart';

/// Абстрактный класс для всех юзкейсов приложения
/// [Type] - тип возвращаемого значения
/// [Params] - тип параметров, который принимает юзкейс
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Используется когда юзкейс не требует никаких параметров
class NoParams {} 
