part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = _CheckAuth;
  
  const factory AuthEvent.signInWithEmail({
    required String email,
    required String password,
  }) = _SignInWithEmail;
  
  const factory AuthEvent.signUpWithEmail({
    required String email,
    required String password,
    required String username,
  }) = _SignUpWithEmail;
  
  const factory AuthEvent.updateUserProfile({
    required String email,
    String? username,
    int? height,
    int? weight,
    int? age,
    String? sex,
    String? mainActivity,
  }) = _UpdateUserProfile;
  
  const factory AuthEvent.signOut() = _SignOut;
} 
