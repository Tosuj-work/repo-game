import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/character_display.dart';
import '../widgets/character_customization.dart';
import '../widgets/achievement_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _playerName = "Рик";
  String _playerNumber = "42";
  bool _isCustomizing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Профиль игрока'),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: Icon(_isCustomizing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                _isCustomizing = !_isCustomizing;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Карточка персонажа
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 220,
                      child: CharacterDisplay(
                        name: _playerName,
                        number: _playerNumber,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _playerName,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Игрок #$_playerNumber',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStatItem(Icons.trending_up, '2400', 'Очки'),
                        _buildStatItem(Icons.emoji_events, '12', 'Ачивки'),
                        _buildStatItem(Icons.person_add, '35', 'Друзья'),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),

              // Настройки персонажа (появляются только в режиме редактирования)
              if (_isCustomizing)
                CharacterCustomization(
                  initialName: _playerName,
                  initialNumber: _playerNumber,
                  onCustomizationChanged: (name, number) {
                    setState(() {
                      _playerName = name;
                      _playerNumber = number;
                    });
                  },
                ),
              
              const SizedBox(height: 24),
              
              // Раздел достижений
              Text(
                'Мои достижения',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const AchievementList(), // Предполагается, что этот виджет уже существует
              
              const SizedBox(height: 24),
              
              // Активности и статистика
              Text(
                'Активность',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _buildActivityCard(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildStatItem(IconData icon, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.accent,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildActivityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          _buildActivityRow(Icons.directions_walk, 'Шаги', '8,745', AppColors.walking),
          const Divider(),
          _buildActivityRow(Icons.directions_run, 'Бег', '3.2 км', AppColors.running),
          const Divider(),
          _buildActivityRow(Icons.directions_bike, 'Велосипед', '12.5 км', AppColors.cycling),
          const Divider(),
          _buildActivityRow(Icons.pool, 'Плавание', '0.5 км', AppColors.swimming),
        ],
      ),
    );
  }
  
  Widget _buildActivityRow(IconData icon, String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
} 
