import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:repo_game/core/utils/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Http client
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioClient(dio: sl()));

  // Core

  // Features - Auth
  // Repositories

  // Data sources

  // Use cases

  // BLoC

  // Features - Profile
  // Repositories

  // Data sources

  // Use cases

  // BLoC

  // Features - Activity
  // Repositories

  // Data sources

  // Use cases

  // BLoC

  // Features - Challenges
  // Repositories

  // Data sources

  // Use cases

  // BLoC

  // Features - Duels
  // Repositories

  // Data sources

  // Use cases

  // BLoC
}
