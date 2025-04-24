import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel.freezed.dart';
part 'duel.g.dart';

@freezed
class Duel with _$Duel {
  const factory Duel({
    required String id,
    required String initiatorId,
    required String opponentId,
    required DuelType type,
    required DuelActivity activity,
    required int targetValue,
    required int reward, // опыт победителю
    required DateTime startDate,
    required DateTime endDate,
    @Default(DuelStatus.pending) DuelStatus status,
    @Default(0) int initiatorProgress,
    @Default(0) int opponentProgress,
    String? winnerId,
  }) = _Duel;

  factory Duel.fromJson(Map<String, dynamic> json) => _$DuelFromJson(json);

  const Duel._();
  
  bool get isActive => status == DuelStatus.active;
  
  bool get isComplete => status == DuelStatus.completed;
  
  bool get isCancelled => status == DuelStatus.cancelled;
  
  bool get isPending => status == DuelStatus.pending;
  
  // Является ли текущий пользователь инициатором дуэли
  bool isInitiator(String userId) => initiatorId == userId;
  
  // Прогресс текущего пользователя
  int getUserProgress(String userId) => 
      isInitiator(userId) ? initiatorProgress : opponentProgress;
  
  // Прогресс оппонента
  int getOpponentProgress(String userId) => 
      isInitiator(userId) ? opponentProgress : initiatorProgress;
  
  // Выиграл ли текущий пользователь
  bool isWinner(String userId) => winnerId == userId;
}

enum DuelType {
  quick, // быстрая дуэль (на день)
  standard, // на 3 дня
  extended, // на неделю
  custom, // кастомный период
}

enum DuelActivity {
  steps,
  running,
  cycling,
  swimming,
}

enum DuelStatus {
  pending, // ожидание принятия вызова
  active, // активная дуэль
  completed, // завершенная
  cancelled, // отмененная
} 