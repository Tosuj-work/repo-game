import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';
import 'package:repo_game/features/auth/domain/repositories/auth_repository.dart';

@injectable
class GetCurrentUser {
  final AuthRepository repository;

  GetCurrentUser(this.repository);

  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getCurrentUser();
  }
}

class NoParams {} 