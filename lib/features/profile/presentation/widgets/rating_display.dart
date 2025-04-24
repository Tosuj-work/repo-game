import 'package:flutter/material.dart';
import 'package:repo_game/core/theme/app_theme.dart';

class RatingDisplay extends StatelessWidget {
  final int rating;

  const RatingDisplay({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.ratingBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.textPrimary.withAlpha(51),
          width: 1,
        ),
      ),
      child: Text(
        rating.toString(),
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.ratingText,
        ),
      ),
    );
  }
} 
