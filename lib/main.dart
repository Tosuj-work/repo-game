import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_game/core/di/injectable_config.dart';
import 'package:repo_game/core/router/app_router.dart';
import 'package:repo_game/core/theme/app_theme.dart';
import 'package:repo_game/features/auth/presentation/bloc/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Устанавливаем ориентацию на портретную
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  // Инициализируем зависимости
  await configureDependencies();
  
  runApp(FitnessGameApp());
}

class FitnessGameApp extends StatelessWidget {
  FitnessGameApp({super.key});
  
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: MaterialApp.router(
        title: 'Sport Challenges',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    _checkAuthAndNavigate();
  }
  
  Future<void> _checkAuthAndNavigate() async {
    // Показываем сплеш-экран минимум 2 секунды
    await Future.delayed(const Duration(seconds: 2));
    
    final authBloc = context.read<AuthBloc>();
    
    // Проверяем авторизацию
    authBloc.add(const AuthEvent.checkAuth());
    
    // Слушаем изменения состояния для навигации
    authBloc.stream.listen((state) {
      state.maybeWhen(
        authenticated: (_) {
          // Если пользователь авторизован, переходим на главный экран с табами
          context.router.replace(const MainTabsRoute());
        },
        unauthenticated: () {
          // Если не авторизован, переходим на экран логина
          context.router.replace(const LoginRoute());
        },
        // В других случаях ничего не делаем, продолжаем показывать сплеш
        orElse: () {},
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Лого
            Icon(
              Icons.terrain, // Используем иконку из дизайна
              size: 100,
              color: AppColors.primary,
            ),
            const SizedBox(height: 20),
            Text(
              'SPORT CHALLENGES',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
