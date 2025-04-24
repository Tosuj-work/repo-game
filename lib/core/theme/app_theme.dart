import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary colors
  static const primary = Color(0xFF003049);
  static const secondary = Color(0xFF1696A1);
  static const accent = Color(0xFFF9B64B);
  
  // Button colors
  static const buttonPrimary = Color(0xFFF9B64B);
  
  // Background colors
  static const background = Color(0xFFFFF8E1);
  static const cardBackground = Color(0xFFFFFFE0);
  static const progressBackground = Color(0xFFE0E0E0);
  
  // Text colors
  static const textPrimary = Color(0xFF003049);
  static const textSecondary = Color(0xFF6C757D);
  
  // Activity colors
  static const walking = Color(0xFF003049);
  static const running = Color(0xFFF9B64B);
  static const cycling = Color(0xFFF3722C);
  static const swimming = Color(0xFF277DA1);
  
  // Achievement colors
  static const achievementBg = Color(0xFFF9B64B);
  static const achievementText = Color(0xFF003049);
  
  // Rating colors
  static const ratingBg = Color(0xFFF9B64B);
  static const ratingText = Color(0xFF003049);
  
  // Status colors
  static const success = Color(0xFF28A745);
  static const warning = Color(0xFFFFC107);
  static const error = Color(0xFFDC3545);
  static const info = Color(0xFF17A2B8);
  
  // Character customization colors
  static const List<Color> shirtColors = [
    Color(0xFF2196F3), // Blue
    Color(0xFFE91E63), // Pink
    Color(0xFF4CAF50), // Green
    Color(0xFFFF9800), // Orange
    Color(0xFF9C27B0), // Purple
    Color(0xFFFF5252), // Red
    Color(0xFF795548), // Brown
  ];
  
  static const List<Color> pantsColors = [
    Color(0xFF455A64), // Dark Blue-Grey
    Color(0xFF212121), // Near Black
    Color(0xFF607D8B), // Blue-Grey
    Color(0xFF5D4037), // Brown
    Color(0xFF3F51B5), // Indigo
    Color(0xFF009688), // Teal
  ];

  static const List<Color> hairColors = [
    Color(0xFF000000), // Black
    Color(0xFF795548), // Brown
    Color(0xFFD7CCC8), // Light Grey/Blonde
    Color(0xFFFF5722), // Red/Orange
    Color(0xFFFFA000), // Blonde
    Color(0xFF8D6E63), // Dark Brown
    Color(0xFF37474F), // Dark Grey
  ];

  static const List<Color> skinColors = [
    Color(0xFFFFDBB6), // Light
    Color(0xFFF1C27D), // Light-Medium
    Color(0xFFE0AC69), // Medium
    Color(0xFFC68642), // Medium-Dark
    Color(0xFF8D5524), // Dark
  ];

  static const List<Color> accessoryColors = [
    Color(0xFFFFD700), // Gold
    Color(0xFFC0C0C0), // Silver
    Color(0xFF00BCD4), // Cyan
    Color(0xFFFFEB3B), // Yellow
    Color(0xFFCDDC39), // Lime
    Color(0xFF673AB7), // Deep Purple
  ];
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.background,
      error: AppColors.error,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      displayLarge: const TextStyle(color: AppColors.textPrimary),
      displayMedium: const TextStyle(color: AppColors.textPrimary),
      displaySmall: const TextStyle(color: AppColors.textPrimary),
      headlineLarge: const TextStyle(color: AppColors.textPrimary),
      headlineMedium: const TextStyle(color: AppColors.textPrimary),
      headlineSmall: const TextStyle(color: AppColors.textPrimary),
      titleLarge: const TextStyle(color: AppColors.textPrimary),
      titleMedium: const TextStyle(color: AppColors.textPrimary),
      titleSmall: const TextStyle(color: AppColors.textPrimary),
      bodyLarge: const TextStyle(color: AppColors.textPrimary),
      bodyMedium: const TextStyle(color: AppColors.textPrimary),
      bodySmall: const TextStyle(color: AppColors.textSecondary),
      labelLarge: const TextStyle(color: AppColors.textPrimary),
      labelMedium: const TextStyle(color: AppColors.textPrimary),
      labelSmall: const TextStyle(color: AppColors.textSecondary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardBackground,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      hintStyle: const TextStyle(color: AppColors.textSecondary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: AppColors.textPrimary,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.cardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.primary),
      titleTextStyle: GoogleFonts.poppins(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.background,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return AppColors.cardBackground;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return AppColors.textSecondary;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return Colors.white;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary.withOpacity(0.5);
        }
        return AppColors.textSecondary.withOpacity(0.5);
      }),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.cardBackground,
      thickness: 1,
      space: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.textPrimary,
      contentTextStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
} 
