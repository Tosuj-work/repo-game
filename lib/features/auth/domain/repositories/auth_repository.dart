import 'package:dartz/dartz.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithEmail(String email, String password);
  Future<Either<Failure, User>> signUpWithEmail(String email, String password, String username);
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, bool>> signOut();
  Future<Either<Failure, bool>> isSignedIn();
  Future<Either<Failure, String>> getCurrentUserId();
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, bool>> sendPasswordResetEmail(String email);
  
  Future<Either<Failure, User>> updateUserProfile({
    required String email,
    String? username,
    int? height,
    int? weight,
    int? age,
    String? sex,
    String? mainActivity,
  });
} 
