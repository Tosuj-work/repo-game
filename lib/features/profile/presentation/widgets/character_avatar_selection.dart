import 'package:flutter/material.dart';
import 'package:repo_game/core/theme/app_theme.dart';

class CharacterAvatarSelection extends StatelessWidget {
  final List<IconData> avatarOptions;
  final int selectedIndex;
  final Function(int) onAvatarSelected;

  const CharacterAvatarSelection({
    super.key,
    required this.avatarOptions,
    required this.selectedIndex,
    required this.onAvatarSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        avatarOptions.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () => onAvatarSelected(index),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedIndex == index
                      ? AppColors.textPrimary
                      : AppColors.textPrimary.withAlpha(51),
                  width: selectedIndex == index ? 2 : 1,
                ),
              ),
              child: Icon(
                avatarOptions[index],
                color: AppColors.textPrimary,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
} 
