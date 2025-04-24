import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:repo_game/core/di/injectable_config.config.dart';
import 'package:repo_game/core/utils/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  await init(getIt);
}

@module
abstract class RegisterModule {
  // Моковый режим по умолчанию
  @Named('useMockData')
  bool get useMockData => true;
  
  // Dio client
  @lazySingleton
  Dio get dio => Dio();
  
  @lazySingleton
  DioClient get dioClient => DioClient(dio: getIt<Dio>());
} 