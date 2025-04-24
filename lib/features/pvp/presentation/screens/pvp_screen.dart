import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repo_game/core/theme/app_theme.dart';

@RoutePage()
class PvpScreen extends StatelessWidget {
  const PvpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_kabaddi,
              size: 80,
              color: AppColors.textPrimary,
            ),
            const SizedBox(height: 24),
            const Text(
              'PVP Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Здесь будут дуэли и соревнования с другими игроками',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
