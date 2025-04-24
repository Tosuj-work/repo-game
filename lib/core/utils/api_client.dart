import 'dart:convert';
import 'dart:io';

import 'package:repo_game/core/constants/app_constants.dart';
import 'package:repo_game/core/errors/failures.dart';

class ApiClient {
  final bool useMockData;
  
  ApiClient({this.useMockData = true});
  
  Future<Map<String, dynamic>> get(String endpoint) async {
    if (useMockData) {
      return Future.delayed(
        const Duration(milliseconds: 500),
        () => mockResponses[endpoint] ?? {'error': 'Endpoint not found'},
      );
    }
    
    try {
      // Здесь будет реальная реализация после подключения к бэкенду
      final response = await _makeRequest('GET', endpoint);
      return response;
    } on SocketException {
      throw const NetworkFailure(message: ErrorMessages.networkError);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }
  
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    if (useMockData) {
      return Future.delayed(
        const Duration(milliseconds: 700),
        () => {'success': true, 'data': data},
      );
    }
    
    try {
      // Здесь будет реальная реализация после подключения к бэкенду
      final response = await _makeRequest('POST', endpoint, body: data);
      return response;
    } on SocketException {
      throw const NetworkFailure(message: ErrorMessages.networkError);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }
  
  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data) async {
    if (useMockData) {
      return Future.delayed(
        const Duration(milliseconds: 600),
        () => {'success': true, 'data': data},
      );
    }
    
    try {
      // Здесь будет реальная реализация после подключения к бэкенду
      final response = await _makeRequest('PUT', endpoint, body: data);
      return response;
    } on SocketException {
      throw const NetworkFailure(message: ErrorMessages.networkError);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }
  
  Future<Map<String, dynamic>> delete(String endpoint) async {
    if (useMockData) {
      return Future.delayed(
        const Duration(milliseconds: 300),
        () => {'success': true},
      );
    }
    
    try {
      // Здесь будет реальная реализация после подключения к бэкенду
      final response = await _makeRequest('DELETE', endpoint);
      return response;
    } on SocketException {
      throw const NetworkFailure(message: ErrorMessages.networkError);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }
  
  // Имитация запроса для моковых данных
  Future<Map<String, dynamic>> _makeRequest(
    String method, 
    String endpoint, 
    {Map<String, dynamic>? body}
  ) async {
    // Здесь потом будет реальная реализация
    return {'success': true, 'data': body ?? {}};
  }
}

// Моковые данные для разработки
final Map<String, Map<String, dynamic>> mockResponses = {
  '/users/profile': {
    'id': 'user123',
    'username': 'fitness_master',
    'email': 'user@example.com',
    'photoUrl': 'https://i.pravatar.cc/150?img=3',
    'level': 10,
    'experience': 750,
    'stepsCount': 125000,
    'runDistance': 25000,
    'cycleDistance': 50000,
    'swimDistance': 5000,
    'achievements': ['first_steps', 'runner_beginner', 'cycle_master'],
    'completedChallenges': ['daily_steps_10k', 'weekly_run_5k'],
    'characterCustomization': {
      'hair': 'style_1',
      'body': 'athletic',
      'outfit': 'sport_1',
    },
    'duelsWon': 12,
    'duelsLost': 5,
  },
  
  '/challenges/active': {
    'challenges': [
      {
        'id': 'challenge1',
        'title': '10000 шагов',
        'description': 'Пройдите 10000 шагов за день',
        'type': 'daily',
        'activity': 'steps',
        'targetValue': 10000,
        'reward': 100,
        'iconUrl': 'steps_icon.png',
        'startDate': '2024-07-01T00:00:00Z',
        'endDate': '2024-07-01T23:59:59Z',
        'isCompleted': false,
      },
      {
        'id': 'challenge2',
        'title': '5 км бег',
        'description': 'Пробегите 5 км за неделю',
        'type': 'weekly',
        'activity': 'running',
        'targetValue': 5000,
        'reward': 300,
        'iconUrl': 'run_icon.png',
        'startDate': '2024-07-01T00:00:00Z',
        'endDate': '2024-07-07T23:59:59Z',
        'isCompleted': false,
      },
    ],
  },
  
  '/activities/daily': {
    'date': '2024-07-01',
    'activities': {
      'steps': 8765,
      'running': 2000,
      'cycling': 0,
      'swimming': 0,
    },
  },
  
  '/duels/active': {
    'duels': [
      {
        'id': 'duel1',
        'initiatorId': 'user123',
        'opponentId': 'user456',
        'type': 'quick',
        'activity': 'steps',
        'targetValue': 15000,
        'reward': 500,
        'startDate': '2024-07-01T00:00:00Z',
        'endDate': '2024-07-01T23:59:59Z',
        'status': 'active',
        'initiatorProgress': 8765,
        'opponentProgress': 9200,
      },
    ],
  },
  
  '/leaderboard/weekly': {
    'leaderboard': [
      {
        'userId': 'user789',
        'username': 'running_king',
        'level': 15,
        'totalSteps': 150000,
        'photoUrl': 'https://i.pravatar.cc/150?img=7',
      },
      {
        'userId': 'user123',
        'username': 'fitness_master',
        'level': 10,
        'totalSteps': 125000,
        'photoUrl': 'https://i.pravatar.cc/150?img=3',
      },
      {
        'userId': 'user456',
        'username': 'cycler99',
        'level': 8,
        'totalSteps': 100000,
        'photoUrl': 'https://i.pravatar.cc/150?img=5',
      },
    ],
  },
}; 