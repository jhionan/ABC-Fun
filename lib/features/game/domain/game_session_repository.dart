import 'package:abc_fun/core/db/schemas/game_session_dto.dart';

abstract interface class GameSessionRepository {
  Future<List<GameSessionDto>>? getAll();
  Future<void> insert(GameSessionDto item);
  Stream<void> onDbChanged();
}
