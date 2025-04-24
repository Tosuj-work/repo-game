import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';
import 'package:repo_game/features/auth/domain/usecases/get_current_user.dart';
import 'package:repo_game/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:repo_game/features/auth/domain/usecases/sign_out.dart';
import 'package:repo_game/features/auth/domain/usecases/sign_up_with_email.dart';
import 'package:repo_game/features/auth/domain/usecases/update_user_profile.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmail _signInWithEmail;
  final SignUpWithEmail _signUpWithEmail;
  final GetCurrentUser _getCurrentUser;
  final SignOut _signOut;
  final UpdateUserProfile _updateUserProfile;

  AuthBloc({
    required SignInWithEmail signInWithEmail,
    required SignUpWithEmail signUpWithEmail,
    required GetCurrentUser getCurrentUser,
    required SignOut signOut,
    required UpdateUserProfile updateUserProfile,
  })  : _signInWithEmail = signInWithEmail,
        _signUpWithEmail = signUpWithEmail,
        _getCurrentUser = getCurrentUser,
        _signOut = signOut,
        _updateUserProfile = updateUserProfile,
        super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        checkAuth: (event) => _checkAuth(event, emit),
        signInWithEmail: (event) => _onSignInWithEmail(event, emit),
        signUpWithEmail: (event) => _onSignUpWithEmail(event, emit),
        updateUserProfile: (event) => _onUpdateUserProfile(event, emit),
        signOut: (event) => _onSignOut(event, emit),
      );
    });
  }

  Future<void> _checkAuth(_CheckAuth event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _getCurrentUser(NoParams());

    result.fold(
      (failure) => emit(const AuthState.unauthenticated()),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onSignInWithEmail(
      _SignInWithEmail event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _signInWithEmail(SignInWithEmailParams(
      email: event.email,
      password: event.password,
    ));

    result.fold(
      (failure) {
        if (failure.message?.toLowerCase().contains('не найден') == true ||
            failure.message?.toLowerCase().contains('not found') == true ||
            failure.message?.toLowerCase().contains('incorrect') == true) {
          emit(AuthState.userNotFound(event.email));
        } else {
          emit(AuthState.error(failure.message ?? 'Ошибка входа'));
        }
      },
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onSignUpWithEmail(
      _SignUpWithEmail event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _signUpWithEmail(SignUpWithEmailParams(
      email: event.email,
      password: event.password,
      username: event.username,
    ));

    result.fold(
      (failure) => emit(AuthState.error(failure.message ?? 'Ошибка регистрации')),
      (user) => emit(AuthState.authenticated(user)),
    );
  }
  
  Future<void> _onUpdateUserProfile(
      _UpdateUserProfile event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    final result = await _updateUserProfile(UpdateUserProfileParams(
      email: event.email,
      username: event.username,
      height: event.height,
      weight: event.weight,
      age: event.age,
      sex: event.sex,
      mainActivity: event.mainActivity,
    ));
    
    result.fold(
      (failure) => emit(AuthState.error(failure.message ?? 'Ошибка обновления профиля')),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onSignOut(_SignOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _signOut(NoParams());

    result.fold(
      (failure) => emit(AuthState.error(failure.message ?? 'Ошибка выхода')),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
} 
