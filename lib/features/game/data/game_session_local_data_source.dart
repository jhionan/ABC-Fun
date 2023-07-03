import 'package:abc_fun/core/db/daos/game_session_dao.dart';
import 'package:abc_fun/core/db/schemas/game_session_dto.dart';
import 'package:abc_fun/features/game/domain/game_session_repository.dart';

class GameSessionLocalDataSouce implements GameSessionRepository {
  GameSessionLocalDataSouce(this.gameSessionDao);
  final GameSessionDao gameSessionDao;

  @override
  Future<List<GameSessionDto>>? getAll() async {
    return await gameSessionDao.getAllItems();
  }

  @override
  Future<void> insert(GameSessionDto item) async {
    await gameSessionDao.insert(item);
  }
}
