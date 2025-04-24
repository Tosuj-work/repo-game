import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';
import 'package:repo_game/features/auth/domain/repositories/auth_repository.dart';

part 'sign_up_with_email.freezed.dart';

@injectable
class SignUpWithEmail {
  final AuthRepository repository;

  SignUpWithEmail(this.repository);

  Future<Either<Failure, User>> call(SignUpWithEmailParams params) async {
    return await repository.signUpWithEmail(
      params.email,
      params.password,
      params.username,
    );
  }
}

@freezed
class SignUpWithEmailParams with _$SignUpWithEmailParams {
  const factory SignUpWithEmailParams({
    required String email,
    required String password,
    required String username,
  }) = _SignUpWithEmailParams;
} 