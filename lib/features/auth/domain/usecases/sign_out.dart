import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/features/auth/domain/repositories/auth_repository.dart';
import 'package:repo_game/features/auth/domain/usecases/get_current_user.dart';

@injectable
class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.signOut();
  }
} 