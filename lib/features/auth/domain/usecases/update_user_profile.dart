import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:repo_game/core/errors/failures.dart';
import 'package:repo_game/core/usecases/usecase.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';
import 'package:repo_game/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class UpdateUserProfile implements UseCase<User, UpdateUserProfileParams> {
  final AuthRepository repository;

  UpdateUserProfile(this.repository);

  @override
  Future<Either<Failure, User>> call(UpdateUserProfileParams params) {
    return repository.updateUserProfile(
      email: params.email,
      username: params.username,
      height: params.height,
      weight: params.weight,
      age: params.age,
      sex: params.sex,
      mainActivity: params.mainActivity,
    );
  }
}

class UpdateUserProfileParams extends Equatable {
  final String email;
  final String? username;
  final int? height;
  final int? weight;
  final int? age;
  final String? sex;
  final String? mainActivity;

  const UpdateUserProfileParams({
    required this.email,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.sex,
    this.mainActivity,
  });

  @override
  List<Object?> get props => [
        email,
        username,
        height,
        weight,
        age,
        sex,
        mainActivity,
      ];
} 
