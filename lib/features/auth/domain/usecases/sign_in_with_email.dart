import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';
import 'package:repo_game/features/auth/domain/repositories/auth_repository.dart';

part 'sign_in_with_email.freezed.dart';

@injectable
class SignInWithEmail {
  final AuthRepository repository;

  SignInWithEmail(this.repository);

  Future<Either<Failure, User>> call(SignInWithEmailParams params) async {
    return await repository.signInWithEmail(params.email, params.password);
  }
}

@freezed
class SignInWithEmailParams with _$SignInWithEmailParams {
  const factory SignInWithEmailParams({
    required String email,
    required String password,
  }) = _SignInWithEmailParams;
} 