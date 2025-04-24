class AppConstants {
  // API Endpoints (заменим на реальные позже)
  static const String baseUrl = 'https://api.fitness-game.com';

  // Local Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String onboardingCompletedKey = 'onboarding_completed';

  // Activity Types
  static const String walking = 'walking';
  static const String running = 'running';
  static const String cycling = 'cycling';
  static const String swimming = 'swimming';

  // Durations
  static const int splashDuration = 2000; // миллисекунды
  static const int animationDuration = 300; // миллисекунды

  // Challenge Types
  static const String daily = 'daily';
  static const String weekly = 'weekly';
  static const String monthly = 'monthly';
  static const String custom = 'custom';
}

class ErrorMessages {
  static const String generalError = 'Что-то пошло не так. Попробуйте еще раз позже.';
  static const String networkError = 'Проблема с соединением. Проверьте интернет.';
  static const String authError = 'Ошибка авторизации. Пожалуйста, войдите снова.';
  static const String permissionDenied = 'Необходимо разрешение для доступа к данным активности.';
}

class AssetPaths {
  static const String iconBase = 'assets/icons/';
  static const String imageBase = 'assets/images/';
  static const String animationBase = 'assets/animations/';
  
  // Иконки 
  static const String stepIcon = '${iconBase}step.svg';
  static const String runIcon = '${iconBase}run.svg';
  static const String cycleIcon = '${iconBase}cycle.svg';
  static const String swimIcon = '${iconBase}swim.svg';
  static const String trophyIcon = '${iconBase}trophy.svg';
  static const String duelIcon = '${iconBase}duel.svg';
  
  // Изображения персонажей (стоит заменить на реальные)
  static const String defaultAvatar = '${imageBase}default_avatar.png';
} 