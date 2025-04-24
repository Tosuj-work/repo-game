import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class AchievementList extends StatelessWidget {
  const AchievementList({super.key});

  @override
  Widget build(BuildContext context) {
    // Данные достижений (в реальном приложении должны приходить из репозитория)
    final achievements = [
      Achievement(
        name: 'Первые шаги',
        description: 'Пройти 5000 шагов за день',
        icon: Icons.directions_walk,
        color: AppColors.walking,
        progress: 1.0, // 100% завершено
        isUnlocked: true,
      ),
      Achievement(
        name: 'Марафонец',
        description: 'Пробежать 5 км',
        icon: Icons.directions_run,
        color: AppColors.running,
        progress: 0.8, // 80% завершено
        isUnlocked: true,
      ),
      Achievement(
        name: 'Велогонщик',
        description: 'Проехать 10 км на велосипеде',
        icon: Icons.directions_bike,
        color: AppColors.cycling,
        progress: 0.6, // 60% завершено
        isUnlocked: true,
      ),
      Achievement(
        name: 'Пловец',
        description: 'Проплыть 1 км',
        icon: Icons.pool,
        color: AppColors.swimming,
        progress: 0.3, // 30% завершено
        isUnlocked: false,
      ),
      Achievement(
        name: 'Огонь',
        description: 'Активность 7 дней подряд',
        icon: Icons.local_fire_department,
        color: Colors.orange,
        progress: 0.4, // 40% завершено
        isUnlocked: false,
      ),
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        final achievement = achievements[index];
        return AchievementCard(achievement: achievement);
      },
    );
  }
}

class AchievementCard extends StatelessWidget {
  final Achievement achievement;

  const AchievementCard({
    super.key,
    required this.achievement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: achievement.isUnlocked 
              ? achievement.color.withOpacity(0.5)
              : AppColors.textPrimary.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          if (achievement.isUnlocked)
            BoxShadow(
              color: achievement.color.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 1,
            ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: achievement.isUnlocked
                  ? achievement.color.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              achievement.icon,
              color: achievement.isUnlocked
                  ? achievement.color
                  : Colors.grey,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            achievement.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: achievement.isUnlocked
                  ? AppColors.textPrimary
                  : AppColors.textPrimary.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              achievement.description,
              style: TextStyle(
                fontSize: 10,
                color: achievement.isUnlocked
                    ? AppColors.textSecondary
                    : AppColors.textSecondary.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: LinearProgressIndicator(
              value: achievement.progress,
              backgroundColor: Colors.grey.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                achievement.isUnlocked ? achievement.color : Colors.grey,
              ),
              minHeight: 4,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${(achievement.progress * 100).toInt()}%',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: achievement.isUnlocked
                  ? achievement.color
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class Achievement {
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final double progress;
  final bool isUnlocked;

  Achievement({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.progress,
    required this.isUnlocked,
  });
} 
