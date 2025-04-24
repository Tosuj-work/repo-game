import 'package:flutter/material.dart';
import 'package:repo_game/core/theme/app_theme.dart';

class AchievementBadge extends StatelessWidget {
  final IconData icon;
  final bool isUnlocked;

  const AchievementBadge({
    super.key,
    required this.icon,
    this.isUnlocked = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: isUnlocked ? AppColors.achievementBg : AppColors.achievementBg.withAlpha(76),
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.textPrimary.withAlpha(51),
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        color: isUnlocked ? AppColors.achievementText : AppColors.achievementText.withAlpha(128),
        size: 28,
      ),
    );
  }
} 
