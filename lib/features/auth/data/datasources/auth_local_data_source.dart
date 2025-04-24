import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:repo_game/core/errors/exceptions.dart';
import 'package:repo_game/features/auth/data/models/user_model.dart';
import 'package:repo_game/features/auth/domain/entities/user.dart';

abstract class AuthDataSource {
  /// Получение текущего пользователя из локального хранилища
  Future<User> getCurrentUser();
  
  /// Вход с email и паролем
  Future<User> signInWithEmail(String email, String password);
  
  /// Регистрация с email и паролем
  Future<User> signUpWithEmail(String email, String password, String username);

  /// Обновление профиля пользователя
  Future<User> updateUserProfile({
    required String email,
    String? username,
    int? height,
    int? weight,
    int? age,
    String? sex,
    String? mainActivity,
  });
  
  /// Выход из системы
  Future<bool> signOut();
}

@LazySingleton(as: AuthDataSource)
class AuthLocalDataSourceImpl implements AuthDataSource {
  final SharedPreferences _prefs;
  
  static const String _currentUserKey = 'current_user';
  static const String _usersKey = 'users';
  
  AuthLocalDataSourceImpl(this._prefs);
  
  @override
  Future<User> getCurrentUser() async {
    final userJson = _prefs.getString(_currentUserKey);
    
    if (userJson == null) {
      throw ServerException('Пользователь не аутентифицирован');
    }
    
    try {
      return UserModel.fromJson(json.decode(userJson)).toEntity();
    } catch (e) {
      throw ServerException('Ошибка при получении данных пользователя: $e');
    }
  }
  
  @override
  Future<User> signInWithEmail(String email, String password) async {
    try {
      // Получаем список пользователей
      final usersJson = _prefs.getString(_usersKey);
      
      if (usersJson == null) {
        throw ServerException('Пользователь не найден');
      }
      
      final List<dynamic> users = json.decode(usersJson);
      
      // Ищем пользователя с указанным email
      final userMap = users.firstWhere(
        (user) => user['email'] == email,
        orElse: () => throw ServerException('Пользователь не найден'),
      );
      
      // Проверяем пароль (только если он передан и не пустой)
      if (password.isNotEmpty && userMap['password'] != password) {
        throw ServerException('Неверный пароль');
      }
      
      // Безопасно преобразуем динамический Map в Map<String, dynamic>
      final Map<String, dynamic> userForSession = {};
      if (userMap is Map) {
        userMap.forEach((key, value) {
          if (key is String) {
            userForSession[key] = value;
          }
        });
      } else {
        throw ServerException('Неверный формат данных пользователя');
      }
      
      // Удаляем пароль из данных пользователя
      userForSession.remove('password');
      
      // Создаем модель пользователя
      try {
        final user = UserModel.fromJson(userForSession);
        
        // Сохраняем текущего пользователя
        final saveSuccess = await _prefs.setString(_currentUserKey, json.encode(userForSession));
        
        if (!saveSuccess) {
          throw ServerException('Не удалось сохранить данные текущего пользователя');
        }
        
        return user.toEntity();
      } catch (e) {
        print('Ошибка при создании модели пользователя: $e');
        print('Данные пользователя: $userForSession');
        throw ServerException('Ошибка преобразования данных пользователя: $e');
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException('Ошибка при входе: ${e.toString()}');
    }
  }
  
  @override
  Future<User> signUpWithEmail(String email, String password, String username) async {
    try {
      // Получаем список пользователей или создаем новый
      final usersJson = _prefs.getString(_usersKey);
      List<dynamic> users = [];
      
      if (usersJson != null) {
        try {
          users = json.decode(usersJson);
          
          // Проверяем, существует ли пользователь с таким email
          final existingUser = users.any((user) => user['email'] == email);
          if (existingUser) {
            throw ServerException('Пользователь с таким email уже существует');
          }
        } catch (e) {
          // Если не удалось декодировать JSON, создаем новый пустой список
          users = [];
          print('Ошибка декодирования JSON списка пользователей: $e');
        }
      }
      
      // Создаем нового пользователя с явным указанием типа
      final Map<String, dynamic> newUser = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'username': username,
        'email': email,
        'password': password, // В реальном приложении пароль должен быть хэширован
        'photoUrl': null,
        'level': 1,
        'experience': 0,
        'stepsCount': 0,
        'runDistance': 0,
        'cycleDistance': 0,
        'swimDistance': 0,
        'achievements': <String>[],
        'completedChallenges': <String>[],
        'characterCustomization': <String, dynamic>{},
        'duelsWon': 0,
        'duelsLost': 0,
        'height': null,
        'weight': null,
        'age': null,
        'sex': null,
        'mainActivity': null,
      };
      
      // Добавляем пользователя в список
      users.add(newUser);
      
      // Сохраняем обновленный список пользователей
      final usersJsonEncoded = json.encode(users);
      final saveSuccess = await _prefs.setString(_usersKey, usersJsonEncoded);
      
      if (!saveSuccess) {
        throw ServerException('Не удалось сохранить данные пользователя');
      }
      
      // Копируем данные пользователя без пароля для хранения текущего пользователя
      final Map<String, dynamic> userForCurrent = Map<String, dynamic>.from(newUser);
      userForCurrent.remove('password');
      
      // Сохраняем текущего пользователя
      final currentUserSaveSuccess = await _prefs.setString(_currentUserKey, json.encode(userForCurrent));
      
      if (!currentUserSaveSuccess) {
        throw ServerException('Не удалось сохранить данные текущего пользователя');
      }
      
      // Создаем модель пользователя
      try {
        final userModel = UserModel.fromJson(userForCurrent);
        return userModel.toEntity();
      } catch (e) {
        print('Ошибка при создании модели пользователя: $e');
        print('Данные пользователя: $userForCurrent');
        throw ServerException('Ошибка преобразования данных пользователя: $e');
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException('Ошибка при регистрации: ${e.toString()}');
    }
  }
  
  @override
  Future<User> updateUserProfile({
    required String email,
    String? username,
    int? height,
    int? weight,
    int? age,
    String? sex,
    String? mainActivity,
  }) async {
    try {
      // Получаем список пользователей
      final usersJson = _prefs.getString(_usersKey);
      
      if (usersJson == null) {
        throw ServerException('Ошибка: список пользователей не найден');
      }
      
      final List<dynamic> users = json.decode(usersJson);
      
      // Ищем индекс пользователя с указанным email
      final int userIndex = users.indexWhere((user) => user['email'] == email);
      
      if (userIndex == -1) {
        throw ServerException('Пользователь не найден');
      }
      
      // Получаем текущие данные пользователя с явным приведением типов
      final Map<String, dynamic> userMap = {};
      
      // Копируем все свойства из исходного объекта в новый Map<String, dynamic>
      final originalUser = users[userIndex];
      if (originalUser is Map) {
        originalUser.forEach((key, value) {
          if (key is String) {
            userMap[key] = value;
          }
        });
      } else {
        throw ServerException('Неверный формат данных пользователя');
      }
      
      // Обновляем данные пользователя
      if (username != null) userMap['username'] = username;
      if (height != null) userMap['height'] = height;
      if (weight != null) userMap['weight'] = weight;
      if (age != null) userMap['age'] = age;
      if (sex != null) userMap['sex'] = sex;
      if (mainActivity != null) userMap['mainActivity'] = mainActivity;
      
      // Обновляем пользователя в списке
      users[userIndex] = userMap;
      
      // Сохраняем обновленный список пользователей
      final saveSuccess = await _prefs.setString(_usersKey, json.encode(users));
      
      if (!saveSuccess) {
        throw ServerException('Не удалось сохранить данные пользователя');
      }
      
      // Копируем данные пользователя без пароля для хранения текущего пользователя
      final Map<String, dynamic> userForCurrent = Map<String, dynamic>.from(userMap);
      userForCurrent.remove('password');
      
      // Сохраняем текущего пользователя
      final currentSaveSuccess = await _prefs.setString(_currentUserKey, json.encode(userForCurrent));
      
      if (!currentSaveSuccess) {
        throw ServerException('Не удалось сохранить данные текущего пользователя');
      }
      
      // Создаем модель пользователя
      try {
        final userModel = UserModel.fromJson(userForCurrent);
        return userModel.toEntity();
      } catch (e) {
        print('Ошибка при создании модели пользователя: $e');
        print('Данные пользователя: $userForCurrent');
        throw ServerException('Ошибка преобразования данных пользователя: $e');
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException('Ошибка при обновлении профиля: ${e.toString()}');
    }
  }
  
  @override
  Future<bool> signOut() async {
    try {
      await _prefs.remove(_currentUserKey);
      return true;
    } catch (e) {
      throw ServerException('Ошибка при выходе: $e');
    }
  }
} 
