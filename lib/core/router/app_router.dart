import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:repo_game/features/auth/presentation/screens/login_screen.dart';
import 'package:repo_game/features/auth/presentation/screens/register_screen.dart';
import 'package:repo_game/features/challenges/presentation/screens/challenges_screen.dart';
import 'package:repo_game/features/home/presentation/screens/home_screen.dart';
import 'package:repo_game/features/navigation/presentation/screens/main_tabs_screen.dart';
import 'package:repo_game/features/profile/presentation/screens/profile_screen.dart';
import 'package:repo_game/features/pvp/presentation/screens/pvp_screen.dart';
import 'package:repo_game/main.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    // Auth Routes
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
    
    // Main Routes
    AutoRoute(page: SplashRoute.page, initial: true),
    
    // Main app routes
    AutoRoute(page: MainTabsRoute.page, path: '/main'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: ChallengesRoute.page, path: '/challenges'),
    AutoRoute(page: PvpRoute.page, path: '/pvp'),
    AutoRoute(page: ProfileRoute.page, path: '/profile'),
    
    // Redirect all other routes to main tabs
    RedirectRoute(path: '*', redirectTo: '/main'),
  ];
} 
