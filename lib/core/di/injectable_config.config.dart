// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/auth_local_data_source.dart'
    as _i852;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/get_current_user.dart' as _i111;
import '../../features/auth/domain/usecases/sign_in_with_email.dart' as _i485;
import '../../features/auth/domain/usecases/sign_out.dart' as _i568;
import '../../features/auth/domain/usecases/sign_up_with_email.dart' as _i460;
import '../../features/auth/domain/usecases/update_user_profile.dart' as _i901;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../utils/dio_client.dart' as _i695;
import 'injectable_config.dart' as _i404;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i695.DioClient>(() => registerModule.dioClient);
  gh.lazySingleton<_i852.AuthDataSource>(
      () => _i852.AuthLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i852.AuthDataSource>()));
  gh.factory<bool>(
    () => registerModule.useMockData,
    instanceName: 'useMockData',
  );
  gh.factory<_i568.SignOut>(() => _i568.SignOut(gh<_i787.AuthRepository>()));
  gh.factory<_i111.GetCurrentUser>(
      () => _i111.GetCurrentUser(gh<_i787.AuthRepository>()));
  gh.factory<_i485.SignInWithEmail>(
      () => _i485.SignInWithEmail(gh<_i787.AuthRepository>()));
  gh.factory<_i460.SignUpWithEmail>(
      () => _i460.SignUpWithEmail(gh<_i787.AuthRepository>()));
  gh.lazySingleton<_i901.UpdateUserProfile>(
      () => _i901.UpdateUserProfile(gh<_i787.AuthRepository>()));
  gh.factory<_i797.AuthBloc>(() => _i797.AuthBloc(
        signInWithEmail: gh<_i485.SignInWithEmail>(),
        signUpWithEmail: gh<_i460.SignUpWithEmail>(),
        getCurrentUser: gh<_i111.GetCurrentUser>(),
        signOut: gh<_i568.SignOut>(),
        updateUserProfile: gh<_i901.UpdateUserProfile>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i404.RegisterModule {}
