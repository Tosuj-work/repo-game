import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_game/core/theme/app_theme.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';
import 'package:repo_game/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:repo_game/features/profile/presentation/widgets/achievement_badge.dart';
import 'package:repo_game/features/profile/presentation/widgets/challenge_progress_card.dart';
import 'package:repo_game/features/profile/presentation/widgets/character_avatar_selection.dart';
import 'package:repo_game/features/profile/presentation/widgets/rating_display.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedAvatarIndex = 0;
  final List<IconData> _avatarOptions = [
    Icons.person,
    Icons.face,
    Icons.face_retouching_natural,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            authenticated: (user) => _buildProfileContent(context, user),
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Вы не авторизованы'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(const AuthEvent.checkAuth());
                    },
                    child: const Text('Обновить'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, User user) {
    // Рассчитываем рейтинг (здесь можно использовать реальный алгоритм)
    final int rating = user.level * 100 + user.experience + user.stepsCount ~/ 10;
    
    // Прогресс для челленджей
    final stepsProgress = (user.stepsCount / 25000).clamp(0.0, 1.0);
    final runProgress = (user.runDistance / 30000).clamp(0.0, 1.0); // 30км в метрах
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40), // Safe area padding
          
          // Имя пользователя (крупным шрифтом)
          Text(
            user.username.toUpperCase(),
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.1,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Character Customization
          const Text(
            'Character\nCustomization',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.1,
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Avatar Selection
          CharacterAvatarSelection(
            avatarOptions: _avatarOptions,
            selectedIndex: _selectedAvatarIndex,
            onAvatarSelected: (index) {
              setState(() {
                _selectedAvatarIndex = index;
              });
            },
          ),
          
          const SizedBox(height: 24),
          
          // Rating
          const Text(
            'Rating',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          
          const SizedBox(height: 12),
          
          RatingDisplay(rating: rating),
          
          const SizedBox(height: 24),
          
          // Achievements
          const Text(
            'Achievements',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          
          const SizedBox(height: 12),
          
          Row(
            children: [
              const AchievementBadge(icon: Icons.thumb_up),
              const SizedBox(width: 16),
              const AchievementBadge(icon: Icons.local_fire_department),
              const SizedBox(width: 16),
              AchievementBadge(
                icon: Icons.directions_bike,
                isUnlocked: user.cycleDistance > 5000,
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // My Challenges
          const Text(
            'My Challenges',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          
          const SizedBox(height: 12),
          
          ChallengeProgressCard(
            title: 'Weekly Steps',
            progress: user.stepsCount.toString(),
            target: '25,000',
            icon: Icons.directions_walk,
            progressValue: stepsProgress,
            progressColor: AppColors.walking,
          ),
          
          const SizedBox(height: 16),
          
          ChallengeProgressCard(
            title: 'Distance Run',
            progress: '${user.runDistance / 1000}',
            target: '30 km',
            icon: Icons.directions_run,
            progressValue: runProgress,
            progressColor: AppColors.running,
          ),
          
          const SizedBox(height: 40),
          
          // Место для персонажа
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              border: Border.all(
                color: AppColors.textPrimary.withAlpha(51),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Здесь будет персонаж',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
