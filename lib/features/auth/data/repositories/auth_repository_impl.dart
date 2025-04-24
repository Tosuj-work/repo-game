import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:repo_game/core/errors/exceptions.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';
import 'package:repo_game/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await dataSource.getCurrentUser();
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmail(
      String email, String password) async {
    try {
      final user = await dataSource.signInWithEmail(email, password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmail(
      String email, String password, String username) async {
    try {
      final user = await dataSource.signUpWithEmail(email, password, username);
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    return Left(Failure.auth(message: 'Вход через Google не реализован в локальной версии'));
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      final result = await dataSource.signOut();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, bool>> isSignedIn() async {
    try {
      await dataSource.getCurrentUser();
      return const Right(true);
    } catch (e) {
      return const Right(false);
    }
  }
  
  @override
  Future<Either<Failure, String>> getCurrentUserId() async {
    try {
      final user = await dataSource.getCurrentUser();
      return Right(user.id);
    } catch (e) {
      return Left(Failure.auth(message: 'Пользователь не авторизован'));
    }
  }
  
  @override
  Future<Either<Failure, bool>> sendPasswordResetEmail(String email) async {
    return Left(Failure.auth(message: 'Функция сброса пароля не реализована в локальной версии'));
  }
  
  @override
  Future<Either<Failure, User>> updateUserProfile({
    required String email,
    String? username,
    int? height,
    int? weight,
    int? age,
    String? sex,
    String? mainActivity,
  }) async {
    try {
      final user = await dataSource.updateUserProfile(
        email: email,
        username: username,
        height: height,
        weight: weight,
        age: age,
        sex: sex,
        mainActivity: mainActivity,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }
} 
